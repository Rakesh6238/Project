import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';

class NotificationScreenUser extends StatelessWidget {
  const NotificationScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarScreen("Notification", leading: false),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: UIGuide.PRIMARYLight,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "🔔 Washing update",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          )),
                          Text(
                            "Date: 13/03/23",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      kheight10,
                       Text(
                            "With this setup, the bottom container will always remain fixed at the bottom of the screen, even when the list grows and the ListView scrolls.",
                            style: TextStyle(
                                fontSize: 14, 
                          )),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
