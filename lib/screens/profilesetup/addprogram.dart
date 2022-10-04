import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/screens/profilesetup/enterkerberoes.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class AddProgram extends StatefulWidget {
  const AddProgram({Key? key}) : super(key: key);

  @override
  State<AddProgram> createState() => _AddProgramState();
}

class _AddProgramState extends State<AddProgram> {
  String program = '';
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
                  child: heading(title: "Program"),
                ),
                IconButton(
                    onPressed: () {
                      addProgram(program: program);
                      const EnterKerberos().launch(context);
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
                    items: <String>[
                      'B.Tech',
                      'M.Tech',
                      'PHD',
                      'Post-Doctoral',
                      'MBA',
                      'M.Des'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: secondaryTextStyle()),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        program = value!;
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

  Future addProgram({required String program}) async {
    final docUser =
        FirebaseFirestore.instance.collection('usersData').doc(auth.uid);
    final json = {'program': program};
    await docUser.update(json);
  }
}
