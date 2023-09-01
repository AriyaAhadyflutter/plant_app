import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPage();
}

class _ScanPage extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
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
                  child: Icon(
                    Icons.share,
                    color: MyConstants.primarycolor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 100,
            child: SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.8,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/code-scan.png', height: 100),
                    const SizedBox(height: 20),
                    Text(
                      'برای اسکن گیاه کلیک کنید ',
                      style: TextStyle(
                        color: MyConstants.primarycolor.withOpacity(0.8),
                        fontFamily: 'Lalezar',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
