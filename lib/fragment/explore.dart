import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mittalcomplex/components/explore/mainpart.dart';
import 'package:mittalcomplex/components/explore/profilescreen.dart';
import 'package:mittalcomplex/components/explore/upcoming_events.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/explore/healthtips.dart';

// ignore: must_be_immutable
class ExploreFragment extends StatefulWidget {
  String? title;

  ExploreFragment({Key? key, this.title}) : super(key: key);

  @override
  ExploreFragmentState createState() => ExploreFragmentState();
}

class ExploreFragmentState extends State<ExploreFragment> {
  String avatar = " ";
  //int sceneIndex = 0;
  final auth = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    fetchImage();
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: mcPrimaryColorDark,
        body: SingleChildScrollView(
          //physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    child: Text('Hello,'),
                  ).paddingLeft(16),
                  GestureDetector(
                    onTap: () {
                      const ProfileScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
                    },
                    child: avatar == " "
                        ? const Icon(Icons.person,
                            color: Colors.white, size: 28)
                        : Image.network(avatar,
                                fit: BoxFit.fitWidth, height: 40, width: 40,)
                            .cornerRadiusWithClipRRect(100),
                  ).paddingRight(20),
                ],
              ),
              24.height,
              Container(
                //width: context.width(),
                //height: context.height(),
                decoration: const BoxDecoration(
                  color: mcPrimaryColor,
                ),
                child: Column(
                  children: [
                    Row(
                    mainAxisAlignment : MainAxisAlignment.start,
                    children: [
                      const DefaultTextStyle(
                        style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        ),
                        child: Text('Spotlight'),
                      ).paddingLeft(16),
                      8.width,
                      const FaIcon(FontAwesomeIcons.faceSmile, color: white, size: 18,)
                    ],),
                    const VeiwSports(),
                    12.height,
                    Row(
                    mainAxisAlignment : MainAxisAlignment.start,
                    children: [
                      const DefaultTextStyle(
                        style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        ),
                        child: Text('Upcoming Events'),
                      ).paddingLeft(16),
                      8.width,
                      const FaIcon(FontAwesomeIcons.empire, color: white, size: 18,)
                    ],),
                    16.height,
                    const UpcomingEventComponent(),
                    Row(
                    mainAxisAlignment : MainAxisAlignment.start,
                    children: [
                      const DefaultTextStyle(
                        style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        ),
                        child: Text('Health Tips'),
                      ).paddingLeft(16),
                      8.width,
                      const FaIcon(FontAwesomeIcons.heart, color: white, size: 18,)
                    ],),
                  20.height,
                  const HealthTipsComponent(),
                  24.height,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
