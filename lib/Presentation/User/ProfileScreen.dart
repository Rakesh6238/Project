import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreenUser extends StatelessWidget {
  const ProfileScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: getScreenWidth(context),
          height: 250,
          decoration: const BoxDecoration(
              color: UIGuide.PRIMARY,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              kheight30,
              kheight20,
              Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: UIGuide.WHITE,
                    backgroundImage: NetworkImage(
                        "https://www.surtecsuzuki.com.mx/facturas/img/user1.jpg"),
                  ),
                  kWidth,
                  Text(
                    "Rakesh",
                    style: TextStyle(
                        fontSize: 22,
                        color: UIGuide.WHITE,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "rakesh@gmail.com",
                    style: TextStyle(
                        fontSize: 15,
                        color: UIGuide.WHITE,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              kheight20,
            ],
          ),
        ),
        kheight20,
        ListTile(
          leading: Icon(
            Icons.person_2_outlined,
            size: 28,
            color: UIGuide.Grey,
          ),
          title: Text(
            'Account',
            style: TextStyle(
                fontSize: 17,
                color: UIGuide.BLACK,
                fontWeight: FontWeight.w400),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 17,
            color: UIGuide.Grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          child: Divider(
            color: UIGuide.LIGHT_BLACK,
          ),
        ),
         ListTile(
          leading: Icon(
            Icons.settings_outlined,
            size: 28,
            color: UIGuide.Grey,
          ),
          title: Text(
            'Settings',
            style: TextStyle(
                fontSize: 17,
                color: UIGuide.BLACK,
                fontWeight: FontWeight.w400),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 17,
            color: UIGuide.Grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          child: Divider(
            color: UIGuide.LIGHT_BLACK,
          ),
        ),
         ListTile(
          leading: Icon(
            Icons.info_outline,
            size: 28,
            color: UIGuide.Grey,
          ),
          title: Text(
            'About',
            style: TextStyle(
                fontSize: 17,
                color: UIGuide.BLACK,
                fontWeight: FontWeight.w400),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 17,
            color: UIGuide.Grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          child: Divider(
            color: UIGuide.LIGHT_BLACK,
          ),
        )
      ]),
    );
  }
}
