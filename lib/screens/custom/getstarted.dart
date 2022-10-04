import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/screens/custom/termsandconditions.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../auth/login.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: context.width(),
          height: context.height(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/mittal1.jpg"), fit: BoxFit.cover),
            color: Colors.white10,
          ),
          child: Stack(children: [
            const Padding(padding: EdgeInsets.all(8)),
            //50.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20.0, height: 80),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('mittal complex'),
                      RotateAnimatedText('IIT Delhi'),
                    ],
                    repeatForever: true,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultTextStyle(
                  style: primaryTextStyle(
                      size: 12, color: Colors.white70, fontFamily: 'Inter'),
                  textAlign: TextAlign.center,
                  child: const Text(
                    'World Class Indoor Sports Complex Built with the Support of Mr Saurabh Mittal. He was an engineer from the elite IIT Delhi, and a Harvard B-School grad, He started out in the hedge fund business. He cofounded Indian real estate and financial services group Indiabulls in 1999. In 2014 he sold a chunk of his shares in Indiabulls and moved to Singapore. His private investment firm Mission Holdings holds stakes in several ventures including One Championship, martial art firm.',
                    maxLines: 10,
                  ).paddingAll(24),
                ),
                //250.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.only(bottom: 50)),
                        AppButton(
                            shapeBorder:
                                RoundedRectangleBorder(borderRadius: radius(5)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            onTap: () {
                              const LoginScreen().launch(context);
                            },
                            elevation: 0,
                            color: mcPrimaryColor,
                            child: const DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              child: Text('Get Started'),
                            )
                          ),
                          7.height,
                          GestureDetector(
                            onTap: () {
                              const TermsandCondition().launch(context);
                            },
                            child: Text(
                              'Terms and Conditions*',
                              style: boldTextStyle(size: 13, color: orangeRed, fontFamily: 'Poppins'),
                            )
                          )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ])),
    );
  }
}
