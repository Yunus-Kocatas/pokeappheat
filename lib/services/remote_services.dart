import 'package:http/http.dart' as http;

import '../models/product_poke.dart';
import '../models/stats.dart';

class RemoteServices {
  // instance of http cliend
  static var client1 = http.Client();
  static var client2 = http.Client();

  // fetchProduct method
  static Future<ProductPoke?> fetchProducts() async {
    var response = await client1
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

  static Future<Mystat?> fetchProducts_stats() async {
    var response = await client2
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/aegislash'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return mystatFromJson_stats(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  // fetchProduct method stats

}
