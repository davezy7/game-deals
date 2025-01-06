import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_cheapshark/feature_home/screens/home_screen.dart';

final class CheapsharkApp extends StatelessWidget {
  const CheapsharkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: ProviderScope(child: HomeScreen()),
    );
  }
}
