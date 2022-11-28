import 'package:flutter/material.dart';

import '../../core/constant/color_constant.dart';


class GetTextField extends StatefulWidget {
  final String hint;
  final TextInputType? inputType;
  final bool obscure, isVisible;
  final TextEditingController? controller;
  final Function(String? value) onValidate;

  const GetTextField({
    Key? key,
    required this.hint,
    required this.obscure,
    this.controller,
   required this.onValidate,
    this.isVisible = false,
    this.inputType,
  }) : super(key: key);

  @override
  State<GetTextField> createState() => _GetTextFieldState();
}

class _GetTextFieldState extends State<GetTextField> {
  late bool _obscure;
  @override
  void initState() {
    _obscure = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
     keyboardType: widget.inputType,
     autofocus: false,
     validator: (value) => widget.onValidate(value),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
               const BorderSide(color: AppColors.textFieldBorder, width: 1)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
               const BorderSide(color: AppColors.textFieldBorder, width: 1)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
               const BorderSide(color: AppColors.textFieldBorder, width: 1)
        ),
        suffixIcon: widget.isVisible
            ? _obscure
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                    icon: const Icon(Icons.visibility_off_outlined))
                : IconButton(
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye))
            : null,
        filled: true,
        fillColor: AppColors.white,
        hintText: widget.hint,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      ),
      obscureText: _obscure,
    );
  }
}
