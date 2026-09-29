import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {

  final String image;
  final String name;
  final String oldPrice;
  final String salePrice;
  final String discount;


  const ProductDetailScreen({

    super.key,

    required this.image,

    required this.name,

    required this.oldPrice,

    required this.salePrice,

    required this.discount,

  });



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Product Detail",
        ),

        centerTitle: true,

      ),



      body: SingleChildScrollView(

        child: Padding(

          padding: const EdgeInsets.all(20),


          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,


            children: [


              // PRODUCT IMAGE

              Center(

                child: Image.network(

                  image,

                  height: 250,

                  fit: BoxFit.contain,

                ),

              ),



              const SizedBox(height: 20),



              // PRODUCT NAME

              Text(

                name,

                style: const TextStyle(

                  fontSize: 28,

                  fontWeight: FontWeight.bold,

                ),

              ),



              const SizedBox(height: 10),



              // RATING

              Row(

                children: [


                  const Icon(

                    Icons.star,

                    color: Colors.orange,

                    size: 20,

                  ),


                  const Icon(

                    Icons.star,

                    color: Colors.orange,

                    size: 20,

                  ),


                  const Icon(

                    Icons.star,

                    color: Colors.orange,

                    size: 20,

                  ),


                  const Icon(

                    Icons.star,

                    color: Colors.orange,

                    size: 20,

                  ),


                  const Icon(

                    Icons.star_half,

                    color: Colors.orange,

                    size: 20,

                  ),



                  const SizedBox(width: 10),



                  const Text(

                    "(4.8) - 120 reviews",

                    style: TextStyle(

                      color: Colors.grey,

                    ),

                  ),


                ],

              ),



              const SizedBox(height: 15),



              // PRICE + DISCOUNT

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

                      fontSize: 26,

                      color: Colors.red,

                      fontWeight: FontWeight.bold,

                    ),

                  ),



                  const SizedBox(width: 10),



                  Container(

                    padding: const EdgeInsets.symmetric(

                      horizontal: 8,

                      vertical: 4,

                    ),



                    decoration: BoxDecoration(

                      color: Colors.red,

                      borderRadius:

                      BorderRadius.circular(6),

                    ),



                    child: Text(

                      discount,

                      style: const TextStyle(

                        color: Colors.white,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ),


                ],

              ),



              const SizedBox(height: 20),



              // DESCRIPTION

              const Text(

                "Experience the latest technology with the new iPhone 15. Stunning design and powerful performance.",


                style: TextStyle(

                  fontSize: 16,

                  height: 1.5,

                ),

              ),



              const SizedBox(height: 30),



              // ADD TO CART BUTTON

              SizedBox(

                width: double.infinity,


                child: ElevatedButton.icon(


                  onPressed: () {},


                  icon: const Icon(

                    Icons.shopping_cart,

                  ),


                  label: const Text(

                    "Add to Cart",

                  ),


                  style:

                  ElevatedButton.styleFrom(

                    padding:

                    const EdgeInsets.all(15),

                  ),


                ),

              ),


            ],

          ),

        ),

      ),



      // BOTTOM NAVIGATION

      bottomNavigationBar:

      BottomNavigationBar(


        currentIndex: 1,


        selectedItemColor:

        Colors.blue,


        unselectedItemColor:

        Colors.grey,



        items: const [



          BottomNavigationBarItem(

            icon: Icon(

              Icons.home,

            ),

            label: "Home",

          ),




          BottomNavigationBarItem(

            icon: Icon(

              Icons.list_alt,

            ),

            label: "Product Detail",

          ),




          BottomNavigationBarItem(

            icon: Icon(

              Icons.shopping_cart,

            ),

            label: "Cart",

          ),



        ],

      ),

    );

  }

}