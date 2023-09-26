import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cubic/model/data_model.dart';
import 'package:http/http.dart';

class DataServices {
  final String baseURL = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    final String endpoint = "$baseURL/getplaces";
    Response res = await get(Uri.parse(endpoint)) as Response;
    try{

      if(res.statusCode == 200){
        List<dynamic> list = json.decode(res.body);
        debugPrint("Successfully fetched!");

        return list.map((e) => DataModel.fromJson(e)).toList();
      }

    } catch (e) {
      print(e);
    }

    return <DataModel>[];
  }
}

