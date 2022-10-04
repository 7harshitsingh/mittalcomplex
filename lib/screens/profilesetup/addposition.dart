import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/screens/profilesetup/addname.dart';
import 'package:mittalcomplex/screens/profilesetup/addprogram.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';


class AddPosition extends StatefulWidget {
  const AddPosition({Key? key}) : super(key: key);

  @override
  State<AddPosition> createState() => _AddPositionState();
}

class _AddPositionState extends State<AddPosition> {
  String position = '';
  final auth = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  void dispose() {
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
                  child: heading(title: "Choose your role"),
                ),
                IconButton(
                    onPressed: () {
                      addRole(role: position);
                      if (position == "Member") {
                        const AddProgram().launch(context);
                      }
                      if (position == "Staff" || position == "Admin") {
                        const AddName().launch(context);
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
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: mcInputDecoration(hint: "Select"),
                    items:
                        <String>['Member', 'Staff', 'Admin'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: secondaryTextStyle()),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        position = newValue!;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future addRole({required String role}) async {
    final docUser =
        FirebaseFirestore.instance.collection('usersData').doc(auth.uid);
    final json = {'role': role};
    await docUser.set(json);
  }  
}
