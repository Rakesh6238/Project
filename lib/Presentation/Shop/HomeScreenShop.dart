import 'package:automarvelsystem/Presentation/Shop/AcDetailsScreen.dart';
import 'package:automarvelsystem/Presentation/Shop/AccessoriesDetails.dart';
import 'package:automarvelsystem/Presentation/Shop/BatteryDetailScreen.dart';
import 'package:automarvelsystem/Presentation/Shop/CeramicDetailedScreen.dart';
import 'package:automarvelsystem/Presentation/Shop/WashingDetailScreen.dart';
import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopHomeScreen extends StatefulWidget {
  const ShopHomeScreen({super.key});

  @override
  State<ShopHomeScreen> createState() => _ShopHomeScreenState();
}

class _ShopHomeScreenState extends State<ShopHomeScreen> {
  @override
  void initState() {
    super.initState();

   
  }

  bool selectLocation = false;
  var _latitude;
  var _longitude;
  String locationString = '';
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Column(
          children: [
            Container(
              height: 200,
              width: getScreenWidth(context),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://img.freepik.com/free-vector/shop-with-sign-we-are-open_52683-38687.jpg",
                      ),
                      fit: BoxFit.fill)),
            ),
            kheight20,
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: getScreenWidth(context),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              color: Color.fromARGB(255, 178, 203, 232)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "        Add Services",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          width: getScreenWidth(context),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 149, 189, 235))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              cardShape('assets/images/battery.png',
                                  'Battery\n Details', () {
                                Get.to(() => BatteryDetailScreen());
                              }),
                              cardShapeWithLottie('assets/images/car spa.json',
                                  'Car Spa &\n Cleaning', () {
                                Get.to(() => WashingDetailScreen());
                              }),
                              cardShape('assets/images/accessories.png',
                                  'Ceramic\nCoating', () {
                                Get.to(() => CeramicDetailScreen());
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  kheight20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: getScreenWidth(context),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              color: Color.fromARGB(255, 178, 203, 232)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "        Aditional Services",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          width: getScreenWidth(context),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 149, 189, 235))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              cardShape(
                                  'assets/images/ac repair.png', 'Ac\nService',
                                  () {
                                Get.to(() => AcDetailScreen());
                              }),
                              cardShapeWithLottie(
                                  'assets/images/emergency.json', 'Emergency\n',
                                  () {
                                Get.to(() => AccessoriesDetailScreen());
                              }),
                              cardShape('assets/images/worskshop.png',
                                  'Accessories\n', () {
                                Get.to(() => AccessoriesDetailScreen());
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
