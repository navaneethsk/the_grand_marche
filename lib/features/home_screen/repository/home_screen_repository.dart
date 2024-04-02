import 'dart:convert';
import 'package:the_grand_marche/model/restaurant_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenRepository {
  Future<Restaurants> fetchRestaurants() async {
    var datas;

    final response = await http.get((Uri.parse(
        "https://firstflight-web.ipixsolutions.net/api/getRestaurants")));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      datas = Restaurants.fromJson(data);
      // _resto = Restaurants.fromJson(data);
    } else {
      "Failed to load data";
    }
    return datas;
  }
}
