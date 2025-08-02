import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter_firebase/methods/auth_methods.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';
import 'package:instagram_clone_flutter_firebase/widgets/elevated_button.dart';
import 'package:instagram_clone_flutter_firebase/widgets/text.dart';
import 'package:instagram_clone_flutter_firebase/widgets/textfield.dart';

class SignupUsername extends StatefulWidget {
  final String email;
  final String password;
  const SignupUsername({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<SignupUsername> createState() => _SignupUsernameState();
}

class _SignupUsernameState extends State<SignupUsername> {
  final TextEditingController usernameContoller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    usernameContoller.dispose();
  }

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
                text: "Review your username",
                textClr: primaryColor,
                textSize: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: MyText(
                  text: "Add a username. You can change this at any time.",
                  textClr: primaryColor,
                  textSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: TextFieldInput(
                  labelText: "Username",
                  textEditingController: usernameContoller,
                  textInputType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: MyElevatedButton(
                  onPressed: () {
                    AuthMethods().signupWithEmailAndPassword(
                      email: widget.email,
                      password: widget.password,
                      username: usernameContoller.text.trim(),
                      bio: "Flutter Dev",
                    );
                  },
                  buttonText: "Next",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
