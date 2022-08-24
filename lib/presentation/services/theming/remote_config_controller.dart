import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../../injection.dart';

class RemoteConfigController {
  static const _isAttentionPurpleKey = 'is_attention_purple';

  const RemoteConfigController._();

  static bool get isAttentionPurple =>
      getIt<FirebaseRemoteConfig>().getBool(_isAttentionPurpleKey);
}
