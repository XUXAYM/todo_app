// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'domain/todo/i_todo_remote_data_source.dart' as _i5;
import 'infrastructure/core/register_modules/dio_register_module.dart' as _i9;
import 'infrastructure/todo/yandex_backend_todo_remote_data_source.dart' as _i6;
import 'presentation/services/theming/dark_palette_controller.dart' as _i3;
import 'presentation/services/theming/light_palette_controller.dart' as _i7;
import 'presentation/services/theming/theme_controller.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioRegisterModule = _$DioRegisterModule();
  gh.lazySingleton<_i3.DarkPaletteController>(
      () => _i3.DarkPaletteController());
  gh.lazySingleton<_i4.Dio>(() => dioRegisterModule.dio);
  gh.lazySingleton<_i5.ITodoRemoteDataSource>(
      () => _i6.YandexBackendTodoRemoteDataSource(get<_i4.Dio>()));
  gh.lazySingleton<_i7.LightPaletteController>(
      () => _i7.LightPaletteController());
  gh.lazySingleton<_i8.ThemeController>(() => _i8.ThemeController(
      get<_i7.LightPaletteController>(), get<_i3.DarkPaletteController>()));
  return get;
}

class _$DioRegisterModule extends _i9.DioRegisterModule {}
