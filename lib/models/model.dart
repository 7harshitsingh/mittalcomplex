class Model {
  String? img;
  String? name;
  Function()? ontap;

  Model({
    this.img,
    this.name,
    this.ontap,
  });
}

class HealthTips {
  String? img;
  String? title;
  String? readmore;

  HealthTips({
    this.img,
    this.title,
    this.readmore,
  });

  factory HealthTips.fromJson(Map<String, dynamic> json) {
    return HealthTips(
      title: json['title'],
      readmore: json['readmore'],
      img: json['img'],
    );
  }
}

class LiveScoreCardModel {
  String? team1;
  String? team2;
  String? score;
  String? venue;

  LiveScoreCardModel({this.team1, this.team2, this.score, this.venue});

  factory LiveScoreCardModel.fromJson(Map<String, dynamic> json) {
    return LiveScoreCardModel(
      team1: json['team1'],
      team2: json['team2'],
      score: json['score'],
      venue: json['venue'],
    );
  }
}

class NewsModel {
  String? title;
  String? date;
  String? image;
  String? details;

  NewsModel({
    this.title,
    this.date,
    this.image,
    this.details,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      date: json['date'],
      details: json['details'],
      image: json['img'],
    );
  }
}

class UpcomingEvents {
  String? title;
  String? venuetime;
  String? link;
  String? buttontext;

  UpcomingEvents({this.title, this.venuetime, this.link, this.buttontext});

  factory UpcomingEvents.fromJson(Map<String, dynamic> json) {
    return UpcomingEvents(
      title: json['title'],
      venuetime: json['venuetime'],
      link: json['link'],
      buttontext: json['buttontext'],
    );
  }
}

class PushNotification {
  PushNotification({
    this.title,
    this.body,
  });
  String? title;
  String? body;
}
