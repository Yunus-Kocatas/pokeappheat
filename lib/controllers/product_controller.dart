import 'package:get/state_manager.dart';

import '../models/product_poke.dart';
import '../models/stats.dart';
import '../services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs; //CircularProgressIndicator
  var productList = <Result>[].obs;

  RxList<Result> myResultList = RxList();

  var productList_stat = <Stat>[].obs;
  RxList<Stat> myResultList_stat = RxList();

  @override
  void onInit() {
    fetchProducts_stats();
    fetchProducts();

    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading;
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        print('yunus1+++++++++++++++++');
        productList.value = products.results;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchProducts_stats() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts_stats();
      if (products != null) {
        print('yunus2---------------');
        productList_stat.value = products.stats;
      }
    } finally {
      isLoading(false);
    }
  }
}
