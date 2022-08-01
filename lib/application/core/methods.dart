import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<T> debounce<T>(
  Duration duration,
) =>
    (events, mapper) => events.debounce(duration).switchMap(mapper);
