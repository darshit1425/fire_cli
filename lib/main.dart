import 'package:firebase_core/firebase_core.dart';
import 'package:firecliconn/screen/home_screen/view/home_screen.dart';
import 'package:firecliconn/screen/login/view/login_screen.dart';
import 'package:firecliconn/screen/singup/view/singup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';
import 'screen/forgotpassword/view/forgot_password.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          "/": (p0) => SignInScreen(),
          "signup": (p0) => SignUpScreen(),
          "home": (p0) => Homescreen(),
          "/forgot": (p0) => ForgotScreen(),
        },
        theme: ThemeData(useMaterial3: true),
      ),
    ),
  );
}
