import 'package:flutter/material.dart';
import 'package:to_do_list/app/controllers/form_controller.dart';
import 'package:to_do_list/app/core/shared/utils/app_pickers.dart';
import 'package:to_do_list/app/widgets/text_field_widget.dart';

class AddTaskFormComponent extends StatelessWidget {
  const AddTaskFormComponent({
    super.key,
    required this.formController,
  });

  final FormController formController;

  Future<void> datePicker(BuildContext context) async {
    final date = await AppPickers.appDatePicker(context);
    if (date == null) return;
    formController.changeDate(date);
  }

  Future<void> initTimePicker(BuildContext context) async {
    final time = await AppPickers.appTimePicker(context);
    if (time == null) return;
    formController.changeInitHour(time);
  }

  Future<void> endTimePicker(BuildContext context) async {
    final time = await AppPickers.appTimePicker(context);
    if (time == null) return;
    formController.changeEndHour(time);
  }

  String? defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formController.formKey,
      child: Column(
        children: [
          TextFieldWidget(
            controller: formController.titleController,
            label: 'Titulo',
            validator: defaultValidator,
          ),
          const SizedBox(height: 28),
          TextFieldWidget(
            controller: formController.descriptionController,
            label: 'Descrição',
            maxLines: 3,
            keyboardType: TextInputType.multiline,
            validator: defaultValidator,
          ),
          const SizedBox(height: 28),
          TextFieldWidget(
            controller: formController.dateController,
            label: 'Data',
            readOnly: true,
            onTap: () => datePicker(context),
            validator: defaultValidator,
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  controller: formController.initHourController,
                  label: 'Hora inicial',
                  readOnly: true,
                  onTap: () => initTimePicker(context),
                  validator: defaultValidator,
                ),
              ),
              const SizedBox(width: 28),
              Expanded(
                child: TextFieldWidget(
                  controller: formController.endHourController,
                  label: 'Hora final',
                  readOnly: true,
                  onTap: () => endTimePicker(context),
                  validator: defaultValidator,
                ),
              ),
            ],
          ),
          const SizedBox(width: 28),
          ElevatedButton(
              onPressed: formController.add, child: const Text('Adicionar')),
        ],
      ),
    );
  }
}
