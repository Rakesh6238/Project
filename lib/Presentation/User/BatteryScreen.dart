import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';

class BatteryScreenUser extends StatelessWidget {
  const BatteryScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarScreen("Batteries"),
      body: ListView.builder(
          itemCount: 8,
          shrinkWrap: true,
          itemBuilder: (contex, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: getScreenWidth(context),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: UIGuide.PRIMARYLight),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          "Amaron Batetries (3 year Waranty)",
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
                              "Free cost of installation",
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
                         Row(
                          children: [
                            Text(
                              '1800 ',
                              style: TextStyle(color: UIGuide.Grey, decoration: TextDecoration.lineThrough, ),
                            ),
                            Text(
                              "₹1600",
                              
                            ),kWidth,
                            Text("20% off",style: TextStyle(color: Colors.green),)
                          ],
                        )
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
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://media.istockphoto.com/id/899016436/photo/car-battery-closeup-3d-rendering-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=4Y9E1sKjtNfNbUMseujTq3B9Lh8I07zDOLgT28efPTE="))),
                        ),
                        kheight10,
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: UIGuide.WHITE,
                              foregroundColor: UIGuide.PRIMARY,
                              shape: RoundedRectangleBorder(side: BorderSide(color: UIGuide.PRIMARY,),
                                borderRadius: BorderRadius.circular(10)  ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Buy Now",
                              style: TextStyle(fontSize: 12),
                            ))
                      ],
                    ),
                    kWidth,
                  ],
                ),
              ),
            );
          }),
    );
  }
}
