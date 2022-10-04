import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class Darts extends StatefulWidget {
  const Darts({Key? key}) : super(key: key);

  @override
  State<Darts> createState() => _DartsState();
}

class _DartsState extends State<Darts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Darts",
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
              child: Image.network('https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fdarts.jpg?alt=media&token=fdf96fa0-7556-4bf2-a36a-715face3dfa6',
              fit: BoxFit.fitWidth,).cornerRadiusWithClipRRectOnly(bottomLeft: 90,)
            ),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Darts', style: primaryTextStyle(size: 40, color: Colors.white, fontFamily: 'Poppins',),).paddingLeft(24),
              ],
            ),
            24.height,
            Text(maxLines: 100,"Darts or dart-throwing is a competitive sport in which two or more players bare-handedly throw small sharp-pointed missiles known as darts at a round target known as a dartboard.", style: primaryTextStyle(size: 16, color: Colors.white),).paddingLeft(24),
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
                  child: Text('View Slot',
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
