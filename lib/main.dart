import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/shared/routing/routing.dart';
import 'package:project/utils/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(routes: $appRoutes),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
    );
  }
}
