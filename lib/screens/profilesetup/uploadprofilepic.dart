import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mittalcomplex/screens/profilesetup/uploadid.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class UploadProfile extends StatefulWidget {
  const UploadProfile({Key? key}) : super(key: key);

  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  String imageUrl = ' ';
  final auth = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    fetchImage();
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(transparentColor);
    super.dispose();
  }

  void uploadImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 128,
      maxWidth: 128,
      imageQuality: 75,
    );

    final path = auth.uid;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('usersData/profile/$path/myprofilepic');
    await ref.putFile(File(image!.path));

    fetchImage();
  }

  void fetchImage() {
    final path = auth.uid;
    final ref = FirebaseStorage.instance
        .ref()
        .child('usersData/profile/$path/myprofilepic');

    ref.getDownloadURL().then((value) {
      setState(() {
        imageUrl = value;
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
                    child: heading(title: "Upload ProfilePic"),
                  ),
                  IconButton(
                      onPressed: () {
                        const UploadID().launch(context);
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
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 140,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          bottom: 10,
                          height: 110,
                          width: 110,
                          child: Container(
                            decoration: BoxDecoration(
                                color: mcPrimaryColor,
                                border:
                                    Border.all(color: Colors.white, width: 4),
                                borderRadius: radius(100)),
                            child: imageUrl == " "
                                ? const Icon(Icons.person,
                                    color: Colors.white, size: 80)
                                : Image.network(imageUrl, fit: BoxFit.fitWidth)
                                    .cornerRadiusWithClipRRect(100),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: GestureDetector(
                            onTap: uploadImage,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                  color: Colors.blue, shape: BoxShape.circle),
                              child: const Icon(Icons.edit,
                                  color: Colors.white, size: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
