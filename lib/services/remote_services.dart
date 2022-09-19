import 'package:http/http.dart' as http;

import '../models/product_poke.dart';
import '../models/stats.dart';

class RemoteServices {
  // instance of http cliend
  static var client = http.Client();

  // fetchProduct method
  static Future<ProductPoke?> fetchProducts() async {
    var response = await client
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  // fetchProduct method stats
  static Future<MyStats?> fetchProducts_stats() async {
    var response =
        await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/ditto'));
    if (response.statusCode == 200) {
      print(response.statusCode);
      var jsonString = response.body;
      print(jsonString);
      print(jsonString.length);
      return productFromJson_stats(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
