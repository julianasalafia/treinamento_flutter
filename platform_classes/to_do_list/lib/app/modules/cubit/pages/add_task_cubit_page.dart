import 'package:flutter/material.dart';

import '../../../core/components/add_task_form_component.dart';
import '../controllers/form_cubit_controller.dart';

class AddTaskCubitPage extends StatelessWidget {
  const AddTaskCubitPage({super.key, required this.controller});

  final FormCubitController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AddTaskFormComponent(
          formController: controller,
        ),
      ),
    );
  }
}
