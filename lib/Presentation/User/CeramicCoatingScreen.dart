import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';

class CeramicCoatingUserScreen extends StatelessWidget {
  const CeramicCoatingUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    backgroundColor: UIGuide.PRIMARY,
    foregroundColor: UIGuide.WHITE,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
    centerTitle: true,
    title: Text(
      "Ceramic Coating",
      style: const TextStyle(fontWeight: FontWeight.w500),
    ),  actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
               
              },
            ),
          ],
  ),
      
      
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
                          "Ceramic coating with 3 year warantty",
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1594028558497-a981b6559f91?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YWxsb3klMjB3aGVlbHxlbnwwfHwwfHx8MA%3D%3D"))),
                        ),
                        kheight10,
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: UIGuide.WHITE,
                              foregroundColor: UIGuide.PRIMARY,
                              shape: RoundedRectangleBorder(side: BorderSide(color: UIGuide.PRIMARY,
                              ),
                              borderRadius: BorderRadius.circular(10)),
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
