import 'package:flutter/material.dart';
import 'package:mittalcomplex/models/slotsmodel.dart';
import 'package:mittalcomplex/utils/slotsdata.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import '../../utils/widgets.dart';

class BookedSlot extends StatefulWidget {
  const BookedSlot({super.key});

  @override
  State<BookedSlot> createState() => _BookedSlotState();
}

class _BookedSlotState extends State<BookedSlot> {
  @override
  Widget build(BuildContext context) {
    SlotsData service = Provider.of<SlotsData>(context, listen: false);
    List<SlotsModel> allslotsinfo = service.banSlot();

    return Scaffold(
        backgroundColor: mcPrimaryColorDark,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Booked Slots",
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
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            decoration: boxDecorationRoundedWithShadow(16,
                backgroundColor: mcPrimaryColorDark),
            child: ListView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: allslotsinfo.length,
                itemBuilder: (BuildContext context, int index) {
                  SlotsModel allslotsinfolist = allslotsinfo[index];
                  if (allslotsinfolist.booked == true) {}
                  return bookedslotlist(
                      allslotsinfolist.time, allslotsinfolist.bookedby);
                })));
  }
}
