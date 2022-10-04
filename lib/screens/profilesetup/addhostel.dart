
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/screens/profilesetup/viewprofile.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class AddHostel extends StatefulWidget {
  const AddHostel({Key? key}) : super(key: key);

  @override
  State<AddHostel> createState() => _AddHostelState();
}

class _AddHostelState extends State<AddHostel> {
  final hostelController = TextEditingController();
  final auth = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  void dispose() {
    hostelController.dispose();
    setStatusBarColor(transparentColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: heading(title: "Hostel"),
              ),
              IconButton(
                  onPressed: () {
                    final hst = hostelController.text;
                    AddHostel(hostel: hst);
                    Navigator.pushAndRemoveUntil<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) =>
                            const ViewProfileScreen(),
                      ),
                      (route) => false,
                    );
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
                  maxLength: 18,
                  autoFocus: true,
                  controller: hostelController,
                  textFieldType: TextFieldType.NAME,
                  cursorColor: mcPrimaryColor,
                  textStyle: boldTextStyle(color: Colors.white),
                  suffixIconColor: mcPrimaryColor,
                  decoration: const InputDecoration(
                    hintText: "max 18 digits",
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
    );
  }

  // ignore: non_constant_identifier_names
  Future AddHostel({required String hostel}) async {
    final docUser = FirebaseFirestore.instance.collection('usersData').doc(auth.uid);
    final json = {'hostel': hostel};
    await docUser.update(json);
  }
}
