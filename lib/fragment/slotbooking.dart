import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mittalcomplex/screens/sportsava/badminton.dart';
import 'package:mittalcomplex/screens/sportsava/basketball.dart';
import 'package:mittalcomplex/screens/sportsava/boxing.dart';
import 'package:mittalcomplex/screens/sportsava/darts.dart';
import 'package:mittalcomplex/screens/sportsava/martialart.dart';
import 'package:mittalcomplex/screens/sportsava/squash.dart';
import 'package:mittalcomplex/screens/sportsava/tabletennis.dart';
import 'package:mittalcomplex/screens/sportsava/volleyball.dart';
import 'package:mittalcomplex/screens/sportsava/yoga.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screens/sportsava/kabaddi.dart';
import '../utils/defaultdata.dart';

class BookFragment extends StatefulWidget {
  const BookFragment({Key? key}) : super(key: key);

  @override
  State<BookFragment> createState() => _BookFragmentState();
}

class _BookFragmentState extends State<BookFragment> {
  List sportsList = getsportsList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: mcPrimaryColorDark,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                  child: Text('Book'),
                ).paddingLeft(16),
                GestureDetector(
                  onTap: () {
                    //const BookMainPart().launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
                  },
                  child: const Icon(
                    Icons.add,
                    size: 28,
                    color: whiteColor,
                  ),
                ).paddingRight(20),
              ],
            ),
            24.height,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      child: Text('Sports Available'),
                    ).paddingLeft(16),
                    8.width,
                    const FaIcon(
                      FontAwesomeIcons.listCheck,
                      color: white,
                      size: 18,
                    )
                  ],
                ),
                //const BookMainPart(),
                24.height,
                sportsContainer(
                  title1: 'Martial Arts',
                  img1:
                      'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fmartialarts.jpg?alt=media&token=4f9ab42f-6c69-497b-b597-2aa90ac6818d',
                  onTap1: () {
                    const MartialArt().launch(context);
                  },
                  title2: 'Volley Ball',
                  img2:
                      'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fvolleyball.jpg?alt=media&token=91823142-1fe3-4887-b131-233e3a0da1ab',
                  onTap2: () {
                    const VolleyBall().launch(context);
                  },
                ),
                24.height,
                sportsContainer(
                  title1: 'Squash',
                  img1:
                      'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fsquash.jpg?alt=media&token=bcb8b827-ad2e-4393-80a7-56ec93abc84f',
                  onTap1: () {
                    const Squash().launch(context);
                  },
                  title2: 'Basket Ball',
                  img2:
                      'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fbasketball.jpg?alt=media&token=2b7cf795-6216-42dc-9966-4b3c818f1734',
                  onTap2: () {
                    const BasketBall().launch(context);
                  },
                ),
                24.height,
                sportsContainer(
                  title1: 'Darts',
                  img1:
                      'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fdarts.jpg?alt=media&token=fdf96fa0-7556-4bf2-a36a-715face3dfa6',
                  onTap1: () {
                    const Darts().launch(context);
                  },
                  title2: 'Badminton',
                  img2:
                      'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fbadminton.jpg?alt=media&token=d6dcd4ef-dbe3-4d92-a594-03a17c4cd168',
                  onTap2: () {
                    const Badminton().launch(context);
                  },
                ),
                24.height,
                sportsContainer(
                  title1: 'Boxing',
                  img1:
                      'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fboxing.jpg?alt=media&token=fbe063b7-f5f8-4ba3-a1d1-0de6edd98e51',
                  onTap1: () {
                    const Boxing().launch(context);
                  },
                  title2: 'Kabaddi',
                  img2:
                      'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fkabaddi.jpg?alt=media&token=dc7a121d-a823-4e09-9a6f-4096cb398bc0',
                  onTap2: () {
                    const Kabaddi().launch(context);
                  },
                ),
                24.height,
                sportsContainer(
                  title1: 'Table Tennis',
                  img1:
                      'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Ftable%20tennis.jpg?alt=media&token=10842605-f7de-4e46-97dd-dde023932472',
                  onTap1:() {
                    const TableTennis().launch(context);
                  },
                  title2: 'Yoga',
                  img2:
                      'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fyoga.jpg?alt=media&token=e12ad191-bd2b-4075-b12e-b7544b0ea426',
                  onTap2: () {
                    const Yoga().launch(context);
                  },
                ),
                24.height,
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
