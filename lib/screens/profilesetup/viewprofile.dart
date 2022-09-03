import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/components/explore/profilescreen.dart';
import 'package:mittalcomplex/screens/profilesetup/addabout.dart';
import 'package:mittalcomplex/screens/profilesetup/addfav.dart';
import 'package:mittalcomplex/screens/profilesetup/addheightandweight.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({Key? key}) : super(key: key);

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  String name = " ";
  String role = " ";
  String program = " ";
  String id = " ";
  String about = " ";
  String height = " ";
  String weight = " ";
  String fav = " ";
  String avatar = " ";
  final auth = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    fetchImage();
    fetchData();
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetchData() async {
    // ignore: await_only_futures
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('Member')
          .doc(auth.uid)
          .get()
          .then((info) {
        name = info.data()!['name'];
        role = info.data()!['role'];
        program = info.data()!['program'];
        id = info.data()!['kerberos'];
        about = info.data()!['about'];
        height = info.data()!['height'];
        weight = info.data()!['weight'];
        fav = info.data()!['fav'];
      }).catchError((e) {
        // ignore: avoid_print
        print(e);
      });
    }
  }

  void fetchImage() async {
    final path = auth.uid;
    final ref = FirebaseStorage.instance
        .ref()
        .child('Member/profile/$path/myprofilepic');

    ref.getDownloadURL().then((value) {
      setState(() {
        avatar = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: transparentColor,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: boxDecorationWithRoundedCorners(
            backgroundColor: transparentColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ).onTap(() {
          const ProfileScreen().launch(context);
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            30.height,
            Container(
              decoration: BoxDecoration(
                  color: mcPrimaryColor,
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: radius(100)),
              child: avatar == " "
                  ? const Icon(Icons.person, color: Colors.white, size: 150)
                  : Image.network(
                      avatar,
                      fit: BoxFit.fitWidth,
                      height: 150,
                      width: 150,
                    ).cornerRadiusWithClipRRect(100),
            ).center(),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      );
                    }
                    return DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      child: Text(name),
                    );
                  },
                ),
              ],
            ),
            7.height,
            Text(auth.uid,
                style: secondaryTextStyle(color: Colors.white54, size: 12)),
            8.height,
            Text((auth.email!),
                style: secondaryTextStyle(color: Colors.white54, size: 12)),
            24.height,
            Container(
                width: 80,
                height: 35,
                alignment: Alignment.center,
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: BorderRadius.circular(30),
                  backgroundColor: Colors.blue.withOpacity(0.2),
                ),
                child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    return Text(
                      role,
                      style: boldTextStyle(
                        size: 15,
                        color: Colors.blue,
                      ),
                    );
                  },
                )),
            4.height,
            Container(
                width: 180,
                height: 35,
                alignment: Alignment.center,
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: BorderRadius.circular(30),
                  backgroundColor: Colors.yellow.withOpacity(0.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: fetchData(),
                      builder: (context, snapshot) {
                        return Text(
                          program,
                          style: boldTextStyle(
                            size: 13,
                            color: Colors.yellow,
                          ),
                        );
                      },
                    ),
                    3.width,
                    Text(
                      '/',
                      style: primaryTextStyle(color: Colors.yellow),
                    ),
                    3.width,
                    FutureBuilder(
                      future: fetchData(),
                      builder: (context, snapshot) {
                        return Text(
                          id,
                          style: boldTextStyle(
                            size: 13,
                            color: Colors.yellow,
                          ),
                        );
                      },
                    ),
                  ],
                )),
            36.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  child: Text('About'),
                ).paddingLeft(36),
                GestureDetector(
                    onTap: () {
                      const AddAbout().launch(context,
                          pageRouteAnimation: PageRouteAnimation.Scale);
                    },
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.white70,
                    )).paddingRight(36),
              ],
            ),
            6.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white70,
                      );
                    }
                    return Text(
                      about,
                      style: secondaryTextStyle(
                        size: 14,
                        color: Colors.white70,
                      ),
                    );
                  },
                ),
              ],
            ).paddingSymmetric(horizontal: 36),
            6.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  child: Text('Height/Weight'),
                ).paddingLeft(36),
                GestureDetector(
                    onTap: () {
                      const AddHeightandWeight().launch(context,
                          pageRouteAnimation: PageRouteAnimation.Scale);
                    },
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.white70,
                    )).paddingRight(36),
              ],
            ),
            6.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white70,
                      );
                    }
                    return Row(
                      children: [
                        Text(
                          height,
                          style: secondaryTextStyle(
                            size: 14,
                            color: Colors.white70,
                          ),
                        ),
                        4.width,
                        Text(
                          weight,
                          style: secondaryTextStyle(
                            size: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ).paddingSymmetric(horizontal: 36),
            6.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  child: Text('Favourite Sports'),
                ).paddingLeft(36),
                GestureDetector(
                    onTap: () {
                      const AddFav().launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
                    },
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.white70,
                    )).paddingRight(36),
              ],
            ),
            6.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white70,
                      );
                    }
                    return Text(
                      fav,
                      style: secondaryTextStyle(
                        size: 14,
                        color: Colors.white70,
                      ),
                    );
                  },
                ),
              ],
            ).paddingSymmetric(horizontal: 36),
            6.height,
          ],
        ),
      ),
    );
  }
}
