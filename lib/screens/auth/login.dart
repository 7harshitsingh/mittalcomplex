import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mittalcomplex/screens/auth/forgot.dart';
import 'package:mittalcomplex/screens/auth/googlesignin.dart';
import 'package:mittalcomplex/screens/auth/register.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    setStatusBarColor(transparentColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                child: headerText(title: 'Login'),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Not a member yet?',
                            style:
                                boldTextStyle(color: Colors.white, size: 14)),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  const RegisterScreen().launch(context);
                                },
                                child: const Text(
                                  'Register Now',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                )),
                            const Icon(Icons.arrow_forward_ios,
                                color: Colors.white, size: 16),
                          ],
                        ),
                      ],
                    ),
                    10.height,
                    Text('Enter your email',
                        style:
                            primaryTextStyle(color: Colors.white70, size: 14)),
                    AppTextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textFieldType: TextFieldType.EMAIL,
                      cursorColor: mcPrimaryColor,
                      //autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,
                      textStyle: boldTextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                    4.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Password',
                            style: primaryTextStyle(
                                color: Colors.white70, size: 14)),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                const ForgotScreen().launch(context);
                              },
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                color: Colors.white, size: 16),
                          ],
                        ),
                      ],
                    ),
                    AppTextField(
                      controller: passwordController,
                      textFieldType: TextFieldType.PASSWORD,
                      cursorColor: mcPrimaryColor,
                      textStyle: boldTextStyle(color: Colors.white),
                      suffixIconColor: mcPrimaryColor,
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
                            onTap: login,
                            elevation: 0,
                            color: mcPrimaryColor,
                            child: const DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              child: Text('Login'),
                            )),
                      ],
                    ),
                    30.height,
                    Text(
                      'or continue with',
                      style: secondaryTextStyle(color: Colors.white70),
                    ).center(),
                    20.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.googleLogin();
                          },
                          child: const FaIcon(
                            FontAwesomeIcons.google,
                            size: 30,
                            color: white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future login() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return indicatorBox();
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);

      Utlis.showSnackbar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
