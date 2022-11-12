import 'package:flutter/material.dart';

import 'transform_photo_screen.dart';
import 'transform_gallery_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 70),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TransformPhotoScreen(),
                ),
              );
            },
            child: const Text('transform_photo'),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TransformGalleryScreen(),
                ),
              );
            },
            child: const Text('transform_gallery'),
          ),

          //
        ],
      ),
    );
  }
}
