import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';
import 'package:instagram_clone_flutter_firebase/widgets/elevated_button.dart';
import 'package:instagram_clone_flutter_firebase/widgets/text.dart';

class SignupPicture extends StatefulWidget {
  const SignupPicture({super.key});

  @override
  State<SignupPicture> createState() => _SignupPictureState();
}

class _SignupPictureState extends State<SignupPicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: "Add a profile picture",
                textClr: primaryColor,
                textSize: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: MyText(
                  text:
                      "Add a profile picture so that your friends know it's you. Everyone will be able to see your picture.",
                  textClr: primaryColor,
                  textSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: MyElevatedButton(buttonText: "Add picture"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: MyElevatedButton(
                  buttonText: "Skip",
                  bgClr: mobileBackgroundColor,
                  borderClr: secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
