import 'package:flutter/material.dart';

enum TabItem {userList , bookmark  }

class TabItemData{
  const  TabItemData({required this.title,required this.icon});
  final String title;
  final IconData icon;

  static const Map<TabItem , TabItemData> allTabs ={
    TabItem.userList : TabItemData(title: 'Users', icon: Icons.person),
    TabItem.bookmark : TabItemData(title: 'Bookmark', icon: Icons.favorite_rounded),
  };

}