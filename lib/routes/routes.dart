import 'package:flutter/material.dart';

import 'package:taskly/pages/home_page.dart';
import 'package:taskly/pages/new_task_page.dart';
import 'package:taskly/pages/projects_page.dart';

abstract class AppRoutes {
  static const initial = '/';
  static const newTask = '/new-task';
  static const projects = '/projects';
}

Map<String, Widget Function(BuildContext)> initRoutes(BuildContext context) {
  return {
    AppRoutes.initial: (ctx) => const HomePage(),
    AppRoutes.newTask: (ctx) => NewTaskPage(),
    AppRoutes.projects: (ctx) => const ProjectsPage(),
  };
}
