import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:automarvelsystem/Application/User/HomeScreencontroller.dart';
import 'package:automarvelsystem/Presentation/User/Notificationscreen.dart';
import 'package:automarvelsystem/Presentation/User/ProfileScreen.dart';
import 'package:automarvelsystem/Presentation/User/UserHomeScreen.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({super.key});

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  final _pageController = PageController(initialPage: 0);



  int maxCount = 3;

  final List<Widget> bottomBarPages = [
    UserHomeScreen(),
    NotificationScreenUser(),
    ProfileScreenUser()
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
 final HomeScreenController _homeController=Get.put(HomeScreenController());
  int initialIndex = 0;
  @override
  void initState() {
     super.initState();
    initialIndex = 0;
   

   
  }

  

  _onwillpop() {
    if (initialIndex != 0) {
      initialIndex = 0;
      print("======$initialIndex");
      _pageController.jumpToPage(0);
      print(_pageController.initialPage);
    } else {
     
      SystemNavigator.pop();
      print('object');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onwillpop(),
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= maxCount)
            ? AnimatedNotchBottomBar(
              itemLabelStyle: const TextStyle(
                  color: Color.fromARGB(255, 35, 2, 41), fontSize: 10),
              pageController: _pageController,
              color: UIGuide.WHITE,
              showLabel: true,
              notchColor: Color.fromARGB(255, 233, 243, 255),
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/homeicon.png'),
                            fit: BoxFit.fill)),
                  ),
                  activeItem: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/homeicon.png'),
                            fit: BoxFit.fill)),
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/notification.png'),
                            fit: BoxFit.fill)),
                  ),
                  activeItem: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/notification.png'),
                            fit: BoxFit.fill)),
                  ),
                  itemLabel: 'Notification',
                ),
                BottomBarItem(
                  inActiveItem: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/person.png'),
                            fit: BoxFit.fill)),
                  ),
                  activeItem: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/person.png'),
                            fit: BoxFit.fill)),
                  ),
                  itemLabel: 'Settings',
                ),
              ],
              onTap: (index) {
                HapticFeedback.lightImpact();
            
                initialIndex = index;
                print(initialIndex);
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.easeIn,
                );
              },
            )
            : null,
      ),
    );
  }
}
