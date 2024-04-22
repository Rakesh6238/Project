import 'package:automarvelsystem/Presentation/Commonscreens/PaymentSuccessScreen.dart';
import 'package:automarvelsystem/Presentation/User/shopDescription.dart';
import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcRepairService extends StatelessWidget {
   AcRepairService({super.key});
 String title="Ac Repair";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarScreen("Ac Repair"),
      body: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (contex, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: getScreenWidth(context),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: UIGuide.PRIMARYLight),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Auto marverl Ac Repair and Service",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        kheight10,
                        Row(
                          children: [
                            Text(
                              '⦿ ',
                              style: TextStyle(color: UIGuide.Grey),
                            ),
                            Text(
                              "Free cost of installation",
                              style: TextStyle(color: UIGuide.Grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '⦿ ',
                              style: TextStyle(color: UIGuide.Grey),
                            ),
                            Text(
                              "Takes 4 hours",
                              style: TextStyle(color: UIGuide.Grey),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '⦿ ',
                              style: TextStyle(color: UIGuide.Grey),
                            ),
                            Text(
                              "Free cost of installation",
                              style: TextStyle(color: UIGuide.Grey),
                            )
                          ],
                        ),
                        kheight10, Text(
                            "📍 Near Rakus's home",
                            style: TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          Text("⭐ ⭐ ⭐ ⭐",style: TextStyle(fontSize: 12),),
                          kheight10,
                       
                      ],
                    )),
                    kWidth,
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://i.pinimg.com/736x/f3/54/39/f35439ac68d21105942e607ae35e0909.jpg"))),
                        ),
                        kheight10,
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: UIGuide.WHITE,
                              foregroundColor: UIGuide.PRIMARY,
                              shape: RoundedRectangleBorder(side: const BorderSide(color: UIGuide.PRIMARY,),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {Get.to(()=>ShopDescription(title: title));},
                            child: const Text(
                              "Book Now",
                              style: TextStyle(fontSize: 12),
                            ))
                      ],
                    ),
                    kWidth,
                  ],
                ),
              ),
            );
      }));
  }
}