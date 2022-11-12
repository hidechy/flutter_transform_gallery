import 'dart:math';

import 'package:flutter/material.dart';

class TransformPhotoScreen extends StatefulWidget {
  const TransformPhotoScreen({Key? key}) : super(key: key);

  @override
  State<TransformPhotoScreen> createState() => _TransformPhotoScreenState();
}

class _TransformPhotoScreenState extends State<TransformPhotoScreen> {
  double value = 0.5;

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 70),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateY(pi * value),
              child: Image.asset(
                'assets/images/20221112_102459846.jpg',
                height: 400,
              ),
            ),
            const SizedBox(height: 40),
            Slider(
              value: value,
              onChanged: (val) {
                setState(() {
                  value = val;
                });
              },
            ),
            const SizedBox(height: 40),
            Text(value.toStringAsFixed(1)),
          ],
        ),
      ),
    );
  }
}
