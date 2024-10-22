import 'package:flutter/material.dart';

import 'package:taskly/routes/routes.dart';
import 'package:taskly/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkThemeMode,
      initialRoute: '/',
      routes: initRoutes(context),
    );
  }
}
