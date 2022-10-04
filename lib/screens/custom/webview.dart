import 'package:flutter/material.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../dashboard/dashboard.dart';

class WebViewPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final website;
  // ignore: use_key_in_widget_constructors
  const WebViewPage({required this.website});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    setStatusBarColor(mcPrimaryColorDark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "mittalcomplex",
          style: boldTextStyle(color: Colors.red, fontFamily: "Poppins"),
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
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const DashboardScreen(),
            ),
            (route) => false,
          );
        }),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.website!,
      ),
    );
  }
}
