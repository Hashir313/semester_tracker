import 'package:flutter/material.dart';
import 'package:semester_tracker/ui/screen1.dart';
import 'package:semester_tracker/ui/screen2.dart';
import 'package:semester_tracker/ui/screen3.dart';

class AppBanner{
  final int id;
  final String title;
  final String thumbNailUrl;

  AppBanner(this.id, this.title, this.thumbNailUrl);
}

//sample data
List<AppBanner> appBannerList =[
  AppBanner(1, 'Title', 'https://picsum.photos/seed/picsum/200/300'),
  AppBanner(2, 'Title', 'https://picsum.photos/seed/picsum/200/300'),
  AppBanner(3, 'Title', 'https://picsum.photos/seed/picsum/200/300'),

];

List<Widget> screens = [
  const Screen1(),
  const Screen2(),
  const Screen3(),
];