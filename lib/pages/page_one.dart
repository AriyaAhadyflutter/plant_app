import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plant_app/const/constants.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 20),
            child: InkWell(
              onTap: () {},
              child: const Text(
                'رد کردن',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'lalezar',
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        children: [
          PageView(children: [
            Column(
              children: [
                const SizedBox(height: 45),
                const SizedBox(
                  height: 350,
                  child: Image(
                    image: AssetImage('assets/images/plant-one.png'),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  MyConstants.title1,
                  style: TextStyle(
                      fontFamily: 'Yekanplus',
                      color: MyConstants.primarycolor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 40),
                Text(
                  MyConstants.description1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'iranSans',
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
