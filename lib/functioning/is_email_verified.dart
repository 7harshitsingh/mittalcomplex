// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/screens/auth/register.dart';
import 'package:mittalcomplex/screens/dashboard/dashboard.dart';
import 'package:mittalcomplex/utils.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/widgets.dart';

class isEmailVerified extends StatefulWidget {
  const isEmailVerified({Key? key}) : super(key: key);

  @override
  State<isEmailVerified> createState() => _isEmailVerifiedState();
}

class _isEmailVerifiedState extends State<isEmailVerified> {
  bool verification = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();

    verification = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!verification) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    setStatusBarColor(transparentColor);
    super.dispose();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 15));
      setState(() => canResendEmail = true);
    } catch (e) {
      Utlis.showSnackbar(e.toString());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      verification = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (verification) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) => verification
      ? const DashboardScreen()
      : Scaffold(
          backgroundColor: mcPrimaryColorDark,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: heading(title: 'Email Verification'),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        'Please check your email, a verification link was sent to the email provided',
                        style: primaryTextStyle(size: 15, color: Colors.white),
                      ),
                      20.height,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppButton(
                              shapeBorder: RoundedRectangleBorder(
                                  borderRadius: radius(5),
                                  side: const BorderSide(
                                      color: Colors.white, width: 1)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              onTap: () {
                                const RegisterScreen().launch(context);
                              },
                              elevation: 0,
                              color: mcPrimaryColor,
                              child: const DefaultTextStyle(
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                child: Text(
                                    "Don't have access to Email. Register again with another Email"),
                              )),
                          20.height,
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                            ),
                            icon: const Icon(
                              Icons.email,
                              size: 20,
                              color: greenColor,
                            ),
                            label: const DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'Inter',
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                              child: Text("Resend Email"),
                            ),
                            onPressed: canResendEmail ? sendVerificationEmail : null,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
}
