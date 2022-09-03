// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/screens/custom/getstarted.dart';
import 'package:mittalcomplex/screens/dashboard/dashboard.dart';
import 'package:mittalcomplex/screens/profilesetup/addposition.dart';
import 'package:mittalcomplex/screens/profilesetup/viewprofile.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile",
          style: boldTextStyle(color: Colors.white),
        ),
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: boxDecorationWithRoundedCorners(
            backgroundColor: transparentColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ).onTap(() {
          const DashboardScreen().launch(context);
        }),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: mcSpecialColor,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            width: context.width(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileContainer(
                    icon: Icons.view_agenda,
                    title: 'Veiw Profile',
                    textColor: white,
                    onTap: () {
                      const ViewProfileScreen().launch(context);
                    }),
                profileContainer(
                  icon: Icons.group,
                  title: 'Staffs',
                  textColor: white,
                  onTap: () {
                    //SHMemberScreen().launch(context, pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
                  },
                ),
                profileContainer(
                    icon: Icons.settings,
                    title: 'Settings',
                    textColor: white,
                    onTap: () {}),
                profileContainer(
                  icon: Icons.edit,
                  title: 'Setup Basics',
                  textColor: white,
                  onTap: () {
                    const AddPosition().launch(
                      context,
                      pageRouteAnimation: PageRouteAnimation.SlideBottomTop,
                    );
                  },
                ),
                16.height,
                profileContainer(
                    icon: Icons.chat,
                    title: 'Terms of use',
                    textColor: white,
                    onTap: () {}),
                profileContainer(
                    icon: Icons.mail,
                    title: 'FeedBack',
                    textColor: white,
                    onTap: () async {
                      const email = "harshitsingh2511@gmail.com";
                      const url = "mailto:$email";

                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      }
                    }),
                profileContainer(
                    icon: Icons.logout,
                    title: 'SignOut',
                    textColor: Colors.deepOrange,
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) =>
                              const GetStartedScreen(),
                        ),
                        (route) => false,
                      );
                    }),
                16.height,
                profileContainer(
                    //icon: Icons.send,
                    title: 'Admin/Staff Zone',
                    textColor: Colors.blue,
                    onTap: () {}),
                Text(
                  'Version 11',
                  style: secondaryTextStyle(size: 12),
                ).paddingLeft(16)
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
