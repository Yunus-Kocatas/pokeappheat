import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants.dart';
import '../../../controllers/product_controller.dart';
import 'chat_and_add_to_cart.dart';
import 'list_of_colors.dart';
import 'product_image.dart';

class Body extends StatelessWidget {
  ProductController productController = Get.put(ProductController());

  Body({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //yunus
            Container(
              //
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: '...',
                      child: ProductPoster(
                        size: size,
                        image:
                            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/${Get.arguments}.png",
                      ),
                    ),
                  ),
                  ListOfColors(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 2),
                    child: Text(
                      "Poke ${Get.arguments + 1}",

                      // product.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    productController.productList_stat[Get.arguments].flavorText
                    //'+++++2'
                    ,
                    //'\$${product.price}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kSecondaryColor,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                    child: Text(
                      Get.arguments < productController.productList_stat.length
                          ? productController
                              .productList_formdescription[0].description
                          : '',
                      // product.description,
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
            ChatAndAddToCart(),
          ],
        ),
      ),
    );
  }
}
