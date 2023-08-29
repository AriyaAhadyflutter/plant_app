import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: MyConstants.primarycolor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget>? buildIndicator() {
    List<Widget> indicator = [];

    // ignore: dead_code
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicator.add(_indicator(true));
      } else {
        indicator.add(_indicator(false));
      }
    }
    return indicator;
  }

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
        children: [
          PageView(
              onPageChanged: (int value) {
                setState(() {
                  currentIndex = value;
                });
              },
              controller: _pageController,
              children: [
                TreePages(
                  image: 'assets/images/plant-one.png',
                  title: MyConstants.title1,
                  description: MyConstants.description1,
                ),
                TreePages(
                  image: 'assets/images/plant-two.png',
                  title: MyConstants.title2,
                  description: MyConstants.description2,
                ),
                TreePages(
                  image: 'assets/images/plant-three.png',
                  title: MyConstants.title3,
                  description: MyConstants.description3,
                ),
              ]),
          Positioned(
            left: 35,
            bottom: 70,
            child: Row(
              children: buildIndicator()!,
            ),
          ),
          Positioned(
            bottom: 50,
            right: 30,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyConstants.primarycolor,
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex < 2) {
                      currentIndex++;
                      if (currentIndex < 3) {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linearToEaseOut);
                      }
                    } else {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                    }
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TreePages extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const TreePages({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 80,
        left: 40,
        right: 40,
      ),
      child: Column(
        children: [
          const SizedBox(height: 45),
          SizedBox(
            height: 350,
            child: Image(
              image: AssetImage(image),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Yekanplus',
                color: MyConstants.primarycolor,
                fontSize: 30,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 40),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'iranSans',
              fontSize: 22,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(color: Colors.amber,);
  }
}