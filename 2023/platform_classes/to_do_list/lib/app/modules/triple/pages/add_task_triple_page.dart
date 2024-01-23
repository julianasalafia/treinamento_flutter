import 'package:flutter/material.dart';

import '../../../core/components/add_task_form_component.dart';
import '../controllers/form_triple_controller.dart';

class AddTaskTriplePage extends StatelessWidget {
  const AddTaskTriplePage({super.key, required this.controller});

  final FormTripleController controller;

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
