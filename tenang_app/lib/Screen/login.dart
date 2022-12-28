import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPage> {
  final listTitle = [
    "Welcome to Alesha",
    "Find The Best Doctors",
    "Get Fitness Tips"
  ];
  final textContent =
      "Reference site about Lorem\nIpsum, giving information origins\nas well as a random";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 74, 128, 255),
            Color.fromARGB(255, 52, 99, 255)
          ])),
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          enableInfiniteScroll: false,
          aspectRatio: 16 / 9,
        ),
        items: listTitle
            .map((e) => Builder(builder: (BuildContext context) {
                  return content(e);
                }))
            .toList(),
      ),
    );
  }

  Widget content(String a) {
    return Container(
      color: Colors.red,
      alignment: Alignment.topCenter,
      // padding: const EdgeInsets.all(50),
      height: 800,
      // width: 400,
      child: Card(
        elevation: 5,
        // semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          // height: 120,
          width: 260,
          padding: EdgeInsets.all(8),
          child: Column(children: [
            Text(
              a,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 22),
            Text(textContent)
          ]),
        ),
      ),
    );
  }
}
