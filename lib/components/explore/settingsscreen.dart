// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/components/explore/upcomingevents.dart';
import 'package:mittalcomplex/screens/custom/getstarted.dart';
import 'package:mittalcomplex/screens/custom/memebership.dart';
import 'package:mittalcomplex/screens/custom/termsandconditions.dart';
import 'package:mittalcomplex/screens/dashboard/dashboard.dart';
import 'package:mittalcomplex/screens/profilesetup/addposition.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../screens/profilesetup/viewprofile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
          "Settings",
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
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const DashboardScreen(),
            ),
            (route) => false,
          );
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
                settingsContainer(
                    icon: Icons.view_agenda,
                    title: 'Veiw Profile',
                    textColor: white,
                    onTap: () {
                      const ViewProfileScreen().launch(context);
                    }),
                settingsContainer(
                  icon: Icons.event_available,
                  title: 'Upcoming Events',
                  textColor: white,
                  onTap: () {
                    const UpcomingEvent().launch(context);
                  },
                ),
                settingsContainer(
                    icon: Icons.card_membership_rounded,
                    title: 'Membership',
                    textColor: white,
                    onTap: () {
                      const Membership().launch(context);
                    }),
                settingsContainer(
                  icon: Icons.edit,
                  title: 'Edit Profile',
                  textColor: white,
                  onTap: () {
                    const AddPosition().launch(context);
                  },
                ),
                16.height,
                settingsContainer(
                    icon: Icons.chat,
                    title: 'Terms and Conditions',
                    textColor: white,
                    onTap: () {
                      const TermsandCondition().launch(context);
                    }),
                settingsContainer(
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
                settingsContainer(
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
                settingsContainer(
                    icon: Icons.verified,
                    title: 'Admin/Staff Verification',
                    textColor: Colors.blue,
                    onTap: () async {
                      const email = "verification@devclub.iitd.ac.in";
                      const url = "mailto:$email";

                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      }
                    }),
                Text(
                  'Version 1.0.0',
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
