// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:mittalcomplex/models/model.dart';
import 'package:nb_utils/nb_utils.dart';

class LiveCardComponent extends StatefulWidget {
  final LiveScoreCardModel? cardModel;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  LiveCardComponent(this.cardModel);

  @override
  State<LiveCardComponent> createState() => _LiveCardComponentState();
}

class _LiveCardComponentState extends State<LiveCardComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 8),
      decoration: boxDecorationRoundedWithShadow(
        30,
        backgroundColor: widget.cardModel!.color!.withOpacity(0.2),
        blurRadius: 10.0,
        spreadRadius: 4.0,
        shadowColor: widget.cardModel!.color!.withAlpha(50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.network(widget.cardModel!.team1!, height: 30,width: 30,),
              1.width,
              Text('v/s', style: primaryTextStyle(color: Colors.white70, fontFamily: 'Poppins', size: 20),),
              1.width,
              Image.network(widget.cardModel!.team2!, height: 30,width: 30,),
            ],
          ).paddingTop(6),
          24.height,
          Text('Score', style: secondaryTextStyle(color: Colors.white60)),
          8.height,
          Text(widget.cardModel!.score!, style: boldTextStyle(color: Colors.white, size: 18)),
          30.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.cardModel!.venue!, style: secondaryTextStyle(color: Colors.white70,)),
            ],
          ),
        ],
      ),
    ).onTap(() {
      //WASendMoneyViaLoopScreen().launch(context);
    });
  }
}
