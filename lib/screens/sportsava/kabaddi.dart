import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mittalcomplex/components/slotbooking/bookedslot.dart';
import 'package:mittalcomplex/components/slotbooking/viewslot.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../utils/slotsdata.dart';

class Kabaddi extends StatefulWidget {
  const Kabaddi({Key? key}) : super(key: key);

  @override
  State<Kabaddi> createState() => _KabaddiState();
}

class _KabaddiState extends State<Kabaddi> {
  @override
  Widget build(BuildContext context) {
    SlotsData service = Provider.of<SlotsData>(context, listen: false);
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Kabaddi",
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
                BookedSlot(
                  nav: service.kabSlot(),
                ).launch(context);
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
                  'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fkabaddi.jpg?alt=media&token=dc7a121d-a823-4e09-9a6f-4096cb398bc0',
                  fit: BoxFit.fitWidth,
                ).cornerRadiusWithClipRRectOnly(
                  bottomLeft: 90,
                )),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Kabaddi',
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
              "Kabaddi is a contact team sport. Played between two teams of seven players, the objective of the game is for a single player on offence, referred to as a raider, to run into the opposing team's half of a court, touch out as many of their defenders as possible, and return to their own half of the court, all without being tackled by the defenders, and in a single breath.[2] Points are scored for each player tagged by the raider, while the opposing team earns a point for stopping the raider. Players are taken out of the game if they are touched or tackled, but are brought back in for each point scored by their team from a tag or tackle.",
              style: primaryTextStyle(size: 16, color: Colors.white),
              maxLines: 100,
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
                      nav: service.kabSlot(),
                      slot: 'kabSlot',
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
