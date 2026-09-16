import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          // RichText
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Demo color ",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TextSpan(
                  text: "World!",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Hiển thị ảnh từ Internet
          Image.network(
            "https://static.vecteezy.com/system/resources/previews/057/643/481/non_2x/mount-fuji-japan-cherry-blossoms-japan-japan-japan-free-photo.jpg",

            width: 250,

            height: 250,
          ),
        ],
      ),
    );
  }
}
