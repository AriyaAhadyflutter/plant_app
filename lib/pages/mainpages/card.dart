import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/farsiNumbers/farsi_number.dart';
import 'package:plant_app/widgets/plantWidget/new_Product_Widget.dart';

class CardPage extends StatefulWidget {
  final List<Plant> cardPlants;

  const CardPage({
    super.key,
    required this.cardPlants,
  });

  @override
  State<CardPage> createState() => _CardPage();
}

class _CardPage extends State<CardPage> {
  List<Plant> plantList = Plant.plantList;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.cardPlants.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/add-cart.png'),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'سبد خرید خالیه',
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'yagut',
                        fontWeight: FontWeight.w500,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 30,
                ),
                // height: size.height * 0.8,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.cardPlants.length,
                        itemBuilder: (context, index) {
                          return NewProductWidget(
                            plantList: widget.cardPlants,
                            index: index,
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  child: Image.asset(
                                      'assets/images/PriceUnit-green.png'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '23'.farsiNumbers,
                                  style: TextStyle(
                                    fontFamily: 'Lalezar',
                                    color: MyConstants.primarycolor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'جمع کل',
                              style: TextStyle(
                                fontFamily: 'Lalezar',
                                fontSize: 25,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ));
  }
}