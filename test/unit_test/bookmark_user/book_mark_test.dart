import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sof/core/database/hive_constant.dart';
import 'package:sof/data/model/bookmark_model.dart';

void main() {
  var box = Hive.box(dbName);
  test('Save Data Successful', () async {
    List<BookMarkModel> bookmarkListData = [];
    box.toMap().forEach(
      (key, value) {
        bookmarkListData.add(value);
      },
    );

    var bookmarkModel = BookMarkModel(
        accountId: 1,
        creationDate: 12333,
        displayName: 'Aung',
        location: 'location',
        profileImage: 'image',
        reputation: 12,
        userId: 123);

    box.add(bookmarkModel);

    bookmarkListData.add(bookmarkModel);
  });

  test('Remove Data Successful', () async {
    List<BookMarkModel> bookmarkListData = [];
    box.toMap().forEach(
      (key, value) {
        bookmarkListData.add(value);
      },
    );
    var bookmarkModel = BookMarkModel(
        accountId: 1,
        creationDate: 12333,
        displayName: 'Aung',
        location: 'location',
        profileImage: 'image',
        reputation: 12,
        userId: 123);
    int index = bookmarkListData.indexOf(bookmarkModel);
    bookmarkListData.removeAt(index);
    box.deleteAt(index);
  });
}
