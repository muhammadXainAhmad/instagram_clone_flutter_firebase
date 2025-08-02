import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';

class MyElevatedButton extends StatelessWidget {
  final String buttonText;
  final Color bgClr;
  final Color borderClr;
  final Color textClr;
  const MyElevatedButton({
    super.key,
    required this.buttonText,
    this.bgClr = blueColor,
    this.borderClr = mobileBackgroundColor,
    this.textClr=primaryColor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: bgClr,
        minimumSize: Size(double.infinity, 50),
        side: BorderSide(color: borderClr,width: 2),
      ),
      child: Text(buttonText, style: TextStyle(color: textClr)),
    );
  }
}
