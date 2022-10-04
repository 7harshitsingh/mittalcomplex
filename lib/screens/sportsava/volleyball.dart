import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class VolleyBall extends StatefulWidget {
  const VolleyBall({Key? key}) : super(key: key);

  @override
  State<VolleyBall> createState() => _VolleyBallState();
}

class _VolleyBallState extends State<VolleyBall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "VolleyBall",
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
              child: Image.network('https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fvolleyball.jpg?alt=media&token=91823142-1fe3-4887-b131-233e3a0da1ab',
              fit: BoxFit.fitWidth,).cornerRadiusWithClipRRectOnly(bottomLeft: 90,)
            ),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('VolleyBall', style: primaryTextStyle(size: 40, color: Colors.white, fontFamily: 'Poppins',),).paddingLeft(24),
              ],
            ),
            24.height,
            Text(maxLines: 100,"Volleyball is a team sport in which two teams of six players are separated by a net. Each team tries to scorepoints by grounding a ball on the other team's court under organized rules.[1] It has been a part of the official program of the Summer Olympic Games since Tokyo 1964. Beach volleyball was introduced to the programme at the Atlanta 1996. The adapted version of volleyball at the Summer Paralympic Games is sitting volleyball.", style: primaryTextStyle(size: 16, color: Colors.white),).paddingLeft(24),
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
