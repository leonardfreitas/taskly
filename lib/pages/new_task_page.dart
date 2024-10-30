import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly/models/task.dart';
import 'package:taskly/providers/task_provider.dart';
import 'package:taskly/routes/routes.dart';
import 'package:taskly/widgets/button.dart';
import 'package:taskly/widgets/input.dart';
import 'package:uuid/uuid.dart';

class NewTaskPage extends StatelessWidget {
  NewTaskPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  void handleForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final task = Task(
        id: const Uuid().toString(),
        name: nameController.text,
      );

      final taskProvider = Provider.of<TaskProvider>(context, listen: false);
      taskProvider.addTasks(task).then((v) {
        Navigator.pushNamed(
          context,
          AppRoutes.initial,
        );
      }).catchError((err) => print(err));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<TaskProvider>(context).isLoading;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 28.0,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: Input(
                    controller: nameController,
                  ),
                ),
                Button(
                  onTap: () {
                    handleForm(context);
                  },
                  label: 'Salvar',
                  isLoading: isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
