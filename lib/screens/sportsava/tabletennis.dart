import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mittalcomplex/components/slotbooking/bookedslot.dart';
import 'package:mittalcomplex/components/slotbooking/viewslot.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/slotsdata.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class TableTennis extends StatefulWidget {
  const TableTennis({Key? key}) : super(key: key);

  @override
  State<TableTennis> createState() => _BasketBallState();
}

class _BasketBallState extends State<TableTennis> {
  @override
  Widget build(BuildContext context) {
    SlotsData service = Provider.of<SlotsData>(context, listen: false);
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "TableTennis",
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
                BookedSlot(nav: service.tabSlot()).launch(context);
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
                  'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Ftable%20tennis.jpg?alt=media&token=10842605-f7de-4e46-97dd-dde023932472',
                  fit: BoxFit.fitWidth,
                ).cornerRadiusWithClipRRectOnly(
                  bottomLeft: 90,
                )),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'TableTennis',
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
              "Table tennis, also known as ping-pong and whiff-whaff, is a sport in which two or four players hit a lightweight ball, also known as the ping-pong ball, back and forth across a table using small solid rackets. The game takes place on a hard table divided by a net.",
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
                    ViewSlot(nav: service.tabSlot(), slot: 'tabSlot',).launch(context);
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
