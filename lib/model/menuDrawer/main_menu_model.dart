import 'package:flutter/material.dart';

class MainMenuModel {
  String title;
  IconData iconData;
  int position;
  List<String> childMenuList;
  List<IconData> childIconList;

  MainMenuModel({
    this.title,
    this.iconData,
    this.position,
    this.childMenuList,
    this.childIconList,
  });
}
