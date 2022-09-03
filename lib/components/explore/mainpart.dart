// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:mittalcomplex/models/model.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/defaultdata.dart';
import '../../utils/widgets.dart';

class VeiwSports extends StatefulWidget {
  const VeiwSports({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VeiwSportsState createState() => _VeiwSportsState();
}

class _VeiwSportsState extends State<VeiwSports> {
  List sportsList = getsportsList();

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      itemCount: 4,
      spacing: 0,
      runSpacing: 0,
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      itemBuilder: (_, index) {
        Model sports = sportsList[index];

        return Container(
          margin: const EdgeInsets.all(4),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              commonCachedNetworkImage(
                sports.img,
                fit: BoxFit.cover,
                height: context.height() * 0.45,
                width: 230,
              ).cornerRadiusWithClipRRect(10).onTap(
                    () {},
                  ),
              Container(
                padding: const EdgeInsets.only(top: 8),
                height: 50,
                width: 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(sports.name!,
                                style: boldTextStyle(color: white, size: 20))
                            .paddingLeft(10),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 4),
        );
      },
    );
  }
}
