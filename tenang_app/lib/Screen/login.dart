import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tenang_app/Screen/loginForm.dart';
import 'package:tenang_app/component/button.dart';

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

  final listImages = ["img/slider1.png", "img/slider2.png", "img/slider3.png"];

  final textContent = """Reference site about Lorem
Ipsum, giving information origins
as well as a random""";

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 74, 128, 255),
            Color.fromARGB(255, 52, 99, 255)
          ])),
      child: Stack(children: [carousel(context), index()]),
    );
  }

  Widget index() {
    return Container(
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: listTitle.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Color(0xF1F2F6))
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget carousel(BuildContext ctx) {
    return CarouselSlider(
      options: CarouselOptions(
          viewportFraction: 1,
          enableInfiniteScroll: false,
          height: MediaQuery.of(ctx).size.height,
          // aspectRatio: 9 / 16,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
      items: listTitle
          .map((e) => Builder(builder: (BuildContext context) {
                return content(e, context);
              }))
          .toList(),
    );
  }

  Widget content(String a, BuildContext ctx) {
    late int idx;
    if (a.startsWith("W", 0)) {
      idx = 0;
    } else if (a.startsWith("F", 0)) {
      idx = 1;
    } else {
      idx = 2;
    }

    return Container(
      decoration: BoxDecoration(
          // color: Colors.red,
          image: DecorationImage(
              image: AssetImage(listImages[idx]),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.contain,
              scale: 0.5)),
      alignment: Alignment.topCenter,
      height: MediaQuery.of(ctx).size.height,
      width: MediaQuery.of(ctx).size.width,
      child: textCardDisplay(a, idx, ctx),
    );
  }

  Widget textCardDisplay(String a, int idx, BuildContext ctx) {
    return Container(
      // height: 300,
      height: MediaQuery.of(context).size.height / 2,
      child: Card(
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        child: Container(
          width: MediaQuery.of(ctx).size.width,
          padding: const EdgeInsets.all(35),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              a,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0x4E4B66FF).withOpacity(1),
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 22),
            Text(textContent),
            SizedBox(
              height: idx == 2 ? 57 : 0,
            ),
            idx == 2
                ? MyButton(
                    onPressed: () => Navigator.of(ctx).push(
                        MaterialPageRoute(builder: ((context) => LoginForm()))),
                    text: "Continue")
                : const SizedBox(),
          ]),
        ),
      ),
    );
  }
}
