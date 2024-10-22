import 'package:flutter/material.dart';
import 'package:taskly/pages/projects_page.dart';
import 'package:taskly/routes/routes.dart';
import 'package:taskly/widgets/input.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Input(),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const ProjectsPage(),
                    //   ),
                    // );
                    Navigator.pushNamed(context, AppRoutes.projects);
                  },
                  child: Text('Project'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
