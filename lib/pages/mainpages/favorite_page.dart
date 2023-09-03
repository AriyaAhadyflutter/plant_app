import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/plantWidget/new_Product_Widget.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritedPlants;
  const FavoritePage({super.key, required this.favoritedPlants});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.favoritedPlants.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/favorited.png'),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      r'ظاهرا هیچی رو دوست نداشتی :/',
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
                height: size.height * 0.8,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.favoritedPlants.length,
                  itemBuilder: (context, index) {
                    return NewProductWidget(
                      plantList: widget.favoritedPlants,
                      index: index,
                    );
                  },
                ),
              ));
  }
}
