import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mittalcomplex/functioning/is_email_verified.dart';
import 'package:mittalcomplex/screens/auth/login.dart';
import 'package:mittalcomplex/screens/custom/getstarted.dart';
import 'package:mittalcomplex/utils.dart';
import 'package:mittalcomplex/utils/apptheme.dart';
import 'package:mittalcomplex/utils/defaultdata.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => Defaultdata()
        )
      ],
      child: const mittalcomplex(),
    )
  );
}

// ignore: camel_case_types
class mittalcomplex extends StatelessWidget {
  const mittalcomplex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '$appName${!isMobile ? ' ${platformName()}' : ''}',
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const LoginScreen();
              } else if (snapshot.hasData) {
                return const isEmailVerified();
              } else {
                return const GetStartedScreen();
              }
            }),

        theme: AppTheme.lightTheme,
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        //supportedLocales: LanguageDataModel.languageLocales(),
        //localeResolutionCallback: (locale, supportedLocales) => locale,
        scaffoldMessengerKey: Utlis.messengerKey,
      ),
    );
  }
}
