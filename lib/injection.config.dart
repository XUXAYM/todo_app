// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i5;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/todo/add_todo/add_todo_bloc.dart' as _i18;
import 'application/todo/todo_form/todo_form_bloc.dart' as _i15;
import 'application/todo/todo_watcher/todo_watcher_bloc.dart' as _i17;
import 'domain/core/services/i_device_id_provider.dart' as _i7;
import 'domain/todo/i_todo_local_data_source.dart' as _i9;
import 'domain/todo/i_todo_remote_data_source.dart' as _i11;
import 'domain/todo/models/todo.dart' as _i16;
import 'infrastructure/core/register_modules/dio_register_module.dart' as _i19;
import 'infrastructure/core/register_modules/firebase_register_module.dart'
    as _i20;
import 'infrastructure/core/services/device_info_provider.dart' as _i8;
import 'infrastructure/todo/hive_todo_local_data_source.dart' as _i10;
import 'infrastructure/todo/yandex_backend_todo_remote_data_source.dart'
    as _i12;
import 'presentation/services/theming/dark_palette_controller.dart' as _i3;
import 'presentation/services/theming/light_palette_controller.dart' as _i13;
import 'presentation/services/theming/theme_controller.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioRegisterModule = _$DioRegisterModule();
  final firebaseRegisterModule = _$FirebaseRegisterModule();
  gh.lazySingleton<_i3.DarkPaletteController>(
      () => _i3.DarkPaletteController());
  gh.lazySingleton<_i4.Dio>(() => dioRegisterModule.dio);
  gh.lazySingleton<_i5.FirebaseCrashlytics>(
      () => firebaseRegisterModule.firebaseCrashlytics);
  gh.lazySingleton<_i6.FirebaseRemoteConfig>(
      () => firebaseRegisterModule.firebaseRemoteConfig);
  gh.lazySingleton<_i7.IDeviceIdProvider>(() => _i8.DeviceInfoProvider());
  gh.lazySingleton<_i9.ITodoLocalDataSource>(
      () => _i10.HiveTodoLocalDataSource());
  gh.lazySingleton<_i11.ITodoRemoteDataSource>(
      () => _i12.YandexBackendTodoRemoteDataSource(get<_i4.Dio>()));
  gh.lazySingleton<_i13.LightPaletteController>(
      () => _i13.LightPaletteController());
  gh.lazySingleton<_i14.ThemeController>(() => _i14.ThemeController(
      get<_i13.LightPaletteController>(), get<_i3.DarkPaletteController>()));
  gh.factoryParam<_i15.TodoFormBloc, _i16.Todo?, dynamic>((todo, _) =>
      _i15.TodoFormBloc(todo, get<_i9.ITodoLocalDataSource>(),
          get<_i11.ITodoRemoteDataSource>(), get<_i7.IDeviceIdProvider>()));
  gh.factory<_i17.TodoWatcherBloc>(() => _i17.TodoWatcherBloc(
      get<_i9.ITodoLocalDataSource>(),
      get<_i11.ITodoRemoteDataSource>(),
      get<_i7.IDeviceIdProvider>()));
  gh.factory<_i18.AddTodoBloc>(() => _i18.AddTodoBloc(
      get<_i9.ITodoLocalDataSource>(),
      get<_i11.ITodoRemoteDataSource>(),
      get<_i7.IDeviceIdProvider>()));
  return get;
}

class _$DioRegisterModule extends _i19.DioRegisterModule {}

class _$FirebaseRegisterModule extends _i20.FirebaseRegisterModule {}
