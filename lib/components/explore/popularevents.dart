import 'package:flutter/material.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../models/model.dart';
import '../../utils/defaultdata.dart';

class PopularEventComponent extends StatefulWidget {
  const PopularEventComponent({Key? key}) : super(key: key);

  @override
  State<PopularEventComponent> createState() => _PopularEventComponentState();
}

class _PopularEventComponentState extends State<PopularEventComponent> {
  @override
  Widget build(BuildContext context) {
    Defaultdata service = Provider.of<Defaultdata>(context, listen: false);
    List<UpcomingEvents> upcoming = service.upcomingeventslist();

    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
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
                  Colors.blue,
                  upcominglist.buttontext);
            }));
  }
}
