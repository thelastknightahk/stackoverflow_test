import 'dart:async'; 

import 'package:flutter/material.dart';
import 'package:sof/core/global/services/data_service.dart';
import 'package:sof/data/model/item_model.dart'; 

class UsersProvider extends ChangeNotifier {
  final DataService _dataService = DataService();
  final _listController = StreamController<List<Items>>.broadcast();
  StreamController<bool> userLoadStreamContoller =  StreamController<bool>();
  
  List<Items> list = [];
   

  Stream<List<Items>> get getUserListData => _listController.stream;
  Stream<bool> get getUserNextLoad => userLoadStreamContoller.stream;

  void fetchUserList({String? startPage, String? pageSize}) async {
     
    var sofUserData = await
        _dataService.getSOFUserList(startPage: startPage, pageSize: pageSize);
    
    list.addAll(sofUserData);
    _listController.add(list); 
      userLoadStreamContoller.add(false); 
    notifyListeners();
  }

  void setUserNextLoading(bool userNextLoad) async{

    userLoadStreamContoller.add(userNextLoad);
    notifyListeners();
  }

   @override
     void dispose() {
       super.dispose();
    _listController.close();
  }
}
