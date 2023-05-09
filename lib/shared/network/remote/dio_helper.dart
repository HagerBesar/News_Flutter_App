//  (GET)
// base url: https://newsapi.org/
//method (URL): v2/top-headlines?
//query : country=us&category=business&apiKey=3d69cb865fd642bcbdca2c19a2d7a605

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
 static late Dio dio;
 static init(){
   dio=Dio(
     BaseOptions(
       baseUrl: 'https://newsapi.org/',
       receiveDataWhenStatusError: true
     )
   );
 }

 static Future<Response> getData({
   required String path,
   required Map<String,dynamic> query,}
   ) async {
   return await dio.get(path , queryParameters: query);
 }

}