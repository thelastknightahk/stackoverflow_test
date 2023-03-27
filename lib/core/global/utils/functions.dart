 

import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sof/data/model/bookmark_model.dart'; 

import '../../database/hive_constant.dart';

class FunctionHelper {
  static String checkColor({String? inputText}) {
    String colorResult = 'Green';
    if (inputText!.toLowerCase().contains('reject') ||
        inputText.toLowerCase().contains('downvote') ||
        inputText.toLowerCase().contains('lost')) {
      colorResult = "Red";
    }
    return colorResult;
  }

  static String parseDateTime(String timeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(1222430705 * 1000);

    String formattedDateTime = DateFormat('dd-MM-yyyy').format(dateTime);

    return formattedDateTime;
  }

  static String getBirthDateInstead(String timeStamp) {
    DateTime givenTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamp) * 1000);

    DateTime currentTimeStamp = DateTime.now();
    Duration difference = currentTimeStamp.difference(givenTimeStamp);

    int yearDifference = difference.inDays ~/ 365;
    return '$yearDifference';
  }

  static bool bookmarkCheck(BookMarkModel bookMarkModel){
   
    var box = Hive.box(dbName);
    List<BookMarkModel> list = [];
     box.toMap().forEach(
      (key, value) {
        list.add(value);
      },
    );
     int index = list.indexOf(bookMarkModel);
     
     
     return index != -1 ? true : false;
   }
}
