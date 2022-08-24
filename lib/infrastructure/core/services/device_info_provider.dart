import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/services/i_device_id_provider.dart';

@LazySingleton(as: IDeviceIdProvider)
class DeviceInfoProvider implements IDeviceIdProvider {
  final _deviceInfo = DeviceInfoPlugin();

  @override
  Future<String> getDeviceId() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;

      return androidInfo.androidId ?? androidInfo.id ?? androidInfo.device!;
    } else {
      final iosInfo = await _deviceInfo.iosInfo;

      return iosInfo.identifierForVendor ?? iosInfo.name ?? iosInfo.model!;
    }
  }
}
