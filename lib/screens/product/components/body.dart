import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/hetable_logo.dart';
import '../../../constants.dart';
import '../../../controllers/product_controller.dart';
import '../../../models/product.dart';
import '../../details/details_screen.dart';
import 'category_list.dart';
import 'product_card.dart';

class Body extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          SearchBox(onChanged: (value) {}),
          CategoryList(),
          SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                Obx(() {
                  if (productController.isLoading.value)
                    return Center(child: CircularProgressIndicator());
                  else {
                    return ListView.builder(
                      // here we use our demo procuts list
                      itemCount: products.length,
                      //productController.productList.length,
                      itemBuilder: (context, index) => ProductCard(
                        // change the itme
                        itemIndex: index + 1,
                        product: products[index],
                        press: () {
                          Get.to(
                              () => DetailsScreen(
                                    product: products[3],
                                  ),
                              arguments: index);

                          /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                product: products[3],
                              ),
                            ),
                          );
                           */
                        },
                      ),
                    );
                  }
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
