import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      body: SingleChildScrollView(
          child: Column(children: [
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
              child: Text('Notifications'),
            ).paddingLeft(16),
          ],
        ),
      ])),
    );
  }
}
