import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';

class MyTextButton extends StatelessWidget {
  final String buttonText;
  final Color txtClr;
  const MyTextButton({super.key, required this.buttonText,this.txtClr=primaryColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(),
      child: Text(buttonText, style: TextStyle(color: txtClr,fontSize: 16)),
    );
  }
}
