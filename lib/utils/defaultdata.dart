
import 'package:mittalcomplex/models/model.dart';
import 'package:nb_utils/nb_utils.dart';

List<Model> getsportsList() {
  List<Model> list = [];
  list.add(
    Model(
      img:
          'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fbasketball.jpg?alt=media&token=2b7cf795-6216-42dc-9966-4b3c818f1734',
      name: 'Basket Ball',
    ),
  );
  list.add(
    Model(
      img:
          'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fsquash.jpg?alt=media&token=bcb8b827-ad2e-4393-80a7-56ec93abc84f',
      name: 'Squash',
    ),
  );
  list.add(
    Model(
      img:
          'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fvolleyball.jpg?alt=media&token=91823142-1fe3-4887-b131-233e3a0da1ab',
      name: 'Volley ball',
    ),
  );
  list.add(
    Model(
      img:
          'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fmartialarts.jpg?alt=media&token=4f9ab42f-6c69-497b-b597-2aa90ac6818d',
      name: 'Martial Arts',
    ),
  );
  list.add(
    Model(
      img:
          'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fdarts.jpg?alt=media&token=fdf96fa0-7556-4bf2-a36a-715face3dfa6',
      name: 'Darts',
    ),
  );
  list.add(
    Model(
      img:
          'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fkabaddi.jpg?alt=media&token=dc7a121d-a823-4e09-9a6f-4096cb398bc0',
      name: 'Kabaddi',
    ),
  );
  list.add(
    Model(
      img:
          'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fbadminton.jpg?alt=media&token=d6dcd4ef-dbe3-4d92-a594-03a17c4cd168',
      name: 'Badminton',
    ),
  );
  list.add(
    Model(
      img:
          'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fyoga.jpg?alt=media&token=e12ad191-bd2b-4075-b12e-b7544b0ea426',
      name: 'Yoga',
    ),
  );
  list.add(
    Model(
      img:
          'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Ftable%20tennis.jpg?alt=media&token=10842605-f7de-4e46-97dd-dde023932472',
      name: 'Table Tennis',
    ),
  );
  list.add(
    Model(
      img:
          'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fboxing.jpg?alt=media&token=fbe063b7-f5f8-4ba3-a1d1-0de6edd98e51',
      name: 'Boxing',
    ),
  );
  list.shuffle();
  return list;
}

List<HealthTips> healthtips() {
  List<HealthTips> list = [];
  list.add(
    HealthTips(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Ffitness3.jpg?alt=media&token=a75fa0bb-b3bb-4c6b-9c64-d61b368e53ad',
        title: 'Make exercise a daily habit – 10 tips',
        readmore:
            'https://www.hsph.harvard.edu/nutritionsource/2013/11/04/making-exercise-a-daily-habit-10-tips/'),
  );
  list.add(
    HealthTips(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Ffitness2.jpg?alt=media&token=a349d55e-0695-4320-a43a-17dc15edb293',
        title: '26 Helpful Tips for Fitness and Nutrition',
        readmore:
            'https://www.health.com/weight-loss/30-simple-diet-and-fitness-tips'),
  );
  list.add(
    HealthTips(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Fjournal1.jpg?alt=media&token=70a20f8d-d19a-4fb8-ad18-ed764732d322',
        title: 'Worldwide Survey of Fitness Trends',
        readmore:
            'https://journals.lww.com/acsm-healthfitness/Fulltext/2022/01000/Worldwide_Survey_of_Fitness_Trends_for_2022.6.aspx?WT.mc_id=HPxADx20100319xMP'),
  );
  list.add(
    HealthTips(
        img:
            'https://firebasestorage.googleapis.com/v0/b/mittal-complex.appspot.com/o/0cachedmemory%2Ffitness1.jpg?alt=media&token=b23ff729-00a2-4e72-8081-de28117f5705',
        title: 'Make exercise a daily habit – 10 tips',
        readmore:
            'https://www.hsph.harvard.edu/nutritionsource/2013/11/04/making-exercise-a-daily-habit-10-tips/'),
  );

  list.shuffle();
  return list;
}

List<LiveScoreCardModel> livescorecard() {
  List<LiveScoreCardModel> list = [];
  list.add(LiveScoreCardModel(
      color: redColor,
      team1:
          'https://upload.wikimedia.org/wikipedia/en/thumb/f/fd/Indian_Institute_of_Technology_Delhi_Logo.svg/474px-Indian_Institute_of_Technology_Delhi_Logo.svg.png?20220708161028',
      team2:
          'https://upload.wikimedia.org/wikipedia/en/thumb/1/1c/IIT_Kharagpur_Logo.svg/330px-IIT_Kharagpur_Logo.svg.png',
      score: 'IIT KGP - 96/6',
      venue: 'IITD Cricket Ground'));
  list.add(LiveScoreCardModel(
      color: redColor,
      team1:
          'https://www.iitb.ac.in/sites/www.iitb.ac.in/themes/touchm/logo.png',
      team2:
          'https://upload.wikimedia.org/wikipedia/en/thumb/a/a3/IIT_Kanpur_Logo.svg/300px-IIT_Kanpur_Logo.svg.png',
      score: 'IIT K - 133/9',
      venue: 'IITK Cricket Ground'));
  list.add(LiveScoreCardModel(
      color: redColor,
      team1:
          'https://upload.wikimedia.org/wikipedia/en/6/6f/Indian_Institute_of_Technology_Roorkee_logo.png',
      team2:
          'https://upload.wikimedia.org/wikipedia/en/thumb/6/69/IIT_Madras_Logo.svg/1200px-IIT_Madras_Logo.svg.png',
      score: 'IIT M - 33/2',
      venue: 'IITR Cricket Ground'));

  list.shuffle();
  return list;
}

