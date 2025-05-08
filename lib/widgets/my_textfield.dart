import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  MyTextfield({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.keyboardType,
  });

  final String hintText;
  Function(String)? onChanged;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),

      child: TextField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: TextStyle(color: Colors.black),

        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
