import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';

class CardPage extends StatefulWidget {
   final List<Plant> cardPlants;
  const CardPage({super.key, required this.cardPlants});

  @override
  State<CardPage> createState() => _CardPage();
}

class _CardPage extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
        // Size size = MediaQuery.of(context).size;
    return const Scaffold(
      body: Center(
        child: Text('سبد خرید'),
      ),
    );
  }
}
