import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/farsiNumbers/farsi_number.dart';

class Detailpage extends StatefulWidget {
  final int plantid;
  const Detailpage({
    super.key,
    required this.plantid,
  });

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantlist = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          //appbar
          Positioned(
            left: 20,
            right: 20,
            top: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //close
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: MyConstants.primarycolor.withOpacity(0.2),
                    ),
                    child: Icon(
                      Icons.close,
                      color: MyConstants.primarycolor,
                    ),
                  ),
                ),
                //favorite
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: MyConstants.primarycolor.withOpacity(0.2),
                  ),
                  // color: MyConstants.primarycolor,
                  child: Icon(plantlist[widget.plantid].isFavorated == true
                      ? Icons.favorite
                      : Icons.favorite_border),
                ),
              ],
            ),
          ),
          //texts
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  //image
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(plantlist[widget.plantid].imageURL),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PlantFeature(
                            title: 'اندازه گیاه',
                            plantFeature: plantlist[widget.plantid].size,
                          ),
                          PlantFeature(
                            title: 'رطوبت هوا',
                            plantFeature: plantlist[widget.plantid]
                                .humidity
                                .toString()
                                .farsiNumbers,
                          ),
                          PlantFeature(
                            title: 'دمای‌نگهداری',
                            plantFeature: plantlist[widget.plantid]
                                .temperature
                                .toString()
                                .farsiNumbers,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: MyConstants.primarycolor.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star),
                          Text('3.3'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('سانسویریا'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('44'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String title;
  final String plantFeature;
  const PlantFeature({
    super.key,
    required this.title,
    required this.plantFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            color: MyConstants.blackcolor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lalezar',
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: MyConstants.primarycolor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lalezar',
          ),
        ),
      ],
    );
  }
}
