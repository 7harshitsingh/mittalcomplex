import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';


AppBar generalappBar(BuildContext context, String title,
    {List<Widget>? actions,
    bool showBack = true,
    Color? color,
    Color? iconColor,
    Color? textColor}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: mcGeneralAppBarColor,
    leading: showBack
        ? IconButton(
            onPressed: () {
              finish(context);
            },
            icon: const Icon(Icons.arrow_back, color: mcPrimaryColorDark),
          )
        : null,
    title:
        appBarTitleWidget(context, title, textColor: textColor, color: color),
    actions: actions,
    elevation: 0.5,
  );
}

Widget appBarTitleWidget(context, String title,
    {Color? color, Color? textColor}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 40,
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Text(
          title,
          style: boldTextStyle(color: mcPrimaryColorDark, size: 15),
          maxLines: 1,
        ).expand(),
      ],
    ),
  );
}

Widget headerText({required String title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      100.height,
      Text(title,
          style: const TextStyle(
              fontSize: 40, color: Colors.white, fontFamily: 'Poppins')),
      16.height,
    ],
  );
}

Widget heading({required String title}) {
  return Column(
    children: [
      135.height,
      Text(title,
          style: const TextStyle(
              fontSize: 25, color: Colors.white, fontFamily: 'Poppins')),
      16.height,
    ],
  );
}

Widget titleText({required String title, int? size, int? maxLines}) {
  // ignore: prefer_if_null_operators
  return Text(
    title,
    style: boldTextStyle(size: size ?? 20, color: mcPrimaryColorDark),
    // ignore: prefer_if_null_operators
    maxLines: maxLines != null ? maxLines : 1,
    overflow: TextOverflow.ellipsis,
  );
}

Widget componentText({required String title, int? size, int? maxLines}) {
  // ignore: prefer_if_null_operators
  return Text(
    title,
    style: boldTextStyle(size: size ?? 13, color: mcPrimaryColorDark),
    // ignore: prefer_if_null_operators
    maxLines: maxLines != null ? maxLines : 1,
    overflow: TextOverflow.ellipsis,
  );
}

InputDecoration mcInputDecoration(
    {IconData? prefixIcon,
    String? hint,
    Color? bgColor,
    Color? borderColor,
    EdgeInsets? padding}) {
  return InputDecoration(
    contentPadding:
        padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    counter: const Offstage(),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: borderColor ?? mcPrimaryColor)),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
    ),
    fillColor: bgColor ?? mcPrimaryColor.withOpacity(0.04),
    hintText: hint,
    prefixIcon:
        prefixIcon != null ? Icon(prefixIcon, color: mcPrimaryColor) : null,
    hintStyle: secondaryTextStyle(),
    filled: true,
  );
}

Widget indicatorBox() {
  return Dialog(
    backgroundColor: transparentColor,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CircularProgressIndicator(
            color: white,
          ),
          SizedBox(height: 15),
        ],
      ),
    ),
  );
}

settingsContainer(
    {String? title, IconData? icon, Function? onTap, Color? textColor}) {
  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
    decoration: BoxDecoration(
        color: mcPrimaryColorDark, borderRadius: BorderRadius.circular(16)),
    child: Row(
      children: [
        Icon(icon, color: white),
        16.width,
        Text(title!, style: primaryTextStyle(color: textColor))
      ],
    ),
  ).onTap(onTap);
}

sportsContainer(
    {String? title1,
    Function? onTap1,
    String? img1,
    String? title2,
    Function? onTap2,
    String? img2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        height: 165,
        width: 165,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(img1!),
              fit: BoxFit.cover,
            )),
        child: Text(title1!, style: primaryTextStyle(color: Colors.white)),
      ).onTap(onTap1),
      Container(
        height: 165,
        width: 165,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(img2!),
              fit: BoxFit.cover,
            )),
        child: Text(title2!, style: primaryTextStyle(color: Colors.white)),
      ).onTap(onTap2),
    ],
  );
}

listComp(String? title, String? subtitle, IconData? icon, String? link,
    Color? textColor, String? text) {
  return ListTile(
    enabled: true,
    contentPadding: EdgeInsets.zero,
    leading: Icon(
      icon,
      color: Colors.white38,
      size: 28,
    ),
    title: Text(
      title!,
      style: primaryTextStyle(color: Colors.white, size: 14),
    ),
    subtitle: Text(
      subtitle!,
      style: primaryTextStyle(color: Colors.white38, size: 14),
    ),
    trailing: GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(link!));
      },
      child: Container(
        width: 80,
        height: 35,
        alignment: Alignment.center,
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: BorderRadius.circular(30),
          backgroundColor: textColor!.withOpacity(0.2),
        ),
        child: Text(
          text!,
          style: boldTextStyle(
            size: 12,
            color: textColor,
          ),
        ),
      ),
    ),
  );
}

myslotlist(String? title, String? subtitle, IconData? icon, Color? textColor,
    String? text) {
  return ListTile(
    enabled: true,
    contentPadding: EdgeInsets.zero,
    leading: Icon(
      icon,
      color: Colors.white38,
      size: 28,
    ),
    title: Text(
      title!,
      style: primaryTextStyle(color: Colors.white, size: 14),
    ),
    subtitle: Text(
      subtitle!,
      style: primaryTextStyle(color: Colors.white38, size: 14),
    ),
    trailing: Container(
      width: 80,
      height: 35,
      alignment: Alignment.center,
      decoration: boxDecorationWithRoundedCorners(
        borderRadius: BorderRadius.circular(30),
        backgroundColor: textColor!.withOpacity(0.2),
      ),
      child: Text(
        text!,
        style: boldTextStyle(
          size: 12,
          color: textColor,
        ),
      ),
    ),
  );
}

bookedslotlist(String? title, String? subtitle) {
  return ListTile(
    enabled: true,
    contentPadding: EdgeInsets.zero,
    leading: const FaIcon( FontAwesomeIcons.barcode, size: 28, color: Colors.white38,),
    title: Text(title!, style: primaryTextStyle(color: Colors.white, size: 14),),
    subtitle: Text( subtitle!, style: primaryTextStyle(color: Colors.white38, size: 14),),
    trailing: const FaIcon(FontAwesomeIcons.accessibleIcon, size: 15, color: greenColor,),
  );
}

Widget commonCachedNetworkImage(
  String? url, {
  double? height,
  double? width,
  BoxFit? fit,
  AlignmentGeometry? alignment,
  bool usePlaceholderIfUrlEmpty = true,
  double? radius,
  Color? color,
}) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return const SizedBox();
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
    );
  } else {
    return Image.asset(
      url,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment ?? Alignment.center,
    ).cornerRadiusWithClipRRect(
      radius ?? defaultRadius,
    );
  }
}

Widget placeHolderWidget(
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    double? radius,
    Focus? focus}) {
  return Image.asset('images/ic.jpg',
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          alignment: alignment ?? Alignment.center)
      .cornerRadiusWithClipRRect(radius ?? defaultRadius);
}
