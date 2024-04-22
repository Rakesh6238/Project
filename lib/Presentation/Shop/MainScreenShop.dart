import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:automarvelsystem/Application/Shop/shopHomeController.dart';
import 'package:automarvelsystem/Presentation/Shop/HomeScreenshop.dart';
import 'package:automarvelsystem/Presentation/User/Notificationscreen.dart';
import 'package:automarvelsystem/Presentation/User/ProfileScreen.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ShopMainScreen extends StatefulWidget {
  const ShopMainScreen({super.key});

  @override
  State<ShopMainScreen> createState() => _ShopMainScreenState();
}

class _ShopMainScreenState extends State<ShopMainScreen> {
  final _pageController = PageController(initialPage: 0);

  int maxCount = 3;

  final List<Widget> bottomBarPages = [
    ShopHomeScreen(),
    NotificationScreenUser(),
    ProfileScreenUser()
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int initialIndex = 0;
  final ShopHomeController _homeController = Get.put(ShopHomeController());
  @override
  void initState() {
    initialIndex = 0;

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});
  }

  _onwillpop() {
    if (initialIndex != 0) {
      initialIndex = 0;
      print("======$initialIndex");
      _pageController.jumpToPage(0);
      print(_pageController.initialPage);
    } else {
      // Navigator.pop();
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
                              image:
                                  AssetImage('assets/images/notification.png'),
                              fit: BoxFit.fill)),
                    ),
                    activeItem: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/notification.png'),
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
