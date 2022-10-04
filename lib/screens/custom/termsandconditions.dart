import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/colors.dart';

class TermsandCondition extends StatefulWidget {
  const TermsandCondition({super.key});

  @override
  State<TermsandCondition> createState() => _TermsandConditionState();
}

class _TermsandConditionState extends State<TermsandCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mcPrimaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Terms and Conditions",
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Text(("1. You may not share or make the Application available to third parties (unless to the degree allowed by the Usage Rules, and with Mittal Complex Pvt. Ltd.'s prior written consent), sell, rent, lend, lease or otherwise redistribute the Application."),
              style: secondaryTextStyle(color: Colors.white54, size: 15), maxLines: 10,),
          8.height,
          Text(("2. You may not reverse engineer, translate, disassemble, integrate, decompile, remove, modify, combine, create derivative works or updates of, adapt, or attempt to derive the source code of the Application, or any part thereof (except with Mittal Complex Pvt. Ltd.'s prior written consent)."),
              style: secondaryTextStyle(color: Colors.white54, size: 15), maxLines: 10,),
          8.height,
          Text(("3. You may not copy (excluding when expressly authorised by the Usage Rules) or alter the Application or portions thereof. You may create and store copies only on devices that You own or control for backup keeping under the terms of this licence, the Usage Rules, and any other terms and conditions that apply to the device or software used. You may not remove any intellectual property notices. You acknowledge that no unauthorised third parties may gain access to these copies at any time. If you sell your Devices to a third party, you must remove the Application from the Devices before doing so."),
              style: secondaryTextStyle(color: Colors.white54, size: 15), maxLines: 10,),
          8.height,
          Text(('4. Violations of the obligations mentioned above, as well as the attempt of such infringement, may be subject to prosecution and damages.'),
              style: secondaryTextStyle(color: Colors.white54, size: 15), maxLines: 10,),
          8.height,
          Text(("5. Mittal Complex Pvt. Ltd reserves the right to modify the terms and conditions."),
              style: secondaryTextStyle(color: Colors.white54, size: 15), maxLines: 10,),
          8.height,
          Text(("6. Nothing in this terms and conditions should be interpreted to restrict third-party terms. When using the Application, You must ensure that You comply with applicable third-party terms and conditions."),
              style: secondaryTextStyle(color: Colors.white54, size: 15), maxLines: 10,),
          8.height,
          Text(("7. Mittal Complex Pvt. Ltd attempts to keep the Application updated so that it complies with modified/new versions of the firmware and new hardware. You are not granted rights to claim such an update."),
              style: secondaryTextStyle(color: Colors.white54, size: 15), maxLines: 10,),
          8.height,
          Text(("8. You acknowledge that it is Your responsibility to confirm and determine that the app end-user device on which You intend to use the Application satisfies the technical specifications mentioned above."),
              style: secondaryTextStyle(color: Colors.white54, size: 15), maxLines: 10,),
          8.height,
          Text(('9. Mittal Complex Pvt. Ltd reserves the right to modify the technical specifications as it sees appropriate at any time.'),
              style: secondaryTextStyle(color: Colors.white54, size: 15), maxLines: 10,),
          8.height,
          Text(("10. Your Contributions are not false, inaccurate, or misleading."),
              style: secondaryTextStyle(color: Colors.white54, size: 15), maxLines: 10,),
          8.height,
          Text(("11. Your Contributions do not violate the privacy or publicity rights of any third party."),
              style: secondaryTextStyle(color: Colors.white54, size: 15), maxLines: 10,),
          8.height,
          Text(("12. Your Contributions do not include any offensive comments that are connected to race, national origin, gender, sexual preference, or physical handicap."),
              style: secondaryTextStyle(color: Colors.white54, size: 15), maxLines: 10,),
         ],
        ).paddingOnly(top: 24, right: 24, left: 24, bottom: 24),
      )
    );
  }
}