List<NewsModel> newsDetails() {
  List<NewsModel> newsDetailsList = [];
  newsDetailsList.add(NewsModel(
    title:
        'Pakistan vs Hong Kong, Asia Cup 2022 Highlights: Pakistan crush Hong Kong by 155 runs to enter Super Fours, face India on Sunday',
    date: 'Sep 02, 2022',
    image:
        'https://static.toiimg.com/thumb/imgsize-66656,msid-93953500,width-400,resizemode-4/93953500.jpg',
    details:
        'https://timesofindia.indiatimes.com/sports/cricket/asia-cup/pakistan-vs-hong-kong-t20-live-cricket-score-updates-asia-cup-2022-2-sep/liveblog/93953500.cms',
  ));
  newsDetailsList.add(NewsModel(
    title:
        "Asia Cup 2022: SKY is the limit - Why Suryakumar Yadav is India's best T20I batter currently",
    date: 'Sep 02, 2022',
    image:
        'https://static.toiimg.com/thumb/msid-93950170,imgsize-32940,width-400,resizemode-4/93950170.jpg',
    details:
        'https://timesofindia.indiatimes.com/sports/cricket/asia-cup/asia-cup-2022-sky-is-the-limit-why-suryakumar-yadav-is-indias-best-t20i-batter-currently/articleshow/93949903.cms',
  ));
  newsDetailsList.add(NewsModel(
    title:
        "Ravindra Jadeja out of Asia Cup with a knee injury, Axar Patel replaces him in India squad",
    date: 'Sep 02, 2022',
    image:
        'https://static.toiimg.com/thumb/msid-93951691,imgsize-47184,width-400,resizemode-4/93951691.jpg',
    details:
        'https://timesofindia.indiatimes.com/sports/cricket/asia-cup/ravindra-jadeja-out-of-asia-cup-with-knee-injury-axar-patel-replaces-him/articleshow/93951680.cms',
  ));
  newsDetailsList.add(NewsModel(
    title: "England's Jonny Bairstow ruled out of T20 World Cup through injury",
    date: 'Sep 02, 2022',
    image:
        'https://static.toiimg.com/thumb/msid-93956078,imgsize-24078,width-400,resizemode-4/93956078.jpg',
    details:
        'https://timesofindia.indiatimes.com/sports/cricket/icc-mens-t20-world-cup/englands-jonny-bairstow-ruled-out-of-t20-world-cup-through-injury/articleshow/93956084.cms',
  ));
  newsDetailsList.add(NewsModel(
    title: 'Cristiano Ronaldo: What next for the Manchester United star?',
    date: 'Sep 03 2022',
    image:
        'https://ichef.bbci.co.uk/onesport/cps/976/cpsprodpb/C281/production/_120339794_gettyimages-1337090251.jpg',
    details: 'https://www.bbc.com/sport/football/62767340',
  ));
  newsDetailsList.add(NewsModel(
    title:
        'Chelsea transfer news: Striker Michy Batshuayi heading to Fenerbahce, claims Turkish club',
    date: 'Sep 03 2022',
    image:
        'https://ichef.bbci.co.uk/onesport/cps/976/cpsprodpb/17486/production/_126566359_gettyimages-1409992274.jpg',
    details: 'https://www.bbc.com/sport/football/62764319',
  ));
  newsDetailsList.add(NewsModel(
    title:
        'Uefa: Paris St-Germain one of eight clubs fined for breaching Financial Fair Play rules',
    date: 'Sep 03 2022',
    image:
        'https://ichef.bbci.co.uk/onesport/cps/976/cpsprodpb/17314/production/_126569949_bb1aec5220533b2c5d26c4470bc87430f35ef426.jpg',
    details: 'https://www.bbc.com/sport/football/62771118',
  ));
  newsDetailsList.add(NewsModel(
    title: 'Celtic v Rangers: Why Old Firm derbies are more crucial than ever',
    date: 'Sep 03 2022',
    image:
        'https://ichef.bbci.co.uk/onesport/cps/976/cpsprodpb/712F/production/_126557982_20445778.jpg',
    details: 'https://www.bbc.com/sport/football/62728320',
  ));
  newsDetailsList.shuffle();
  return newsDetailsList;
}
