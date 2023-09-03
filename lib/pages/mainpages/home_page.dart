import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/pages/mainpages/detailpage.dart';
import 'package:plant_app/widgets/farsiNumbers/farsi_number.dart';
import 'package:plant_app/widgets/plantWidget/new_Product_Widget.dart';

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
            const SizedBox(height: 13),
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            child:
                                Detailpage(plantid: plantList[index].plantId),
                            type: PageTransitionType.fade,
                          ));
                    },
                    child: Container(
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
                                onPressed: () {
                                  setState(() {
                                    bool isFavorited = toggleIsFavorit(
                                        (plantList[index].isFavorated));
                                    plantList[index].isFavorated = isFavorited;
                                  });
                                },
                                icon: Icon(
                                  plantList[index].isFavorated == true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 20,
                                  color: MyConstants.primarycolor,
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
                                '${plantList[index].price.toString().farsiNumbers} ت',
                                style: TextStyle(
                                  fontFamily: 'Lalezar',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: MyConstants.primarycolor,
                                ),
                                textDirection: TextDirection.rtl,
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
                                        fontSize: 18,
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
                physics: const BouncingScrollPhysics(),
                itemCount: plantList.length,
                itemBuilder: (context, index) {
                  return NewProductWidget(
                    plantList: plantList,
                    index: index,
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
