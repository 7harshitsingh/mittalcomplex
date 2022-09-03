import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/screens/auth/login.dart';
import 'package:mittalcomplex/utils.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
        child: Column(
          children: [
            Container(
              child: headerText(title: 'Register'),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Already have a account -',
                            style:
                                boldTextStyle(color: Colors.white, size: 14)),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  const LoginScreen().launch(context);
                                },
                                child: const Text(
                                  'Login',
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
                    Text('Enter email address',
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
                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Create your Password',
                            style: primaryTextStyle(
                                color: Colors.white70, size: 14)),
                      ],
                    ),
                    AppTextField(
                      controller: passwordController,
                      textFieldType: TextFieldType.PASSWORD,
                      cursorColor: mcPrimaryColor,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter min. 6 characters'
                          : null,
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
                            onTap: signup,
                            elevation: 0,
                            color: mcPrimaryColor,
                            child: const DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              child: Text('Register'),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future signup() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return indicatorBox();
        });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
