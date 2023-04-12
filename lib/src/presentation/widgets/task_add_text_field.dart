import 'package:flutter/material.dart';

class TaskAddTextField extends StatelessWidget {
  final ValueChanged<String> onValueChanged;

  const TaskAddTextField({
    required this.onValueChanged,
    required this.labelText,
    super.key,
  });

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: TextFormField(
        onChanged: onValueChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
