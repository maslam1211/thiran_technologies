import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:thiran_technologies/model/data_model.dart';
import 'package:thiran_technologies/model/items_model.dart';

class DataProvider extends ChangeNotifier {
  var dio = Dio();
  List<Item> dataModel = [];

  Future<void> getData() async {
    dataModel = [];
    String url =
        'https://api.github.com/search/repositories?q=created:%3E2022-04-29&sort=stars&order=desc';
    try {
      var response = await dio.get(url);
      print('response.data');
      print(response.data);
      if (response.statusCode == 200) {
        final data = response.data;

        final List<dynamic> dataList = data['items'];
        List<Item> dataModelList = [];

        for (var item in dataList) {
          // print("item $item");
          // final dataModel = responseDataModelFromJson(jsonEncode(item));
          dataModelList.add(Item.fromJson(item));
          print(dataModelList);
        }

        dataModel = dataModelList;

        print(dataModelList);
  
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
    notifyListeners();
  }
}
