import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mittalcomplex/components/livescore/livecard.dart';
import 'package:mittalcomplex/components/livescore/newscard.dart';
import 'package:mittalcomplex/models/model.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:mittalcomplex/utils/defaultdata.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class LiveScoreFragment extends StatefulWidget {
  const LiveScoreFragment({Key? key}) : super(key: key);

  @override
  State<LiveScoreFragment> createState() => _LiveScoreFragmentState();
}

class _LiveScoreFragmentState extends State<LiveScoreFragment> {

  PageController? pageController;
  int currentPosition = 1;

  @override
  void initState() {
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
    init();
  }

  init() async {
    pageController =
        PageController(initialPage: currentPosition, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Defaultdata service = Provider.of<Defaultdata>(context, listen: false);
    List<NewsModel> mNewslist = service.newsDetails();
    List<LiveScoreCardModel> scorecard = service.livescorecard();


    return SafeArea(
      child: Scaffold(
      backgroundColor: mcPrimaryColorDark,
      body: SingleChildScrollView(
        child: Column(
          children: [
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Poppins',
                    color: Colors.red,
                  ),
                  child: Text('Live Score'),
                ).paddingLeft(16),
                GestureDetector(
                  onTap: () {
                    //const ().launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
                  },
                  child: const Icon(
                    Icons.numbers,
                    size: 28,
                    color: Colors.red,
                  ),
                ).paddingRight(20),
              ],
            ),
            24.height,
            SizedBox(
              height: 200,
              width: context.width(),
              child:
              PageView(
                controller: pageController,
                children: scorecard.map((LiveScoreCardModel item) {
                  return LiveCardComponent(item).paddingOnly(right: 16);
                }).toList(),
                onPageChanged: (index) {
                  setState(() {
                    currentPosition = index;
                  });
                },
              ),
            ),
            8.height,
            DotsIndicator(
              dotsCount: scorecard.length,
              position: currentPosition.toDouble(),
              decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  color: grey,
                  activeColor: Colors.red,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
            ),
            Container(
              decoration: const BoxDecoration(
                color: mcPrimaryColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Poppins',
                          color: Colors.red,
                        ),
                        child: Text('Latest News'),
                      ).paddingLeft(16),
                      8.width,
                      const FaIcon(
                        FontAwesomeIcons.newspaper,
                        color: redColor,
                        size: 18,
                      )
                    ],
                  ),
                  NewsCard(list: mNewslist),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
