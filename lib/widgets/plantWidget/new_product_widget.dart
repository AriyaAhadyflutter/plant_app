import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/pages/mainpages/detailpage.dart';
import 'package:plant_app/widgets/farsiNumbers/farsi_number.dart';



class NewProductWidget extends StatelessWidget {
  final List<Plant> plantList;
  final int index;
  const NewProductWidget({
    super.key,
    required this.plantList, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
              child: Detailpage(plantid: plantList[index].plantId),
              type: PageTransitionType.fade,
            ));
      },
      child: Container(
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
                SizedBox(
                  height: 20,
                  child: Image.asset('assets/images/PriceUnit-green.png'),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  plantList[index].price.toString().farsiNumbers,
                  style: TextStyle(
                      fontFamily: 'Lalezar',
                      color: MyConstants.primarycolor,
                      fontSize: 21),
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
                    color: MyConstants.primarycolor.withOpacity(0.8),
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
                      const SizedBox(height: 10),
                      Text(
                        plantList[index].category,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'iranSans',
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        plantList[index].plantName,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'yaguts',
                            color: MyConstants.blackcolor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

