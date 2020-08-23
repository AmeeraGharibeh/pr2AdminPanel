import 'package:flutter/material.dart';

class Lessons {
  final String lessonID;
  final String lessonName;
  final Icon lessonIcon;
  final String lessonTitle;
  final String Content;
  final String lessonType;
  final int num;

  Lessons({
    this.lessonID,
     this.lessonName,
     this.lessonIcon,
     this.lessonTitle,
     this.Content,
     this.lessonType,
    this.num
  });

  Map <String, dynamic> toMap (){
    return {
      'lessonName': lessonName,
      'lessonIcon': lessonIcon,
      'lessonTitle': lessonTitle,
      'content' : Content,
      'lessonType' : lessonType
    };
  }

  static Lessons fromMap (Map<String, dynamic> map){
    if (map == null) return null;
    return Lessons (
      lessonName: map['lessonName'],
      lessonIcon: map['lessonIcon'],
      lessonTitle: map['lessonTitle'],
      Content: map['Content'],
      lessonType: map['lessonType'],


    );

  }
}
