import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/widgets/profileWidget/profilewidget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            //profile image

            Container(
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: MyConstants.primarycolor.withOpacity(0.5),
                  width: 5,
                ),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/profile2.png'),
              ),
            ), //end profile image
            const SizedBox(height: 20),
            // profile text
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'آریا احدی',
                  style: TextStyle(
                    fontFamily: 'iranSans',
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  height: 25,
                  child: Image(
                    image: AssetImage('assets/images/verified.png'),
                  ),
                ),
              ],
            ),
            // profile text end
            const SizedBox(height: 15),
            //email text
            Text(
              '87ariyaahady@gmail.com',
              style: TextStyle(
                fontFamily: 'iranSans',
                color: MyConstants.primarycolor.withOpacity(0.48),
              ),
            ),
            //email text end
            const SizedBox(height: 20),
            // profile options
            const SizedBox(
              child: Column(
                children: [
                  ProfileOpsions(myicon: Icons.person, txt: 'پروفایل من '),
                  ProfileOpsions(myicon: Icons.settings, txt: 'تنظیمات'),
                  ProfileOpsions(
                      myicon: Icons.notifications, txt: 'اطلاع رسانی ها'),
                  ProfileOpsions(myicon: Icons.share, txt: 'شبکه های اجتماعی'),
                  ProfileOpsions(myicon: Icons.logout, txt: 'خروج'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
