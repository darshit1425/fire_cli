import 'package:firecliconn/helper/fire_basehelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                //top
                Container(
                height: 15.h,
                width: 100.w,
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //email
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2,
                          offset: Offset(0, 2))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: txtemail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Text("Email"),
                    ),
                  ),
                ),
              ),
              //password
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2,
                          offset: Offset(0, 2))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: txtpassword,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Text("Password"),
                    ),
                  ),
                ),
              ),
              //forget
              // Padding(
              //   padding: const EdgeInsets.only(left: 180),
              //   child: TextButton(
              //       onPressed: () {}, child: Text("Forget your password? ->")),
              // ),
              //signin
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                onTap: () async {
                  String msj = await FirebaseHelper.firebaseHelper
                      .signInEmail(txtemail.text, txtpassword.text);
                  if (msj == "SignIn Successfully") {
                    Get.offAllNamed("home")!.then(
                          (value) {
                        txtemail.clear();
                        txtpassword.clear();
                      },
                    );
                    Get.snackbar("hello", "$msj",
                        colorText: Colors.black,
                        backgroundColor: Colors.blue.shade50);
                  } else {
                    Get.snackbar("conform", "$msj",
                        colorText: Colors.black,
                        backgroundColor: Colors.blue.shade50);
                  }
                },
                child: Container(
                  height: 6.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.deepOrange,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 2.h,),

              Align(
              alignment: Alignment.bottomRight,
              child: TextButton(onPressed: () {

                Get.toNamed('/forgot');

              },
                  child: Text(
                    "Forgot Password", style: TextStyle(color: Colors.red),)),
            ),
            //sign up
            SizedBox(
              height: 27.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No have any account?",
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed("signup");
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
            ],
          ),
        )),)
    ,
    );
  }
}
