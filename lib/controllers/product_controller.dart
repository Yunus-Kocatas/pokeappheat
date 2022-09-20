import 'package:get/state_manager.dart';

import '../models/product_poke.dart';
import '../models/stats.dart';
import '../services/remote_services.dart';

class ProductController extends GetxController {
  increase() {
    RxInt indexnumber = 1.obs;
    update();
  }

  var isLoading = true.obs; //CircularProgressIndicator
  var productList = <Result>[].obs;
  RxList<Result> myResultList = RxList();

  var productList_stat = <FlavorTextEntry>[].obs;
  RxList<FlavorTextEntry> myResultList_stat = RxList();

  var productList_formdescription = <FormDescription>[].obs;
  RxList<FormDescription> myResultList_formdescription = RxList();

  @override
  void onInit() {
    fetchProducts_flavorTextEntries();
    fetchProducts();
    fetchProducts_happinies();
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

  void fetchProducts_flavorTextEntries() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts_stats();

      if (products != null) {
        print('yunus2---------------');
        productList_stat.value = products.flavorTextEntries;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchProducts_happinies() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts_stats();

      if (products != null) {
        print('yunus2---------------');
        productList_formdescription.value = products.formDescriptions;
      }
    } finally {
      isLoading(false);
    }
  }
}
