// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/todo/add_todo/add_todo_bloc.dart' as _i12;
import 'application/todo/todo_watcher/todo_watcher_bloc.dart' as _i11;
import 'domain/todo/i_todo_local_data_source.dart' as _i5;
import 'domain/todo/i_todo_remote_data_source.dart' as _i7;
import 'infrastructure/core/register_modules/dio_register_module.dart' as _i13;
import 'infrastructure/todo/hive_todo_local_data_source.dart' as _i6;
import 'infrastructure/todo/yandex_backend_todo_remote_data_source.dart' as _i8;
import 'presentation/services/theming/dark_palette_controller.dart' as _i3;
import 'presentation/services/theming/light_palette_controller.dart' as _i9;
import 'presentation/services/theming/theme_controller.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioRegisterModule = _$DioRegisterModule();
  gh.lazySingleton<_i3.DarkPaletteController>(
      () => _i3.DarkPaletteController());
  gh.lazySingleton<_i4.Dio>(() => dioRegisterModule.dio);
  gh.lazySingleton<_i5.ITodoLocalDataSource>(
      () => _i6.HiveTodoLocalDataSource());
  gh.lazySingleton<_i7.ITodoRemoteDataSource>(
      () => _i8.YandexBackendTodoRemoteDataSource(get<_i4.Dio>()));
  gh.lazySingleton<_i9.LightPaletteController>(
      () => _i9.LightPaletteController());
  gh.lazySingleton<_i10.ThemeController>(() => _i10.ThemeController(
      get<_i9.LightPaletteController>(), get<_i3.DarkPaletteController>()));
  gh.factory<_i11.TodoWatcherBloc>(() => _i11.TodoWatcherBloc(
      get<_i5.ITodoLocalDataSource>(), get<_i7.ITodoRemoteDataSource>()));
  gh.factory<_i12.AddTodoBloc>(() => _i12.AddTodoBloc(
      get<_i5.ITodoLocalDataSource>(), get<_i7.ITodoRemoteDataSource>()));
  return get;
}

class _$DioRegisterModule extends _i13.DioRegisterModule {}
