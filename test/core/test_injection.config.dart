// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i5;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:todo_app/application/todo/add_todo/add_todo_bloc.dart' as _i22;
import 'package:todo_app/application/todo/todo_form/todo_form_bloc.dart'
    as _i19;
import 'package:todo_app/application/todo/todo_watcher/todo_watcher_bloc.dart'
    as _i21;
import 'package:todo_app/domain/core/services/i_device_id_provider.dart' as _i7;
import 'package:todo_app/domain/todo/i_todo_local_data_source.dart' as _i11;
import 'package:todo_app/domain/todo/i_todo_remote_data_source.dart' as _i13;
import 'package:todo_app/domain/todo/i_todo_repository.dart' as _i15;
import 'package:todo_app/domain/todo/models/todo.dart' as _i20;
import 'package:todo_app/infrastructure/core/register_modules/dio_register_module.dart'
    as _i23;
import 'package:todo_app/infrastructure/core/register_modules/firebase_register_module.dart'
    as _i24;
import 'package:todo_app/infrastructure/core/services/device_info_provider.dart'
    as _i8;
import 'package:todo_app/infrastructure/todo/hive_todo_local_data_source.dart'
    as _i12;
import 'package:todo_app/infrastructure/todo/todo_repository.dart' as _i16;
import 'package:todo_app/infrastructure/todo/yandex_backend_todo_remote_data_source.dart'
    as _i14;
import 'package:todo_app/presentation/services/navigating/i_navigation_controller.dart'
    as _i9;
import 'package:todo_app/presentation/services/navigating/navigation_controller.dart'
    as _i10;
import 'package:todo_app/presentation/services/theming/dark_palette_controller.dart'
    as _i3;
import 'package:todo_app/presentation/services/theming/light_palette_controller.dart'
    as _i17;
import 'package:todo_app/presentation/services/theming/theme_controller.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i9.INavigationController>(
      () => _i10.NavigationController());
  gh.lazySingleton<_i11.ITodoLocalDataSource>(
      () => _i12.HiveTodoLocalDataSource());
  gh.lazySingleton<_i13.ITodoRemoteDataSource>(
      () => _i14.YandexBackendTodoRemoteDataSource(get<_i4.Dio>()));
  gh.lazySingleton<_i15.ITodoRepository>(() => _i16.TodoRepository(
      get<_i11.ITodoLocalDataSource>(),
      get<_i13.ITodoRemoteDataSource>(),
      get<_i7.IDeviceIdProvider>()));
  gh.lazySingleton<_i17.LightPaletteController>(
      () => _i17.LightPaletteController());
  gh.lazySingleton<_i18.ThemeController>(() => _i18.ThemeController(
      get<_i17.LightPaletteController>(), get<_i3.DarkPaletteController>()));
  gh.factoryParam<_i19.TodoFormBloc, _i20.Todo?, dynamic>(
      (todo, _) => _i19.TodoFormBloc(todo, get<_i15.ITodoRepository>()));
  gh.factory<_i21.TodoWatcherBloc>(
      () => _i21.TodoWatcherBloc(get<_i15.ITodoRepository>()));
  gh.factory<_i22.AddTodoBloc>(() => _i22.AddTodoBloc(
      get<_i15.ITodoRepository>(), get<_i7.IDeviceIdProvider>()));
  return get;
}

class _$DioRegisterModule extends _i23.DioRegisterModule {}

class _$FirebaseRegisterModule extends _i24.FirebaseRegisterModule {}
