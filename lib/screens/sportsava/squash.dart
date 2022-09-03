import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class Squash extends StatefulWidget {
  const Squash({Key? key}) : super(key: key);

  @override
  State<Squash> createState() => _SquashState();
}

class _SquashState extends State<Squash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Squash",
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
              child: Image.network('https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fsquash.jpg?alt=media&token=bcb8b827-ad2e-4393-80a7-56ec93abc84f',
              fit: BoxFit.fitWidth,).cornerRadiusWithClipRRectOnly(bottomLeft: 90,)
            ),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Squash', style: primaryTextStyle(size: 40, color: Colors.white, fontFamily: 'Poppins',),).paddingLeft(24),
              ],
            ),
            24.height,
            Text(maxLines: 100,"Squash is a racket and ball sport played by two or four players in a four-walled court with a small, hollow rubber ball. The players alternate in striking the ball with their rackets onto the playable surfaces of the four walls of the court. The objective of the game is to hit the ball in such a way that the opponent is not able to play a valid return.", style: primaryTextStyle(size: 16, color: Colors.white),).paddingLeft(24),
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
