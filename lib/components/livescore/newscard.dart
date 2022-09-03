import 'package:flutter/material.dart';
import 'package:mittalcomplex/models/model.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/link.dart';

class NewsCard extends StatefulWidget {
  static String tag = '/NBNewsComponent';
  final List<NewsModel>? list;

  // ignore: use_key_in_widget_constructors
  const NewsCard({this.list});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {

  @override
  void initState() {
    setStatusBarColor(mcPrimaryColor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: widget.list!.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        NewsModel mData = widget.list![index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Link(
                  target: LinkTarget.self,
                  uri: Uri.parse('${mData.details}'),
                  builder: (context, followLink) => 
                  GestureDetector(
                    onTap: followLink,
                    child: Text('${mData.title}',
                        style: boldTextStyle(color: white.withOpacity(0.7)),
                        softWrap: true,
                        maxLines: 3),
                  ),
                ),
                8.height,
                Text('${mData.date}',
                    style: secondaryTextStyle(color: Colors.white38)),
              ],
            ).expand(flex: 2),
            4.width,
            Image.network(
              mData.image!,
              height: 100,
              fit: BoxFit.cover,
            ).cornerRadiusWithClipRRect(16).expand(flex: 1),
          ],
        ).onTap(
          () {},
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
