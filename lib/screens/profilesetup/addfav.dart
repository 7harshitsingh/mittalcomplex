import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/screens/profilesetup/viewprofile.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class AddFav extends StatefulWidget {
  const AddFav({Key? key}) : super(key: key);

  @override
  State<AddFav> createState() => _AddFavState();
}

class _AddFavState extends State<AddFav> {
  final favController = TextEditingController();
  final auth = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  void dispose() {
    favController.dispose();
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
                child: heading(title: "Favourites"),
              ),
              IconButton(
                  onPressed: () {
                    final favourite = favController.text;
                    AddFav(fav: favourite);
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
                  autoFocus: true,
                  controller: favController,
                  validator: (value) => value != null && value.length < 6
                      ? 'Enter min. 6 characters'
                      : null,
                  textFieldType: TextFieldType.MULTILINE,
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
    );
  }

  // ignore: non_constant_identifier_names
  Future AddFav({required String fav}) async {
    final docUser =
        FirebaseFirestore.instance.collection('Member').doc(auth.uid);
    final json = {'fav': fav};
    await docUser.update(json);
  }
}
