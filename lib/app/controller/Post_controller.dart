import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Postcontroller extends GetxController {
  var postdata = [].obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future fetchData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      var stringData = jsonDecode(response.body);
      for (Map item in stringData) {
        postdata.add(item);
      }

      return postdata;
    }
  }

  Future getpostdata(id) async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));
    if (response.statusCode == 200) {
      var stringData = jsonDecode(response.body);
      print(stringData);
      return stringData;
    }
  }
}
