import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mittalcomplex/fragment/explore.dart';
import 'package:mittalcomplex/fragment/livescore.dart';
import 'package:mittalcomplex/fragment/myslots.dart';
import 'package:mittalcomplex/fragment/slotbooking.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mittalcomplex/widgets/bottombar.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../models/model.dart';
import '../../utils.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  late final FirebaseMessaging _messaging;
  PushNotification? _notificationInfo;

  List<Widget> dashBoardScreenList = [
    ExploreFragment(),
    const MySlotFragment(),
    const BookFragment(),
    const LiveScoreFragment(),
  ];

  Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // ignore: avoid_print
  print("Handling a background message: ${message.messageId}");
}

  void registerNotification() async {
  await Firebase.initializeApp();

  _messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  NotificationSettings settings = await _messaging.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      if (_notificationInfo != null) {
        showSimpleNotification(
          Text(_notificationInfo!.title!),
          //leading: NotificationBadge(totalNotifications: _totalNotifications),
          subtitle: Text(_notificationInfo!.body!),
          background: Colors.cyan.shade700,
          duration: const Duration(seconds: 2),
        );
      }

      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
      );

      setState(() {
        _notificationInfo = notification;
      });
    });
  } else {
    //print('User declined or has not accepted permission');
    Utlis.showSnackbar("User declined or has not accepted notifications permission");
  }
}

  @override
  void initState() {
    setStatusBarColor(mcPrimaryColorDark); 
    checkForInitialMessage();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
      );
      setState(() {
        _notificationInfo = notification;
      });
    });
    super.initState();
  }

  checkForInitialMessage() async {
  await Firebase.initializeApp();
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    PushNotification notification = PushNotification(
      title: initialMessage.notification?.title,
      body: initialMessage.notification?.body,
    );
    setState(() {
      _notificationInfo = notification;
    });
  }
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: mcPrimaryColor,
      body: dashBoardScreenList[_currentIndex],
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        curve: Curves.easeIn,
        backgroundColor: mcPrimaryColorDark,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavyBarItem(
              icon: const Icon(FontAwesome.home),
              title: Text('Explore',
                  style: boldTextStyle(color: Colors.white, size: 16))),
          BottomNavyBarItem(
              icon: const Icon(Icons.list_alt),
              title: Text('My Slots',
                  style: boldTextStyle(color: Colors.white, size: 16))),
          BottomNavyBarItem(
              icon: const Icon(Icons.add_box_outlined),
              title: Text('Book',
                  style: boldTextStyle(color: Colors.white, size: 16))),
          BottomNavyBarItem(
              icon: const Icon(Icons.circle_rounded, color: Colors.red),
              title: Text('Live',
                  style: boldTextStyle(color: Colors.red, size: 16))),
        ],
      ).paddingTop(12),
    );
  }
}
