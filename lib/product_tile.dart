import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../models/product_poke.dart';

class ProductTile extends StatelessWidget {
  final Result product;
  final int id;
  final colorIndex;
  final int ordernumber;

  ProductTile(this.product, this.id, this.colorIndex, this.ordernumber);

  @override
  Widget build(BuildContext context) {
    // Random value
    Random random = Random();
    int randomColor = random.nextInt(4) + 1;
    return Hero(
      tag: 'PokeApi',
      child: GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        height: 120,
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          // random color desing
                          color: Color.fromARGB(255, random.nextInt(255),
                              random.nextInt(255), random.nextInt(255)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        // Image from Api link
                        child: Obx(
                          () => Image.network(
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/$id.png',
                            fit: BoxFit.fitHeight,
                          ),
                        )),
                    Positioned(
                      right: 0,
                      child: Obx(() => CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: product.isFavorite.value
                                  ? Icon(Icons.favorite_rounded)
                                  : Icon(Icons.favorite_border),
                              onPressed: () {
                                product.isFavorite.toggle();
                              },
                            ),
                          )),
                    )
                  ],
                ),
                SizedBox(height: 8),
                // Name of item
                Text(
                  (product.name).toUpperCase(),
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w800,
                      fontSize: 17),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                if (product.name != null)
                  Container(
                    decoration: BoxDecoration(
                      color: randomColor <= 2 ? Colors.red : Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Ranking
                        Text(
                          'Ranking',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 8),
                // PokeApi order number
                Center(
                  child: Text('PokeApi ${ordernumber}',
                      style: TextStyle(fontSize: 15, fontFamily: 'avenir')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
