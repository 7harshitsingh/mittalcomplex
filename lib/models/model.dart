import 'package:flutter/material.dart';

class Model {
  String? img;
  String? name;
  
  Model({
    this.img,
    this.name,
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
}

class LiveScoreCardModel {
  String? team1;
  String? team2;
  String? score;
  String? venue;
  Color? color;

  LiveScoreCardModel(
      {this.team1, this.team2, this.score, this.venue, this.color});
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
}
