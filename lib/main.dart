import 'package:flutter/material.dart';
import 'package:sky_barrage/screens/splash_screen.dart';
import 'package:sky_barrage/theme/app_theme.dart';

void main() {
  runApp(const SkyBarrageApp());
}

class SkyBarrageApp extends StatelessWidget {
  const SkyBarrageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sky Barrage',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
