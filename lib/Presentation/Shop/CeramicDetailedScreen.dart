
import 'package:automarvelsystem/Presentation/Shop/CeramicUploadScreen.dart';
import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CeramicDetailScreen extends StatelessWidget {
  const CeramicDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarScreen("Ceramic Coating Details"),
    body:   ListView.builder(
          itemCount: 5,
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
                child: Column(
                  children: [
                    Row(
                      children: [
                         Expanded(
                        child: Column(
                      children: [
                        Text(
                          "Ceramic Coating (3 year waranty)",
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
                              "1 year warantty",
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
                              decoration: BoxDecoration(color: Color.fromARGB(255, 237, 237, 237),
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                                "https://media.istockphoto.com/id/1273682054/photo/car-service-worker-applying-nano-coating-on-a-car-detail.jpg?s=612x612&w=0&k=20&c=w2YoGPnv24lcITfiH7jnTYLAj9xCXUrlbHn33lxcd2U="))),
                            ),
                            kheight10,
                           
                          ],
                        ),
                        kWidth,
                      ],
                    ),
                    Row(children: [ 
                      Spacer(),
                      
                      Container(padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 239, 238),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red)
                        
                        ),child: Text("Remove"),
                      ),kWidth,
                    ],)
                  ],
                ),
              ),
            );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UIGuide.PRIMARYLight,
        onPressed: () {
         Get.to(()=>CeramicUploadScreen());
        },
        child: Icon(Icons.add),
      ),
  
    );
  }
}