import 'package:flutter/services.dart';

import '../models/installed_app.dart';

class PlatformBridgeException implements Exception {
  const PlatformBridgeException(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => message;
}

class PlatformBridge {
  static const _channel = MethodChannel('com.example.slipstream/platform');
  static const _packageEvents = EventChannel(
    'com.example.slipstream/package_events',
  );

  Future<List<InstalledApp>> getInstalledApps() async {
    try {
      final result = await _channel.invokeMethod<List<Object?>>(
        'getInstalledApps',
      );
      return (result ?? const <Object?>[])
          .whereType<Map<Object?, Object?>>()
          .map(InstalledApp.fromMap)
          .toList()
        ..sort(
          (a, b) => a.label.toLowerCase().compareTo(b.label.toLowerCase()),
        );
    } on PlatformException catch (error) {
      throw PlatformBridgeException(
        error.code,
        'Installed apps could not be loaded.',
      );
    }
  }

  Future<void> launchApp(String packageName) async {
    try {
      await _channel.invokeMethod<void>('launchApp', <String, Object?>{
        'packageName': packageName,
      });
    } on PlatformException catch (error) {
      throw PlatformBridgeException(error.code, _launchError(error.code));
    }
  }

  Stream<void> get packageChanges =>
      _packageEvents.receiveBroadcastStream().map<void>((_) {});

  Future<Uint8List?> getWallpaper() async {
    try {
      return await _channel.invokeMethod<Uint8List>('getWallpaper');
    } on PlatformException {
      return null;
    }
  }

  String _launchError(String code) {
    switch (code) {
      case 'notFound':
        return 'That app is no longer installed.';
      case 'disabled':
        return 'That app is disabled.';
      case 'noLaunchIntent':
        return 'That app cannot be opened from Slipstream.';
      default:
        return 'The app could not be opened.';
    }
  }
}
