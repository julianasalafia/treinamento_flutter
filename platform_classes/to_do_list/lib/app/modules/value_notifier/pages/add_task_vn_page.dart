import 'package:flutter/material.dart';
import 'package:to_do_list/app/controllers/form_controller.dart';

import '../../../components/add_task_form_component.dart';

class AddTaskVnPage extends StatelessWidget {
  const AddTaskVnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AddTaskFormComponent(
          formController: FormController(),
        ),
      ),
    );
  }
}
