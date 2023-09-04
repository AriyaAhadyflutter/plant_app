


import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';

class ProfileOpsions extends StatelessWidget {
  final IconData myicon;
  final String txt;
  const ProfileOpsions({Key? key, required this.myicon, required this.txt})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: MyConstants.blackcolor.withOpacity(0.4),
            size: 18,
          ),
          Row(
            children: [
              Text(
                txt,
                style: TextStyle(
                    fontFamily: 'Yekanplus',
                    fontSize: 25,
                    color: MyConstants.blackcolor.withOpacity(0.5)),
              ),
              const SizedBox(width: 10),
              Icon(
                myicon,
                size: 24,
                color: MyConstants.blackcolor.withOpacity(0.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
