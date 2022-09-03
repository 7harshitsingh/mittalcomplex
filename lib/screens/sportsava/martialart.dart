import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class MartialArt extends StatefulWidget {
  const MartialArt({Key? key}) : super(key: key);

  @override
  State<MartialArt> createState() => _MartialArtState();
}

class _MartialArtState extends State<MartialArt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "MartialArt",
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
              child: Image.network('https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fmartialarts.jpg?alt=media&token=4f9ab42f-6c69-497b-b597-2aa90ac6818d',
              fit: BoxFit.fitWidth,).cornerRadiusWithClipRRectOnly(bottomLeft: 90,)
            ),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('MartialArt', style: primaryTextStyle(size: 40, color: Colors.white, fontFamily: 'Poppins',),).paddingLeft(24),
              ],
            ),
            24.height,
            Text(maxLines: 100,"Martial arts are codified systems and traditions of combat practiced for a number of reasons such as self-defense; military and law enforcement applications; competition; physical, mental, and spiritual development; entertainment; and the preservation of a nation's intangible cultural heritage.", style: primaryTextStyle(size: 16, color: Colors.white),).paddingLeft(24),
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
