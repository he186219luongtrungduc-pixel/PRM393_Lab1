import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class ProductWidget extends StatelessWidget {
  final String image;
  final String name;
  final String oldPrice;
  final String salePrice;
  final String discount;

  const ProductWidget({
    super.key,

    required this.image,

    required this.name,

    required this.oldPrice,

    required this.salePrice,

    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              image: image,

              name: name,

              oldPrice: oldPrice,

              salePrice: salePrice,

              discount: discount,
            ),
          ),
        );
      },

      child: Card(
        elevation: 3,

        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),

              child: Row(
                children: [
                  Expanded(
                    flex: 2,

                    child: Image.network(
                      image,

                      height: 100,

                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    flex: 3,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          name,

                          style: const TextStyle(
                            fontSize: 22,

                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Row(
                          children: [
                            Text(
                              oldPrice,

                              style: const TextStyle(
                                fontSize: 18,

                                color: Colors.grey,

                                decoration: TextDecoration.lineThrough,
                              ),
                            ),

                            const SizedBox(width: 15),

                            Text(
                              salePrice,

                              style: const TextStyle(
                                fontSize: 22,

                                fontWeight: FontWeight.bold,

                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: 10,

              right: 10,

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,

                  vertical: 6,
                ),

                decoration: BoxDecoration(
                  color: Colors.red,

                  borderRadius: BorderRadius.circular(8),
                ),

                child: Text(
                  discount,

                  style: const TextStyle(
                    color: Colors.white,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
