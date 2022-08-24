import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseRegisterModule {
  @LazySingleton()
  FirebaseCrashlytics get firebaseCrashlytics => FirebaseCrashlytics.instance;

  @LazySingleton()
  FirebaseRemoteConfig get firebaseRemoteConfig =>
      FirebaseRemoteConfig.instance;
}
