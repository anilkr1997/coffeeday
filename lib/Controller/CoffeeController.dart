import 'dart:convert';
import 'package:coffeeday/model/HotCoffee.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:coffeeday/model/ColdCoffee.dart';



class CoffeeController extends GetxController {
  var hotCoffees = <Hotcoffee>[].obs;
  var coldCoffees = <Coldcoffee>[].obs;
  var isLoading = true.obs;




    Future<void> fetchColdCoffees() async {
    hotCoffees.clear();
      isLoading(true);
      try {
        final response = await http.get(Uri.parse('https://api.sampleapis.com/coffee/iced'));
        if (response.statusCode == 200) {
          List<dynamic> jsonData = json.decode(response.body);
          hotCoffees.value = jsonData.map((item) =>Hotcoffee.fromJson(item)).toList();
        } else {
          throw Exception('Failed to load cold coffees');
        }
      } catch (e) {
        Get.snackbar('Error', 'Failed to fetch cold coffees: $e');
      } finally {
        isLoading(false);
      }



  }
  Future<void> fetchHotCoffees() async {
    hotCoffees.clear();
      isLoading(true);
      try {
        final response = await http.get(Uri.parse('https://api.sampleapis.com/coffee/hot'));
        if (response.statusCode == 200) {
          List<dynamic> jsonData = json.decode(response.body);
          hotCoffees.value = jsonData.map((item) => Hotcoffee.fromJson(item)).toList();
        } else {
          throw Exception('Failed to load cold coffees');
        }
      } catch (e) {
        Get.snackbar('Error', 'Failed to fetch cold coffees: $e');
      } finally {
        isLoading(false);
      }



  }


}

