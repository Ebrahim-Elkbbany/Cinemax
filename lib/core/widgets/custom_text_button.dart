import 'package:cinemax/core/theming/font_styles.dart';
import 'package:flutter/material.dart';


class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onPressed, required this.text, this.textStyle,});
  final void Function()? onPressed ;
  final String text;
  final TextStyle? textStyle;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:  Text(
          text,
         style:textStyle ??  FontStyles.font18PrimaryBold,
      ),
    );
  }
}
