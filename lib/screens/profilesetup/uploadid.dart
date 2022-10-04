import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mittalcomplex/components/explore/settingsscreen.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class UploadID extends StatefulWidget {
  const UploadID({Key? key}) : super(key: key);

  @override
  State<UploadID> createState() => _UploadIDState();
}

class _UploadIDState extends State<UploadID> {
  String idurl = ' ';
  final auth = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    fetchID();
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(transparentColor);
    super.dispose();
  }

  void uploadimage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 100,
    );

    final path = auth.uid;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('usersData/profile/$path/myID');
    await ref.putFile(File(image!.path));

    fetchID();
  }

  void fetchID() {
    final path = auth.uid;
    final ref = FirebaseStorage.instance
        .ref()
        .child('usersData/profile/$path/myID');

    ref.getDownloadURL().then((value) {
      setState(() {
        idurl = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: mcPrimaryColorDark,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: heading(title: "Upload ID"),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => const SettingsScreen(),
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
              10.height,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 210,
                    width: 336,
                    decoration: BoxDecoration(
                        color: mcPrimaryColor,
                        border: Border.all(color: Colors.white54, width: 2),
                        borderRadius: radius(10)),
                    child: idurl == " "
                        ? const Icon(Icons.card_membership,
                            color: Colors.white54, size: 50)
                        : Image.network(idurl, fit: BoxFit.fitWidth)
                            .cornerRadiusWithClipRRect(10),
                  ),
                  GestureDetector(
                    onTap: uploadimage,
                    child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                          child: const Icon(Icons.edit,
                              color: Colors.white, size: 15),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
