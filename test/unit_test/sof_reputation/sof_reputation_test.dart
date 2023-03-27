
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sof/core/global/constants/api_constant.dart';

void main() {
   final dio = Dio();
  test('fetchData returns data if successful', () async {
    

     final userList = await dio.get(
      '${ApiConstant.baseUrl}/11683/reputation-history',
      queryParameters: {'page': '1', 'pagesize': '100','site':'stackoverflow'},
    ); 
      
    expect(userList.statusCode, 200);
    
  });

  test('fetchData returns error if unsuccessful', () async {
    final response =    await dio.get(
      ApiConstant.baseUrl,
      queryParameters: {'page': '1', 'pagesize': '100','site':'stackoverflow'},
    );   

    expect(response.statusCode, 404);
  });
}