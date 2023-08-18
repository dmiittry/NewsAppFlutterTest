import 'package:flutter/material.dart';

class Post {
  int id;
  String title;
  String body;
  Image? img;

  Post({required this.id, required this.title, required this.body, this.img});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        img: json['url']);
  }
}
