import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_comp/constants/const.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.onChange,
    required this.label,
    this.obscureText = false,
    this.maxLength = 1,
    this.minLength = 1,
    this.formatters,
    this.textInputType,
    this.isEnabled = true,
    this.isEmail = false,
    this.isPassword = false,
    this.onTapPassword,
    this.fillColor = Colors.white,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) onChange;
  final Function()? onTapPassword;
  final String label;
  final bool obscureText;
  final int maxLength;
  final int minLength;
  final List<TextInputFormatter>? formatters;
  final TextInputType? textInputType;
  final bool isEnabled;
  final bool isEmail;
  final bool isPassword;
  final Color fillColor;
  final String? Function(String?)? validator;

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      minLines: widget.minLength,
      maxLines: widget.maxLength,
      inputFormatters: widget.formatters,
      keyboardType: widget.textInputType,
      enabled: widget.isEnabled,
      decoration: InputDecoration(
        hintText: widget.label,
        label: Text(widget.label),
        border: const UnderlineInputBorder(),
        fillColor: widget.fillColor,
        filled: true,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: widget.onTapPassword,
                icon: widget.obscureText
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            : null,
      ),
      onChanged: widget.onChange,
      validator: widget.validator ??
          (value) {
            if (value?.isEmpty ?? true) {
              return "${widget.label} tidak boleh kosong";
            } else {
              return null;
            }
          },
      obscureText: widget.obscureText,
      textInputAction: TextInputAction.search,
    );
  }
}
