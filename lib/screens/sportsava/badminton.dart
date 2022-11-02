import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mittalcomplex/components/slotbooking/bookedslot.dart';
import 'package:mittalcomplex/components/slotbooking/viewslot.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../utils/slotsdata.dart';

class Badminton extends StatefulWidget {
  const Badminton({Key? key}) : super(key: key);

  @override
  State<Badminton> createState() => _BadmintonState();
}

class _BadmintonState extends State<Badminton> {
  @override
  Widget build(BuildContext context) {
    SlotsData service = Provider.of<SlotsData>(context, listen: false);
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Badminton",
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
                BookedSlot(nav: service.banSlot()).launch(context);
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
                  'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fbadminton.jpg?alt=media&token=d6dcd4ef-dbe3-4d92-a594-03a17c4cd168',
                  fit: BoxFit.fitWidth,
                ).cornerRadiusWithClipRRectOnly(
                  bottomLeft: 90,
                )),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Badminton',
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
              "Badminton is a racquet sport played using racquets to hit a shuttlecock across a net. Although it may be played with larger teams, the most common forms of the game are singles (with one player per side) and doubles (with two players per side). Badminton is often played as a casual outdoor activity in a yard or on a beach; formal games are played on a rectangular indoor court. Points are scored by striking the shuttlecock with the racquet and landing it within the opposing side's half of the court.",
              maxLines: 100,
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
                    ViewSlot(
                      nav: service.banSlot(),
                      slot: 'banSlot',
                    ).launch(context);
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
