import 'package:flutter/material.dart';
import 'package:studentapp/constants/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final String errorText;
  final GlobalKey<FormState> formKey;

  const TextFormFieldWidget({
    super.key,
    required this.labelText,
    this.hintText,
    required this.controller,
    required this.errorText,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (_) {
          formKey.currentState?.validate();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorText;
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            fontSize: 18,
          ),
          hintText: hintText,
          labelText: labelText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Kgrey,
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Kred),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Kred),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Kpurple),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
