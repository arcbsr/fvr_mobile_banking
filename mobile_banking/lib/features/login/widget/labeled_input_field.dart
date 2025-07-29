import 'package:flutter/material.dart';

class LabeledInputField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool showToggle;

  const LabeledInputField({
    Key? key,
    this.label,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.showToggle = false,
  }) : super(key: key);

  @override
  State<LabeledInputField> createState() => _LabeledInputFieldState();
}

class _LabeledInputFieldState extends State<LabeledInputField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: _obscure,
        decoration: InputDecoration(
          labelText: widget.label,
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          suffixIcon: widget.showToggle
              ? IconButton(
            icon: Icon(
              _obscure ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
          )
              : null,
        ),
      ),
    );
  }
}
/*
class LabeledInputField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller; // Now optional
  final ValueChanged<String>? onChanged;

  const LabeledInputField({
    Key? key,
    this.label,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }
}*/
