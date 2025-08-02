import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:instagram_clone_flutter_firebase/firebase_options.dart';
import 'package:instagram_clone_flutter_firebase/screens/signup1_email.dart';
import 'package:instagram_clone_flutter_firebase/screens/signup1_phone.dart';
import 'package:instagram_clone_flutter_firebase/screens/signup2_password.dart';
import 'package:instagram_clone_flutter_firebase/screens/signup4_username.dart';
import 'package:instagram_clone_flutter_firebase/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: SignupPhoneNo()
      // home: const ResponsiveLayout(
      //   webScreenLayout: WebScreenLayout(),
      //   mobileScreenLayout: MobileScreenLayout(),
      // ),
    );
  }
}
