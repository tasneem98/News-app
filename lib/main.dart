import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/services/secure_storage_service.dart';
import '/features/home/presentation/home_page.dart';
import 'core/theme/theme.dart';
import 'core/theme/util.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await dotenv.load(fileName: ".env");

  final storage = SecureStorageService();

  await storage.setDate(
    key: "api_key",
    value: dotenv.env["APIKEY"].toString(),
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    final TextTheme textTheme = createTextTheme(
      context,
      "ABeeZee",
      "Alexandria",
    );

    final MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'News',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const HomePage(),
    );
  }
}
