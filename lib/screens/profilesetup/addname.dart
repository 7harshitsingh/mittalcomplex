import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/components/explore/profilescreen.dart';
import 'package:mittalcomplex/screens/profilesetup/addposition.dart';
import 'package:mittalcomplex/screens/profilesetup/uploadprofilepic.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';


class AddName extends StatefulWidget {
  const AddName({Key? key}) : super(key: key);

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  final nameController = TextEditingController();
  final auth = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    setStatusBarColor(transparentColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: mcPrimaryColorDark,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: heading(title: "What's your name?"),
                ),
                IconButton(
                    onPressed: () {
                      final fullname = nameController.text;
                      addName(fullname: fullname);
                      if (position == "Member") {
                        const UploadProfile().launch(context);
                      }
                      if (position == "Staff" || position == "Admin") {
                        const ProfileScreen().launch(context);
                      }
                    },
                    icon: const Icon(
                      Icons.forward,
                      size: 20,
                      color: Colors.white,
                    )).paddingTop(120)
              ],
            ).paddingOnly(left: 24, right: 24),
            //8.height,
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                children: [
                  AppTextField(
                    autoFocus: true,
                    controller: nameController,
                    validator: (value) => value != null && value.length < 6
                        ? 'Enter min. 6 characters'
                        : null,
                    textFieldType: TextFieldType.NAME,
                    cursorColor: mcPrimaryColor,
                    textStyle: boldTextStyle(color: Colors.white),
                    suffixIconColor: mcPrimaryColor,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future addName({required String fullname}) async {
    final docUser =
        FirebaseFirestore.instance.collection(position).doc(auth.uid);
    final json = {'name': fullname};
    await docUser.update(json);
  }
}
