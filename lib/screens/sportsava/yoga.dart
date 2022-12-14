import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mittalcomplex/components/slotbooking/bookedslot.dart';
import 'package:mittalcomplex/components/slotbooking/viewslot.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/slotsdata.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class Yoga extends StatefulWidget {
  const Yoga({Key? key}) : super(key: key);

  @override
  State<Yoga> createState() => _YogaState();
}

class _YogaState extends State<Yoga> {
  @override
  Widget build(BuildContext context) {
    SlotsData service = Provider.of<SlotsData>(context, listen: false);
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Yoga",
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
          GestureDetector(
              onTap: () {
                BookedSlot(nav: service.yogSlot()).launch(context);
              },
              child: const FaIcon(
                FontAwesomeIcons.listCheck,
                color: Colors.white,
                size: 17,
              ).paddingOnly(
                top: 18,
                right: 16,
              )),
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
                    color: mcPrimaryColorDark,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(30))),
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fyoga.jpg?alt=media&token=e12ad191-bd2b-4075-b12e-b7544b0ea426',
                  fit: BoxFit.fitWidth,
                ).cornerRadiusWithClipRRectOnly(
                  bottomLeft: 90,
                )),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Yoga',
                  style: primaryTextStyle(
                    size: 40,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ).paddingLeft(24),
              ],
            ),
            24.height,
            Text(
              maxLines: 100,
              "Yoga is a group of physical, mental, and spiritual practices or disciplines which originated in ancient India and aim to control (yoke) and still the mind, recognizing a detached witness-consciousness untouched by the mind (Chitta) and mundane suffering (Du???kha). There is a wide variety of schools of yoga, practices, and goals in Hinduism, Buddhism, and Jainism, and traditional and modern yoga is practiced worldwide.",
              style: primaryTextStyle(size: 16, color: Colors.white),
            ).paddingLeft(24),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: white,
                  onTap: () {
                    ViewSlot(nav: service.yogSlot(), slot: 'yogSlot',).launch(context);
                  },
                  child: Text('View Slots',
                      style: boldTextStyle(
                          color: Colors.black,
                          size: 26,
                          fontFamily: 'Poppins')),
                ).expand(),
              ],
            ).paddingAll(30),
          ],
        ),
      ),
    );
  }
}
