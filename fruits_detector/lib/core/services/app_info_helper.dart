import 'package:package_info_plus/package_info_plus.dart';

class AppInfoHelper {
  factory AppInfoHelper() => _instance;
  AppInfoHelper._internal();
  static final AppInfoHelper _instance = AppInfoHelper._internal();
  late String appName;
  late String packageName;
  late String version;
  late String buildNumber;

  Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }
}
