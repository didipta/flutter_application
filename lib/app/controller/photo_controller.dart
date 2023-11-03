import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Photocontroller extends GetxController
{
  var photolist = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchdata();
  }

  Future fetchdata() async
  {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if(response.statusCode == 200)
    {
      var stringdata = jsonDecode(response.body);
      for(Map item in stringdata)
      {
        photolist.add(item);
      }
      print(photolist);
      return photolist;
    }
  }

}