import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  final T value;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final String? hint;
  const CustomDropDown({
    super.key,
    required this.value,
    this.items,
    this.onChanged,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
