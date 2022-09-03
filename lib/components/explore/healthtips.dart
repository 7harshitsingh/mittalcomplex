import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/models/model.dart';
import 'package:mittalcomplex/utils/defaultdata.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/link.dart';

class HealthTipsComponent extends StatefulWidget {
  const HealthTipsComponent({Key? key}) : super(key: key);

  @override
  State<HealthTipsComponent> createState() => _HealthTipsComponentState();
}

class _HealthTipsComponentState extends State<HealthTipsComponent> {
  List healthList = healthtips();

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      padding: const EdgeInsets.only(right: 16),
      itemCount: healthList.length,
      itemBuilder: (BuildContext context, int index) {
        HealthTips health = healthList[index];

        return Link(
          target: LinkTarget.self,
          uri: Uri.parse(health.readmore!),
          builder: (context, followLink) => 
          GestureDetector(
            onTap: followLink,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              width: 300,
              decoration: boxDecorationWithShadow(
                borderRadius: BorderRadius.circular(8),
                boxShadow: defaultBoxShadow(),
                backgroundColor:Colors.white10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 130,
                    width: 115,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5)),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(health.img!),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: 
                    Column(
                      children:[
                        const Padding(padding: EdgeInsets.all(6)),
                        Text(health.title!, style: boldTextStyle(size: 16, color: Colors.white),maxLines: 3,
                          overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
