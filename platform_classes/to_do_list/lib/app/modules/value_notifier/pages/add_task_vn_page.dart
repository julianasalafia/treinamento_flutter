import 'package:flutter/material.dart';
import 'package:to_do_list/app/modules/value_notifier/controllers/form_vn_controller.dart';
import '../../../core/components/add_task_form_component.dart';

class AddTaskVnPage extends StatelessWidget {
  const AddTaskVnPage({super.key, required this.controller});

  final FormVnController controller;

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
