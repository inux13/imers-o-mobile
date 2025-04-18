import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/model/restaurants.dart';

class RestaurantsData extends ChangeNotifier {
  List<Restaurants> listRestaurant = [];

  Future<void> getRestaurants() async {
    String jsonString = await rootBundle.loadString(
      'assets/restaurants/data.json',
    );
    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> restaurantsData = data['restaurants'];

    for (var restaurantData in restaurantsData) {
      Restaurants restaurant = Restaurants.fromMap(restaurantData);
      listRestaurant.add(restaurant);
    }
  }
}
