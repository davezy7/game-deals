import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((_) {
  final timeoutDuration = const Duration(seconds: 5);
  final headers = Map<String, String>.of(
    {"Content-Type": "application/json"},
  );
  return Dio(
    BaseOptions(
      baseUrl: "https://www.cheapshark.com/api/1.0",
      connectTimeout: timeoutDuration,
      receiveTimeout: timeoutDuration,
      headers: headers,
    ),
  )..interceptors.add(LogInterceptor());
});
