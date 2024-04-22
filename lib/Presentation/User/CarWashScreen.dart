import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';

class CarWashScreen extends StatelessWidget {
  const CarWashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarScreen("Car Wash"),
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
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Auto marverl car wash",
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
                              "Interior clean",
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
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1GJzI4zjaAcmssyflUORiWOhZB16jFkK9sg&usqp=CAU"))),
                        ),
                        kheight10,
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: UIGuide.WHITE,
                              foregroundColor: UIGuide.PRIMARY,
                              shape: RoundedRectangleBorder(side: BorderSide(color: UIGuide.PRIMARY,),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
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