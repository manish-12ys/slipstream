import 'package:flutter/material.dart';

import 'screens/launcher_shell.dart';

void main() {
  runApp(const SlipstreamApp());
}

class SlipstreamApp extends StatelessWidget {
  const SlipstreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(
      seedColor: const Color(0xffff6b35),
      brightness: Brightness.dark,
    );
    return MaterialApp(
      title: 'Slipstream',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: scheme,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff101114),
      ),
      home: const LauncherShell(),
    );
  }
}
