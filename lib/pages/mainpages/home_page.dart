import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  bool toggleIsFavorit(bool isFavorite) {
    return !isFavorite;
  }

  final List<String> plantType = [
    '| پیشنهادی |',
    '| آپارتمانی |',
    '| محل کار |',
    '|گل باغچه‌ای|',
    '| گل سمی |',
  ];

  final List<Plant> plantList = Plant.plantList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            //serch box
            Padding(
              padding: const EdgeInsets.only(top: 21.69),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: MyConstants.primarycolor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mic,
                      color: MyConstants.blackcolor.withOpacity(0.6),
                    ),
                    const Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'iranSans',
                            fontSize: 14,
                          ),
                          showCursor: false,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 5),
                            hintText: 'جستجو...',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: MyConstants.blackcolor.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),
            //category

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              height: 70,
              width: size.width,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: plantType.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        plantType[index],
                        style: TextStyle(
                          fontFamily: 'iranSans',
                          fontSize: 16,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? MyConstants.primarycolor
                              : MyConstants.blackcolor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // product list one

            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: plantList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color: MyConstants.primarycolor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 20,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                plantList[index].isFavorated == true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          right: 50,
                          top: 50,
                          bottom: 50,
                          child: Image.asset(plantList[index].imageURL),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              r'$' + plantList[index].price.toString(),
                              style: TextStyle(
                                color: MyConstants.primarycolor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 15,
                            right: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  plantList[index].category,
                                  style: const TextStyle(
                                      fontFamily: ('nazanin'),
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  plantList[index].plantName,
                                  style: const TextStyle(
                                      fontFamily: ('Yekanplus'),
                                      color: Colors.white70,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
            //product Text

            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(
                right: 18,
                bottom: 15,
                top: 20,
              ),
              child: const Text(
                'گیاهان جدید',
                style: TextStyle(
                  fontFamily: 'Lalezar',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //product list two

            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: plantList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: MyConstants.primarycolor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 80,
                    width: size.width,
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/PriceUnit-green.png'),
                            Text(
                              plantList[index].price.toString(),
                            ),
                          ],
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color:
                                    MyConstants.primarycolor.withOpacity(0.8),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 0,
                              left: 0,
                              child: SizedBox(
                                height: 80,
                                child: Image.asset(plantList[index].imageURL),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 80,
                              child: Column(
                                children: [
                                  Text(
                                    plantList[index].category,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'iranSans',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    plantList[index].plantName,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'nazanin',
                                      color: MyConstants.blackcolor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
