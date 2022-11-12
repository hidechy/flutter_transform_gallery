import 'dart:math';

import 'package:flutter/material.dart';

class TransformGalleryScreen extends StatefulWidget {
  const TransformGalleryScreen({Key? key}) : super(key: key);

  @override
  State<TransformGalleryScreen> createState() => _TransformGalleryScreenState();
}

class _TransformGalleryScreenState extends State<TransformGalleryScreen> {
  List<String> images = [
    'assets/images/20221112_102459846.jpg',
    'assets/images/20221112_103025741.jpg',
    'assets/images/20221112_103033365.jpg',
    'assets/images/20221112_103153095.jpg',
    'assets/images/20221112_104724809.jpg',
  ];

  final pageController = PageController();
  double currentPage = 0.0;

  ///
  void listener() {
    setState(() {
      currentPage = pageController.page!;
    });
  }

  ///
  @override
  void initState() {
    pageController.addListener(listener);
    super.initState();
  }

  ///
  @override
  void dispose() {
    pageController.removeListener(listener);
    pageController.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              final percent = (currentPage - index);
              final value = percent.clamp(0.0, 1.0);

              return Padding(
                padding: const EdgeInsets.all(20),
                child: Opacity(
                  opacity: 1 - value,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateX(pi * value),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
