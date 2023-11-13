import 'package:flutter/material.dart';
import '../../../core/components/add_task_form_component.dart';
import '../controllers/form_cn_controller.dart';

class AddTaskCnPage extends StatelessWidget {
  const AddTaskCnPage({super.key, required this.controller});

  final FormCnController controller;

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
