import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/screens/profilesetup/viewprofile.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class AddHeightandWeight extends StatefulWidget {
  const AddHeightandWeight({Key? key}) : super(key: key);

  @override
  State<AddHeightandWeight> createState() => _AddHeightandWeightState();
}

class _AddHeightandWeightState extends State<AddHeightandWeight> {
  final heightcontroller = TextEditingController();
  final weightcontroller = TextEditingController();
  final auth = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  void dispose() {
    heightcontroller.dispose();
    weightcontroller.dispose();
    setStatusBarColor(transparentColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: heading(title: "Height(in cm)"),
                ),
              ],
            ).paddingOnly(left: 24),
            //8.height,
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                children: [
                  AppTextField(
                    autoFocus: true,
                    controller: heightcontroller,
                    textFieldType: TextFieldType.NUMBER,
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
            ),
            //24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: heading(title: "Weight(in kg)"),
                ),
              ],
            ).paddingOnly(left: 24),
            //8.height,
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                children: [
                  AppTextField(
                    autoFocus: true,
                    controller: weightcontroller,
                    textFieldType: TextFieldType.NUMBER,
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
            ),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: radius(5),
                        side: const BorderSide(color: Colors.white, width: 1)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    onTap: () {
                      final hgt = heightcontroller.text;
                      final wgt = weightcontroller.text;
                      AddHeightandWeight(height: hgt, weight: wgt);
                      Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) =>
                              const ViewProfileScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    elevation: 0,
                    color: mcPrimaryColor,
                    child: const DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      child: Text('Update'),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future AddHeightandWeight(
      {required String height, required String weight}) async {
    final docUser =
        FirebaseFirestore.instance.collection('Member').doc(auth.uid);
    final json = {
      'height': height,
      'weight': weight,
    };
    await docUser.update(json);
  }
}
