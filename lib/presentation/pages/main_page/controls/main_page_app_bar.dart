// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/todo/todo_watcher/todo_watcher_bloc.dart';
import '../../../services/s.dart';
import '../../../services/theming/theme_extension.dart';

class MainPageAppBar extends StatelessWidget {
  final int completedCount;

  const MainPageAppBar({
    super.key,
    required this.completedCount,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverPersistentHeaderDelegate(
        topBarPadding: MediaQuery.of(context).padding.top,
        expandedHeight: 175,
        title: S.of(context).myTodos,
        subtitle: '${S.of(context).completed} - $completedCount',
      ),
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double topBarPadding;
  final double expandedHeight;
  final String title;
  final String subtitle;

  const _SliverPersistentHeaderDelegate({
    required this.topBarPadding,
    required this.expandedHeight,
    required this.title,
    required this.subtitle,
  });

  static const double _minSpace = 16.0;
  static const double _maxTextOffset = 60.0 - _minSpace;
  static const double _maxElevation = 4.0;
  static const double _maxIconOffset = 6.0;
  static const double _titleAndSubtitleSpace = 6.0;

  static const double _elevationAnimationMultiplier = 3.0;
  static const double _subtitleOpacityAnimationMultiplier = 2.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final animationValue = _scrollAnimationValue(shrinkOffset);

    return Material(
      color: _calculateBackgroundColor(context, animationValue),
      elevation: _calculateElevation(animationValue),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildIconButton(animationValue),
          _buildSubtitle(context, animationValue),
          _buildTitle(context, animationValue),
        ],
      ),
    );
  }

  Positioned _buildIconButton(double animationValue) {
    return Positioned(
      bottom: _minSpace,
      right: _calculateSpace(_maxIconOffset, animationValue),
      child: const _VisibilityIconButton(),
    );
  }

  Positioned _buildSubtitle(BuildContext context, double animationValue) {
    final theme = Theme.of(context);

    final leftSpace = _calculateLeftSpace(animationValue);
    final opacity = _calculateSubtitleOpacity(animationValue);

    return Positioned(
      bottom: _minSpace,
      left: leftSpace,
      child: Opacity(
        opacity: opacity,
        child: Text(
          subtitle,
          style: theme.textTheme.subtitle1?.copyWith(
            color: theme.paletteController!.labelTertiary,
          ),
        ),
      ),
    );
  }

  Positioned _buildTitle(BuildContext context, double animationValue) {
    final textTheme = Theme.of(context).textTheme;

    final titleStyle = _calculateTitleTextStyle(context, animationValue);
    final bottomOffset =
        textTheme.subtitle1!.fontSize! + _titleAndSubtitleSpace;
    final bottomSpace = _calculateSpace(bottomOffset, animationValue);
    final leftSpace = _calculateLeftSpace(animationValue);

    return Positioned(
      bottom: bottomSpace,
      left: leftSpace,
      child: Text(
        title,
        style: titleStyle,
      ),
    );
  }

  double _scrollAnimationValue(double shrinkOffset) {
    final maxScrollAllowed = maxExtent - minExtent;
    return ((maxScrollAllowed - shrinkOffset) / maxScrollAllowed).clamp(0, 1);
  }

  double _calculateElevation(double animationValue) =>
      _maxElevation *
      // Inverse animation
      (1 - (animationValue * _elevationAnimationMultiplier)).clamp(0, 1);

  Color? _calculateBackgroundColor(
    BuildContext context,
    double animationValue,
  ) {
    final theme = Theme.of(context);

    final fromColor = theme.appBarTheme.backgroundColor;
    final toColor = theme.scaffoldBackgroundColor;

    return Color.lerp(fromColor, toColor, animationValue);
  }

  double _calculateLeftSpace(double animationValue) =>
      _calculateSpace(_maxTextOffset, animationValue);

  double _calculateSpace(double offset, double animationValue) =>
      _minSpace + offset * animationValue;

  double _calculateSubtitleOpacity(double animationValue) =>
      (animationValue * _subtitleOpacityAnimationMultiplier - 1).clamp(0, 1);

  TextStyle _calculateTitleTextStyle(
    BuildContext context,
    double animationValue,
  ) {
    final textTheme = Theme.of(context).textTheme;

    final titleStyleTween = TextStyleTween(
      begin: textTheme.headline6,
      end: textTheme.headline5,
    );

    return titleStyleTween.lerp(animationValue);
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + topBarPadding;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    if (oldDelegate is! _SliverPersistentHeaderDelegate) return false;

    return title != oldDelegate.title ||
        subtitle != oldDelegate.subtitle ||
        topBarPadding != oldDelegate.topBarPadding ||
        expandedHeight != oldDelegate.expandedHeight;
  }
}

class _VisibilityIconButton extends StatelessWidget {
  const _VisibilityIconButton({super.key});

  static const double _iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoWatcherBloc, TodoWatcherState>(
      builder: (context, state) {
        return IconButton(
          splashRadius: _iconSize,
          constraints: BoxConstraints.tight(const Size.square(_iconSize)),
          padding: EdgeInsets.zero,
          color: Theme.of(context).paletteController!.colorBlue,
          icon: Icon(
            state.hideCompleted ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () => context
              .read<TodoWatcherBloc>()
              .add(const TodoWatcherEvent.completedVisibilityChanged()),
        );
      },
    );
  }
}
