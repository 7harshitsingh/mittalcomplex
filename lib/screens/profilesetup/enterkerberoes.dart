import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/screens/profilesetup/addname.dart';
import 'package:mittalcomplex/screens/profilesetup/addposition.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class EnterKerberos extends StatefulWidget {
  const EnterKerberos({Key? key}) : super(key: key);

  @override
  State<EnterKerberos> createState() => _EnterKerberosState();
}

class _EnterKerberosState extends State<EnterKerberos> {
  bool kerb = false;
  final kerberosController = TextEditingController();
  final auth = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    if (kerb == true) {
      const AddName().launch(context);
    }
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  void dispose() {
    kerberosController.dispose();
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
                  child: heading(title: "Kerberos ID"),
                ),
                IconButton(
                    onPressed: () {
                      final schoolID = kerberosController.text;
                      addKerberos(kerberos: schoolID);
                      const AddName().launch(context);
                      setState(() {
                        kerb = true;
                      });
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
                    controller: kerberosController,
                    validator: (value) => value != null && value.length < 8
                        ? 'Enter min. 8 characters'
                        : null,
                    textFieldType: TextFieldType.USERNAME,
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

  Future addKerberos({required String kerberos}) async {
    final docUser =
        FirebaseFirestore.instance.collection(position).doc(auth.uid);
    final json = {'kerberos': kerberos};
    await docUser.update(json);
  }
}
