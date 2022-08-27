// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i5;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i6;
import 'package:flutter/widgets.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/todo/add_todo/add_todo_bloc.dart' as _i24;
import 'application/todo/todo_form/todo_form_bloc.dart' as _i21;
import 'application/todo/todo_watcher/todo_watcher_bloc.dart' as _i23;
import 'domain/core/services/i_device_id_provider.dart' as _i7;
import 'domain/todo/i_todo_local_data_source.dart' as _i10;
import 'domain/todo/i_todo_remote_data_source.dart' as _i12;
import 'domain/todo/i_todo_repository.dart' as _i14;
import 'infrastructure/core/register_modules/dio_register_module.dart' as _i25;
import 'infrastructure/core/register_modules/firebase_register_module.dart'
    as _i26;
import 'infrastructure/core/services/device_info_provider.dart' as _i8;
import 'infrastructure/todo/hive_todo_local_data_source.dart' as _i11;
import 'infrastructure/todo/todo_repository.dart' as _i15;
import 'infrastructure/todo/yandex_backend_todo_remote_data_source.dart'
    as _i13;
import 'presentation/services/navigating/delegate.dart' as _i22;
import 'presentation/services/navigating/delegate_register_model.dart' as _i27;
import 'presentation/services/navigating/i_navigation_controller.dart' as _i9;
import 'presentation/services/navigating/parser.dart' as _i19;
import 'presentation/services/navigating/state_dto.dart' as _i18;
import 'presentation/services/theming/dark_palette_controller.dart' as _i3;
import 'presentation/services/theming/light_palette_controller.dart' as _i16;
import 'presentation/services/theming/theme_controller.dart'
    as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioRegisterModule = _$DioRegisterModule();
  final firebaseRegisterModule = _$FirebaseRegisterModule();
  final delegateRegisterModule = _$DelegateRegisterModule();
  gh.lazySingleton<_i3.DarkPaletteController>(
      () => _i3.DarkPaletteController());
  gh.lazySingleton<_i4.Dio>(() => dioRegisterModule.dio);
  gh.lazySingleton<_i5.FirebaseCrashlytics>(
      () => firebaseRegisterModule.firebaseCrashlytics);
  gh.lazySingleton<_i6.FirebaseRemoteConfig>(
      () => firebaseRegisterModule.firebaseRemoteConfig);
  gh.lazySingleton<_i7.IDeviceIdProvider>(() => _i8.DeviceInfoProvider());
  gh.lazySingleton<_i9.INavigationController>(
      () => delegateRegisterModule.controller);
  gh.lazySingleton<_i10.ITodoLocalDataSource>(
      () => _i11.HiveTodoLocalDataSource());
  gh.lazySingleton<_i12.ITodoRemoteDataSource>(
      () => _i13.YandexBackendTodoRemoteDataSource(get<_i4.Dio>()));
  gh.lazySingleton<_i14.ITodoRepository>(() => _i15.TodoRepository(
      get<_i10.ITodoLocalDataSource>(),
      get<_i12.ITodoRemoteDataSource>(),
      get<_i7.IDeviceIdProvider>()));
  gh.lazySingleton<_i16.LightPaletteController>(
      () => _i16.LightPaletteController());
  gh.lazySingleton<_i17.RouteInformationParser<_i18.NavigationStateDto>>(
      () => _i19.TodoRouteInformationParser());
  gh.lazySingleton<_i17.RouterDelegate<_i18.NavigationStateDto>>(
      () => delegateRegisterModule.delegate);
  gh.lazySingleton<_i20.ThemeController>(() => _i20.ThemeController(
      get<_i16.LightPaletteController>(), get<_i3.DarkPaletteController>()));
  gh.factory<_i21.TodoFormBloc>(
      () => _i21.TodoFormBloc(get<_i14.ITodoRepository>()));
  gh.lazySingleton<_i22.TodoRouterDelegate>(() => _i22.TodoRouterDelegate());
  gh.factory<_i23.TodoWatcherBloc>(
      () => _i23.TodoWatcherBloc(get<_i14.ITodoRepository>()));
  gh.factory<_i24.AddTodoBloc>(() => _i24.AddTodoBloc(
      get<_i14.ITodoRepository>(), get<_i7.IDeviceIdProvider>()));
  return get;
}

class _$DioRegisterModule extends _i25.DioRegisterModule {}

class _$FirebaseRegisterModule extends _i26.FirebaseRegisterModule {}

class _$DelegateRegisterModule extends _i27.DelegateRegisterModule {}
