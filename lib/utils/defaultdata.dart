import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mittalcomplex/models/model.dart';
import 'package:mittalcomplex/screens/sportsava/badminton.dart';
import 'package:mittalcomplex/screens/sportsava/basketball.dart';
import 'package:mittalcomplex/screens/sportsava/boxing.dart';
import 'package:mittalcomplex/screens/sportsava/darts.dart';
import 'package:mittalcomplex/screens/sportsava/kabaddi.dart';
import 'package:mittalcomplex/screens/sportsava/martialart.dart';
import 'package:mittalcomplex/screens/sportsava/squash.dart';
import 'package:mittalcomplex/screens/sportsava/tabletennis.dart';
import 'package:mittalcomplex/screens/sportsava/volleyball.dart';
import 'package:mittalcomplex/screens/sportsava/yoga.dart';

//DATA FETCHING FROM FIREBASE DATABASE
class Defaultdata {
  FirebaseFirestore? _instance;

  List<NewsModel> newsDetailsList = [];
  List<HealthTips> healthlist = [];
  List<LiveScoreCardModel> scorelist = [];
  List<UpcomingEvents> eventslist = [];

  List<NewsModel> newsDetails() {
    newsDetailsList.shuffle();
    return newsDetailsList;
  }

  List<HealthTips> healthtips() {
    healthlist.shuffle();
    return healthlist;
  }

  List<LiveScoreCardModel> livescorecard() {
    return scorelist;
  }

  List<UpcomingEvents> upcomingeventslist() {
    eventslist.shuffle();
    return eventslist;
  }

  Future<void> getdefaultdataCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference defaultdata = _instance!.collection('data');

    DocumentSnapshot snapshot = await defaultdata.doc('defaultData').get();
    if (snapshot.exists) {
      var data = snapshot.data() as Map;

      var newsData = data['news'] as List<dynamic>;
      for (var news in newsData) {
        newsDetailsList.add(NewsModel.fromJson(news));
      }

      var scoreData = data['livescore'] as List<dynamic>;
      for (var score in scoreData) {
        scorelist.add(LiveScoreCardModel.fromJson(score));
      }

      var healthtipsdata = data['healthtips'] as List<dynamic>;
      for (var tips in healthtipsdata) {
        healthlist.add(HealthTips.fromJson(tips));
      }

      var eventsdata = data['upcomingevents'] as List<dynamic>;
      for (var event in eventsdata) {
        eventslist.add(UpcomingEvents.fromJson(event));
      }
    }
  }
}

//DATA INTERNALLY STORED WITHIN APP WHICH NEED NOT TO BE REGULARLY CHANGED

List<Model> getsportsList() {
  List<Model> list = [];
  list.add(
    Model(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fbasketball.jpg?alt=media&token=e700a7c2-455c-492f-973b-eedb2c74ca42',
        name: 'Basket Ball',
        ontap: () {
          const BasketBall();
        }),
  );
  list.add(
    Model(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fsquash.jpg?alt=media&token=6e1b3546-4fb1-4495-bc42-d9290384ec95',
        name: 'Squash',
        ontap: () {
          const Squash();
        }),
  );
  list.add(
    Model(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fvolleyball.jpg?alt=media&token=91823142-1fe3-4887-b131-233e3a0da1ab',
        name: 'Volley ball',
        ontap: () {
          const VolleyBall();
        }),
  );
  list.add(
    Model(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fmartialarts.jpg?alt=media&token=4f9ab42f-6c69-497b-b597-2aa90ac6818d',
        name: 'Martial Arts',
        ontap: () {
          const MartialArt();
        }),
  );
  list.add(
    Model(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fdarts.jpg?alt=media&token=17a114ab-c169-40d5-8378-51468f23cfdc',
        name: 'Darts',
        ontap: () {
          const Darts();
        }),
  );
  list.add(
    Model(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fkabaddi.jpg?alt=media&token=dc7a121d-a823-4e09-9a6f-4096cb398bc0',
        name: 'Kabaddi',
        ontap: () {
          const Kabaddi();
        }),
  );
  list.add(
    Model(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fbadminton.jpg?alt=media&token=d6dcd4ef-dbe3-4d92-a594-03a17c4cd168',
        name: 'Badminton',
        ontap: () {
          const Badminton();
        }),
  );
  list.add(
    Model(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fyoga.jpg?alt=media&token=e12ad191-bd2b-4075-b12e-b7544b0ea426',
        name: 'Yoga',
        ontap: () {
          const Yoga();
        }),
  );
  list.add(
    Model(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Ftable%20tennis.jpg?alt=media&token=10842605-f7de-4e46-97dd-dde023932472',
        name: 'Table Tennis',
        ontap: () {
          const TableTennis();
        }),
  );
  list.add(
    Model(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fboxing.jpg?alt=media&token=fbe063b7-f5f8-4ba3-a1d1-0de6edd98e51',
        name: 'Boxing',
        ontap: () {
          const Boxing();
        }),
  );
  list.shuffle();
  return list;
}
