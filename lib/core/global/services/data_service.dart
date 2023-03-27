  

import 'package:sof/core/global/constants/api_constant.dart'; 
import 'package:dio/dio.dart';
import 'package:sof/data/model/item_model.dart';
import 'package:sof/data/model/user_item_detail_model.dart';
import 'package:sof/data/model/user_model.dart'; 

class DataService {
  final dio = Dio();
 
   Future<List<Items>>  getSOFUserList({String? startPage, String? pageSize}) async{
           dynamic userListData =   await dio.get(
      ApiConstant.baseUrl,
      queryParameters: {'page': startPage, 'pagesize': pageSize,'site':'stackoverflow'},
    );   
     
    UserModel userData =  UserModel.fromJson(userListData.data)  ;
    List<Items> sofUserList = userData.items!;
    return sofUserList;

  }


  Future<UserItemModel> fetchSofUserDetail(
      {String? userId, String? startPage, String? pageSize}) async { 
   dynamic userListData =   await dio.get(
      '${ApiConstant.baseUrl}/$userId/reputation-history',
      queryParameters: {'page': startPage, 'pagesize': pageSize,'site':'stackoverflow'},
    ); 
    return  UserItemModel.fromJson(userListData.data);
  }
}
