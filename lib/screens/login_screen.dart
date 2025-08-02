import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';
import 'package:instagram_clone_flutter_firebase/widgets/elevated_button.dart';
import 'package:instagram_clone_flutter_firebase/widgets/text_button.dart';
import 'package:instagram_clone_flutter_firebase/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 1, child: Container()),

              SvgPicture.asset("assets/instagramIcon.svg", height: 64),
              const SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: TextFieldInput(
                  labelText: "Username, email address or mobile number",
                  textEditingController: emailController,
                  textInputType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextFieldInput(
                  labelText: "Password",
                  textEditingController: passwordController,
                  textInputType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: MyElevatedButton(buttonText: "Log in"),
              ),
              MyTextButton(buttonText: "Forgotten password?"),
              Flexible(flex: 1, child: Container()),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: MyElevatedButton(
                  buttonText: "Create new account",
                  bgClr: mobileBackgroundColor,
                  borderClr: blueColor,
                  textClr: blueColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
