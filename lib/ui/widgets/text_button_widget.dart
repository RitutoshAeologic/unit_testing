import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_testing/core/constant/color_constant.dart';

class TextButtonWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const TextButtonWidget({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap,
        child: Text(
          title,
          style:const TextStyle(fontSize: 20,color: AppColors.appLoginTextColor)
        ));
  }
}
