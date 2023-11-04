import 'dart:convert';

import 'package:flutter_application_1/app/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Photocontroller extends GetxController {
  var photolist = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchdata();
  }

  Future fetchdata() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      photolist.value = jsonData.map((item) => Product.fromJson(item)).toList();

      return photolist;

      // Here, you can map the JSON data to Temperatures objects
      // photolist.value = jsonData.map((item) => Product.fromJson(item)).toList();
      // print(photolist);
      // return photolist;
    }

    // if (response.statusCode == 200) {
    //   final List<dynamic> jsonData = jsonDecode(response.body);

    //   // Here, you can map the JSON data to Temperatures objects
    //   photolist.value = jsonData.map((item) => Product.fromJson(item)).toList();
    //   print(photolist);
    //   return photolist;
    // }
  }
}
