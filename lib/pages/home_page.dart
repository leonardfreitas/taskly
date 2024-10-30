import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskly/providers/task_provider.dart';
import 'package:taskly/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TaskProvider>(context, listen: false).listTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.tasks;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Skeletonizer(
            enabled: taskProvider.isLoading,
            enableSwitchAnimation: true,
            child: taskProvider.isLoading
                ? ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const Card(
                        child: ListTile(
                          leading: Icon(Icons.check_box_outline_blank),
                          title: Text(''),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.check_box_outline_blank),
                          title: Text(task.name),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.newTask,
          );
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}
