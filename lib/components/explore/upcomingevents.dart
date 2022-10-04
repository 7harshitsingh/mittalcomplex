import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../models/model.dart';
import '../../utils/colors.dart';
import '../../utils/defaultdata.dart';
import '../../utils/widgets.dart';

class UpcomingEvent extends StatefulWidget {
  const UpcomingEvent({super.key});

  @override
  State<UpcomingEvent> createState() => _UpcomingEventState();
}

class _UpcomingEventState extends State<UpcomingEvent> {
  @override
  Widget build(BuildContext context) {

    Defaultdata service = Provider.of<Defaultdata>(context, listen: false);
    List<UpcomingEvents> upcoming = service.upcomingeventslist();

    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Upcoming Events",
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
            itemCount: upcoming.length,
            itemBuilder: (BuildContext context, int index) {
              UpcomingEvents upcominglist = upcoming[index];
              return listComp(
                  upcominglist.title,
                  upcominglist.venuetime,
                  Icons.event_available,
                  upcominglist.link,
                  Colors.red,
                  upcominglist.buttontext);
            }))
    );
  }
}
