import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mittalcomplex/models/slotsmodel.dart';

class SlotsData {
  FirebaseFirestore? _instance;

  List<SlotsModel> banslotlist = [];
  List<SlotsModel> basslotlist = [];
  List<SlotsModel> boxslotlist = [];
  List<SlotsModel> darslotlist = [];
  List<SlotsModel> kabslotlist = [];
  List<SlotsModel> marslotlist = [];
  List<SlotsModel> sqaslotlist = [];
  List<SlotsModel> tabslotlist = [];
  List<SlotsModel> volslotlist = [];
  List<SlotsModel> yogslotlist = [];

  List<SlotsModel> banSlot() {
    return banslotlist;
  }
  List<SlotsModel> basSlot() {
    return basslotlist;
  }
  List<SlotsModel> boxSlot() {
    return boxslotlist;
  }
  List<SlotsModel> darSlot() {
    return darslotlist;
  }
  List<SlotsModel> kabSlot() {
    return kabslotlist;
  }
  List<SlotsModel> marSlot() {
    return marslotlist;
  }
  List<SlotsModel> sqaSlot() {
    return sqaslotlist;
  }
  List<SlotsModel> tabSlot() {
    return tabslotlist;
  }
  List<SlotsModel> volSlot() {
    return volslotlist;
  }
  List<SlotsModel> yogSlot() {
    return yogslotlist;
  }

  Future<void> getSlotsDataCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference slotsData = _instance!.collection('slots');

    DocumentSnapshot snapshot = await slotsData.doc('slotsData').get();
    if (snapshot.exists) {
      var data = snapshot.data() as Map;

      var bandata = data['banSlot'] as List<dynamic>;
      for (var sport in bandata) {
        banslotlist.add(SlotsModel.fromJson(sport));
      }

      var basdata = data['basSlot'] as List<dynamic>;
      for (var sport in basdata) {
        basslotlist.add(SlotsModel.fromJson(sport));
      }

      var boxdata = data['boxSlot'] as List<dynamic>;
      for (var sport in boxdata) {
        boxslotlist.add(SlotsModel.fromJson(sport));
      }

      var dardata = data['darSlot'] as List<dynamic>;
      for (var sport in dardata) {
        darslotlist.add(SlotsModel.fromJson(sport));
      }

      var kabdata = data['kabSlot'] as List<dynamic>;
      for (var sport in kabdata) {
        kabslotlist.add(SlotsModel.fromJson(sport));
      }

      var mardata = data['marSlot'] as List<dynamic>;
      for (var sport in mardata) {
        marslotlist.add(SlotsModel.fromJson(sport));
      }

      var sqadata = data['sqaSlot'] as List<dynamic>;
      for (var sport in sqadata) {
        sqaslotlist.add(SlotsModel.fromJson(sport));
      }

      var tabdata = data['tabSlot'] as List<dynamic>;
      for (var sport in tabdata) {
        tabslotlist.add(SlotsModel.fromJson(sport));
      }

      var voldata = data['volSlot'] as List<dynamic>;
      for (var sport in voldata) {
        volslotlist.add(SlotsModel.fromJson(sport));
      }

      var yogdata = data['yogSlot'] as List<dynamic>;
      for (var sport in yogdata) {
        yogslotlist.add(SlotsModel.fromJson(sport));
      }

    }
  }
}
