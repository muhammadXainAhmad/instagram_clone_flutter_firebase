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
              const SizedBox(height: 70),
              Stack(
                children: [
                  Center(
                    child: const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?_gl=1*1omheia*_ga*MTkyNjUyOTQzMC4xNzU0MTQ4NTg0*_ga_8JE65Q40S6*czE3NTQxNDg1ODMkbzEkZzAkdDE3NTQxNDg1ODMkajYwJGwwJGgw",
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(flex: 1, child: Container()),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: MyElevatedButton(onPressed: () {
                  
                },buttonText: "Add picture"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: MyElevatedButton(
                  onPressed: () {
                  
                },buttonText: "Skip",
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
