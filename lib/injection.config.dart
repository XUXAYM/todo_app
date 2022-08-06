// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/todo/add_todo/add_todo_bloc.dart' as _i16;
import 'application/todo/todo_form/todo_form_bloc.dart' as _i13;
import 'application/todo/todo_watcher/todo_watcher_bloc.dart' as _i15;
import 'domain/core/services/i_device_id_provider.dart' as _i5;
import 'domain/todo/i_todo_local_data_source.dart' as _i7;
import 'domain/todo/i_todo_remote_data_source.dart' as _i9;
import 'domain/todo/models/todo.dart' as _i14;
import 'infrastructure/core/register_modules/dio_register_module.dart' as _i17;
import 'infrastructure/core/services/device_info_provider.dart' as _i6;
import 'infrastructure/todo/hive_todo_local_data_source.dart' as _i8;
import 'infrastructure/todo/yandex_backend_todo_remote_data_source.dart'
    as _i10;
import 'presentation/services/theming/dark_palette_controller.dart' as _i3;
import 'presentation/services/theming/light_palette_controller.dart' as _i11;
import 'presentation/services/theming/theme_controller.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioRegisterModule = _$DioRegisterModule();
  gh.lazySingleton<_i3.DarkPaletteController>(
      () => _i3.DarkPaletteController());
  gh.lazySingleton<_i4.Dio>(() => dioRegisterModule.dio);
  gh.lazySingleton<_i5.IDeviceIdProvider>(() => _i6.DeviceInfoProvider());
  gh.lazySingleton<_i7.ITodoLocalDataSource>(
      () => _i8.HiveTodoLocalDataSource());
  gh.lazySingleton<_i9.ITodoRemoteDataSource>(
      () => _i10.YandexBackendTodoRemoteDataSource(get<_i4.Dio>()));
  gh.lazySingleton<_i11.LightPaletteController>(
      () => _i11.LightPaletteController());
  gh.lazySingleton<_i12.ThemeController>(() => _i12.ThemeController(
      get<_i11.LightPaletteController>(), get<_i3.DarkPaletteController>()));
  gh.factoryParam<_i13.TodoFormBloc, _i14.Todo?, dynamic>((todo, _) =>
      _i13.TodoFormBloc(todo, get<_i7.ITodoLocalDataSource>(),
          get<_i9.ITodoRemoteDataSource>(), get<_i5.IDeviceIdProvider>()));
  gh.factory<_i15.TodoWatcherBloc>(() => _i15.TodoWatcherBloc(
      get<_i7.ITodoLocalDataSource>(),
      get<_i9.ITodoRemoteDataSource>(),
      get<_i5.IDeviceIdProvider>()));
  gh.factory<_i16.AddTodoBloc>(() => _i16.AddTodoBloc(
      get<_i7.ITodoLocalDataSource>(),
      get<_i9.ITodoRemoteDataSource>(),
      get<_i5.IDeviceIdProvider>()));
  return get;
}

class _$DioRegisterModule extends _i17.DioRegisterModule {}
