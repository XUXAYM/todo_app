import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioRegisterModule {
  @LazySingleton()
  Dio get dio => Dio();
}
