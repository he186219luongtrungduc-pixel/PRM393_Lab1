import 'package:flutter/material.dart';

import 'product_widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  final List<Map<String, String>> products = const [
    {
      "image":
          "https://cdn2.cellphones.com.vn/x/media/catalog/product/i/p/iphone-15-plus_1__1.png?_gl=1*n1yf8y*_gcl_au*MTc4ODY5NjY5Ni4xNzkwNTcwOTMw*_ga*MTk0NDA0NjE2Ni4xNzczMTk3MzIx*_ga_QLK8WFHNK9*czE3OTA1NzA5MzAkbzIkZzEkdDE3OTA1NzA5NTQkajM2JGwwJGgyNzQzOTQyMjE.",

      "name": "iPhone 15",

      "oldPrice": "\$1099",

      "salePrice": "\$999",

      "discount": "-5%",
    },

    {
      "image": "https://cdn2.cellphones.com.vn/x/media/catalog/product/g/a/galaxy-s24-plus-tim.png?_gl=1*8robzt*_gcl_au*MTc4ODY5NjY5Ni4xNzkwNTcwOTMw*_ga*MTk0NDA0NjE2Ni4xNzczMTk3MzIx*_ga_QLK8WFHNK9*czE3OTA1NzA5MzAkbzIkZzEkdDE3OTA1NzEwMjAkajQ5JGwwJGgyNzQzOTQyMjE.",

      "name": "Samsung S24",

      "oldPrice": "\$999",

      "salePrice": "\$899",

      "discount": "-10%",
    },

    {
      "image": "https://cdn2.cellphones.com.vn/x/media/catalog/product/0/1/01_6_4_1_3.png?_gl=1*1jfs2q5*_gcl_au*MTc4ODY5NjY5Ni4xNzkwNTcwOTMw*_ga*MTk0NDA0NjE2Ni4xNzczMTk3MzIx*_ga_QLK8WFHNK9*czE3OTA1NzA5MzAkbzIkZzEkdDE3OTA1NzEwODUkajQ5JGwwJGgyNzQzOTQyMjE.",

      "name": "MacBook Air",

      "oldPrice": "\$1299",

      "salePrice": "\$1200",

      "discount": "-7%",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,

      itemBuilder: (context, index) {
        final product = products[index];

        return ProductWidget(
          image: product["image"]!,

          name: product["name"]!,

          oldPrice: product["oldPrice"]!,

          salePrice: product["salePrice"]!,

          discount: product["discount"]!,
        );
      },
    );
  }
}
