import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/text.dart';

class CustomTextField extends StatelessWidget {
  final String hint;

  final IconData? preIcon;

  final IconButton? suffIcon;

  final TextInputType? type;
  final bool obs;
  final TextEditingController? data;

  final String? Function(String?)? validator;

  final double? bottomSpace;

  final TextInputAction? action;
  const CustomTextField({
    super.key,
    required this.hint,
    this.preIcon,
    this.bottomSpace = 15,
    this.data,
    this.obs = false,
    this.suffIcon,
    this.type,
    this.validator,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomSpace!),
      child: TextFormField(
        validator: validator,
        controller: data,
        obscureText: obs,
        keyboardType: type,
        textAlignVertical: TextAlignVertical.center,
        style: kBodyTextStyle,
        cursorColor: kPrimaryColor,
        textInputAction: action,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffF5F9FE),
          border: InputBorder.none,
          errorStyle: kBodyTextStyle.copyWith(fontSize: 10, color: kErrorColor),
          contentPadding: EdgeInsets.symmetric(
              vertical: 20.0, horizontal: preIcon == null ? 10 : 0.0),
          prefixStyle: kBodyTextStyle,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(style: BorderStyle.none),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              width: 1.5,
              color: kPrimaryColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              width: 1.5,
              color: kErrorColor,
            ),
          ),
          hintText: hint,
          hintStyle: kHintTextStyle,
          prefixIcon: preIcon == null
              ? null
              : Icon(
                  preIcon,
                  color: kGreyColor.withOpacity(.25),
                ),
          suffixIcon: suffIcon,
        ),
      ),
    );
  }
}
