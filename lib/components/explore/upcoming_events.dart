import 'package:flutter/material.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class UpcomingEventComponent extends StatefulWidget {
  const UpcomingEventComponent({Key? key}) : super(key: key);

  @override
  State<UpcomingEventComponent> createState() => _UpcomingEventComponentState();
}

class _UpcomingEventComponentState extends State<UpcomingEventComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          decoration: boxDecorationRoundedWithShadow(16,
              backgroundColor: mcPrimaryColorDark),
          child: 
          Column(
            children: [
              listComp('Aquatics Trial', 'SAC, 5:30pm onwards', Icons.event_available, 'https://docs.google.com/forms/d/e/1FAIpQLScMhz3XLNhfgyXt3582cMtmC82kmLD7pIHUXN5AsI8s6_A_OA/viewform?usp=sf_link', Colors.blue, 'Apply'),
              listComp('IND v/s PAK (Stream)', 'OAT, 7:00pm onwards', Icons.event_available, 'https://docs.google.com/forms/d/e/1FAIpQLSenXc6PumhSEiibxzQO07rl1u24eQ_NSon_MdaOYTSImYNf4A/viewform?usp=sf_link', Colors.red,'Join'),
              listComp('Lawn Tennis Training', 'Tennis Court, 5:00pm', Icons.event_available, 'https://docs.google.com/forms/d/e/1FAIpQLSeAgoJRs1-yilpQnC8h9RWb_nlZti5oGGDR7ee3vUEp9al0NQ/viewform?usp=sf_link', Colors.blue, 'Apply'),
            ],
          ),
        );
  }
}
