import 'dart:async'; 

import 'package:flutter/material.dart';
import 'package:sof/core/global/services/data_service.dart';

import '../../data/model/user_Item_detail_item_model.dart';

class UserDetailProvider extends ChangeNotifier {
  final DataService _dataService = DataService();
  final _listReputationiController = StreamController<List<Items>>.broadcast();

  final List<Items> _userReputationListData = [];

  Stream<List<Items>> get getUserReputationListData =>
      _listReputationiController.stream;

  void fetchUserReputationList(
      {String? startPage, String? pageSize, String? userId}) async {
    try {
      final userList = await _dataService.fetchSofUserDetail(
          startPage: startPage, pageSize: pageSize, userId: userId);
      _userReputationListData.addAll(userList.items!);
      _listReputationiController.sink.add(_userReputationListData);
        
      notifyListeners(); 
    } catch (e) { 
       clearUserStreamData();
    }
  }

  void clearUserStreamData() async {
    _userReputationListData.clear();
    _listReputationiController.sink.add([]); 
  }

  @override
  void dispose() {
    super.dispose();
    _listReputationiController.close();
  }
}
