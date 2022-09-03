import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/utils.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final emailController = TextEditingController();

  @override
  void initState() {
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    setStatusBarColor(transparentColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      body: Column(
        children: [
          Container(
            child: heading(title: 'Forget Password'),
          ),
          SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.height,
                      Text(
                          'Please enter your email below to receive your password reset instructions.',
                          style:
                              primaryTextStyle(color: Colors.white, size: 14)),
                      30.height,
                      Text('Email',
                          style: primaryTextStyle(
                              color: Colors.white70, size: 14)),
                      AppTextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textFieldType: TextFieldType.EMAIL,
                        cursorColor: mcPrimaryColor,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                        textStyle: boldTextStyle(color: Colors.white),
                        //suffix: const Icon(Icons.check, color: Colors.teal),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                      20.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppButton(
                              shapeBorder: RoundedRectangleBorder(
                                  borderRadius: radius(5),
                                  side: const BorderSide(
                                      color: Colors.white, width: 1)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              onTap: resetpassword,
                              elevation: 0,
                              color: mcPrimaryColor,
                              child: const DefaultTextStyle(
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                                child: Text('Reset'),
                              )),
                        ],
                      )
                    ],
                  ).paddingSymmetric(horizontal: 16))
              .expand()
        ],
      ),
    );
  }

  Future resetpassword() async {
    
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return indicatorBox();
        });

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Utlis.showSnackbar('Password Reset Email was sent');
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      Utlis.showSnackbar(e.message);
    }
    navigatorKey.currentState!.pop();
  }
}
