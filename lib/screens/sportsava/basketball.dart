import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class BasketBall extends StatefulWidget {
  const BasketBall({Key? key}) : super(key: key);

  @override
  State<BasketBall> createState() => _BasketBallState();
}

class _BasketBallState extends State<BasketBall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "BasketBall",
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
          finish(context);
        }),
        actions: [
            const FaIcon(FontAwesomeIcons.listCheck, color: Colors.white, size: 17,).paddingOnly(top: 18, right: 16, ),
          ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //24.height,
            Container(
              alignment: AlignmentDirectional.topEnd,
              decoration: const BoxDecoration(
                color: mcPrimaryColorDark, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))
              ),
              child: Image.network('https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fbasketball.jpg?alt=media&token=2b7cf795-6216-42dc-9966-4b3c818f1734',
              fit: BoxFit.fitWidth,).cornerRadiusWithClipRRectOnly(bottomLeft: 90,)
            ),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('BasketBall', style: primaryTextStyle(size: 40, color: Colors.white, fontFamily: 'Poppins',),).paddingLeft(24),
              ],
            ),
            24.height,
            Text(maxLines: 100,"Basketball is a team sport in which two teams, most commonly of five players each, opposing one another on a rectangular court, compete with the primary objective of shooting a basketball (approximately 9.4 inches (24 cm) in diameter) through the defender's hoop (a basket 18 inches (46 cm) in diameter mounted 10 feet (3.048 m) high to a backboard at each end of the court, while preventing the opposing team from shooting through their own hoop.", style: primaryTextStyle(size: 16, color: Colors.white),).paddingLeft(24),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      ),
                  color: white,
                  onTap: (){},
                  child: Text('Book Slot',
                      style: boldTextStyle(color: Colors.black, size: 26, fontFamily: 'Poppins')),
                ).expand(),
              ],
            ).paddingAll(30),
          ],
        ),
      ),
    );
  }
}
