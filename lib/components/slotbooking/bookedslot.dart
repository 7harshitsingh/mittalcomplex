import 'package:flutter/material.dart';
import 'package:mittalcomplex/models/slotsmodel.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/colors.dart';
import '../../utils/widgets.dart';

class BookedSlot extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final nav;
  // ignore: use_key_in_widget_constructors
  const BookedSlot({required this.nav});

  @override
  State<BookedSlot> createState() => _BookedSlotState();
}

class _BookedSlotState extends State<BookedSlot> {
  @override
  Widget build(BuildContext context) {

    List<SlotsModel> allslotsinfo = widget.nav;
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
            padding: const EdgeInsets.only(left: 16, right: 16),
            margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16),
            decoration: boxDecorationRoundedWithShadow(16,
                backgroundColor: mcPrimaryColorDark),
            child: ListView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: allslotsinfo.length,
                itemBuilder: (BuildContext context, int index) {
                  SlotsModel allslotsinfolist = allslotsinfo[index];
                  return allslotsinfolist.booked == true ? bookedslotlist(
                      allslotsinfolist.time, allslotsinfolist.bookedby) : const SizedBox.shrink();
                })));
  }
}
