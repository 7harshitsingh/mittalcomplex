// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mittalcomplex/models/slotsmodel.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/colors.dart';
import '../../utils/widgets.dart';

class ViewSlot extends StatefulWidget {
  final nav;
  final slot;
  // ignore: use_key_in_widget_constructors
  const ViewSlot({required this.nav, required this.slot});

  @override
  State<ViewSlot> createState() => _ViewSlotState();
}

class _ViewSlotState extends State<ViewSlot> {
  final kerberosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<SlotsModel> allslotsinfo = widget.nav;
    return Scaffold(
        backgroundColor: mcPrimaryColorDark,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "View Slots",
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
        body: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            margin:
                const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16),
            decoration: boxDecorationRoundedWithShadow(16,
                backgroundColor: mcPrimaryColorDark),
            child: ListView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: allslotsinfo.length,
                itemBuilder: (BuildContext context, int index) {
                  SlotsModel allslotsinfolist = allslotsinfo[index];
                  return allslotsinfolist.booked == false
                      ? viewslotlist(
                          allslotsinfolist.time, allslotsinfolist.bookedby,
                          (() {
                          _showcontent(index);
                        }))
                      : const SizedBox.shrink();
                })));
  }

  void _showcontent(int ind) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm!...',
            style: primaryTextStyle(
                color: redColor, size: 20, fontFamily: 'Poppins'),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                AppTextField(
                  controller: kerberosController,
                  textFieldType: TextFieldType.USERNAME,
                  cursorColor: mcPrimaryColor,
                  textStyle: boldTextStyle(color: Colors.black),
                  suffixIconColor: mcPrimaryColor,
                  decoration: const InputDecoration(
                    hintText: 'Enter your Kerberos',
                    hintStyle: TextStyle(color: Colors.black26, fontSize: 13),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: const Text('Book'),
              onPressed: () {
                book(id: kerberosController.text, i: ind);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future book({required String id, required int i}) async {
    String sportslot = widget.slot;
    final bookingStatus =
        FirebaseFirestore.instance.collection('slots').doc('slotsData');
    await bookingStatus.set({
      sportslot : { i : [{
        "booked" : true,
        "bookedby" : id,
        "time" : "7:00 PM - 7:40PM",
      }]}
    });
  }
}
