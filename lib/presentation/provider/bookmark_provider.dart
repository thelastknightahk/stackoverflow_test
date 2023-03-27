import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sof/data/model/bookmark_model.dart';

import '../../core/database/hive_constant.dart';

class BookmarkProvider extends ChangeNotifier {
  var box = Hive.box(dbName);

 

  void addBookmark(BookMarkModel bookMarkModel) async {
     
    try {
      List<BookMarkModel> bookmarkListData = [];
      bookmarkListData = getBookmarkData();
      var bookmarkModel = BookMarkModel(
          accountId: bookMarkModel.accountId,
          creationDate: bookMarkModel.creationDate,
          displayName: bookMarkModel.displayName,
          location: bookMarkModel.location,
          profileImage: bookMarkModel.profileImage,
          reputation: bookMarkModel.reputation,
          userId: bookMarkModel.userId);

      box.add(bookmarkModel);

      bookmarkListData.add(bookMarkModel);
        
      notifyListeners();
    } catch (e) {}
  }

  Future<List<BookMarkModel>> loadBookmarkList() async{
    List<BookMarkModel> bookmarkListData = [];
    bookmarkListData = getBookmarkData();
      return bookmarkListData;
  }


  void removeBookmark(BookMarkModel bookMarkModel) async {
    List<BookMarkModel> listData = getBookmarkData();
    int index = listData.indexOf(bookMarkModel);
    listData.removeAt(index); 
    box.deleteAt(index);
    notifyListeners(); 
  }

  

  List<BookMarkModel> getBookmarkData() {
     List<BookMarkModel> bookmarkListData = [];
    box.toMap().forEach(
      (key, value) {
        bookmarkListData.add(value);
      },
    );
    return bookmarkListData;
    
  }

   @override
     void dispose() {
       super.dispose();
  
  }
}
