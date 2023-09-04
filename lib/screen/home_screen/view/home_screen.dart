import 'package:firecliconn/helper/fire_basehelper.dart';
import 'package:firecliconn/screen/home_screen/contoller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.userDetails = FirebaseHelper.firebaseHelper.userDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text("home Screen"),
        ),
        body: Column(
          children: [
            //image
            CircleAvatar(
              radius: 55,
              backgroundImage:
                  NetworkImage("${controller.userDetails!['photo']}"),
            ),
            // pickimage
            controller.userDetails!['photo'] == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera,
                          size: 25,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.photo,
                          size: 25,
                        ),
                      ),
                    ],
                  )
                : Container(),
            // detail
            const SizedBox(
              height: 10,
            ),
            buildListTile(Icons.person,
                "${controller.userDetails!['name'] ?? 'Name not verify'}"),
            buildListTile(Icons.email,
                "${controller.userDetails!['email'] ?? 'Email not verify'}"),
            buildListTile(Icons.phone,
                "${controller.userDetails!['phone'] ?? 'Phone number not verify'}"),
            //sign out
            SizedBox(
              height: 30.h,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                              radius: 35,
                              child: Icon(Icons.admin_panel_settings_outlined)),
                          const Text(
                            "Ecommerce Admin App !",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Are you sure to signout\n the admine app",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black38),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              String msg =
                                  await FirebaseHelper.firebaseHelper.signOut();
                              if (msg == "SignOut Successfully") {
                                Get.offAllNamed("/");
                              } else {
                                Get.snackbar("", "$msg",
                                    colorText: Colors.black,
                                    backgroundColor: Colors.blue.shade50);
                              }
                            },
                            child: const Text("Sign Out"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}

ListTile buildListTile(IconData i1, String data) {
  return ListTile(
    leading: Icon(
      i1,
    ),
    title: Text(
      "$data",
      style: const TextStyle(fontSize: 15, color: Colors.black),
    ),
  );
}
