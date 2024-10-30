import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly/providers/task_provider.dart';

import 'package:taskly/routes/routes.dart';
import 'package:taskly/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskProvider>(
          create: (_) => TaskProvider(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.darkThemeMode,
        initialRoute: '/',
        routes: initRoutes(context),
      ),
    );
  }
}
