import 'package:flutter/material.dart';

class ReusableTextfieldPassword extends StatelessWidget {
  String hintText;
  String? labelText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? obscureText;
  String? Function(String?)? validator;

  TextEditingController textEditingController = TextEditingController();

  ReusableTextfieldPassword(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      required this.textEditingController,
      this.labelText,
      this.validator,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          labelText: labelText,
          labelStyle:
              TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        obscureText: obscureText!,
        obscuringCharacter: '*',
        validator: validator,
      ),
    );
  }
}
