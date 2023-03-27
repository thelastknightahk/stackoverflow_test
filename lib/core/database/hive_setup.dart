import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:sof/data/model/bookmark_model.dart';
class HiveSetup {
  //  HiveSetup._();


  //  static Future get initHive => _initHive();
  // static Future _initHive() async {
  //   final appDocumentDir =
  //       await path_provider.getApplicationDocumentsDirectory();

  //   Hive.init(appDocumentDir.path);
  // }

  static Future<void> addUser(BookMarkModel bookMarkModel) async{
    
  }
  static Future<void> removeUser() async{}
}