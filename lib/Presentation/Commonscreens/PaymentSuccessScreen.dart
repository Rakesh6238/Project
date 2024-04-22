import 'package:automarvelsystem/Presentation/User/UserMainScreen.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => UserMainScreen()),
            (route) => false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: size.width,
                    child: Lottie.asset("assets/images/ijoqViP5gi.json",
                        width: size.width, repeat: false),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: size.width,
                    child: Lottie.asset(
                      "assets/images/ijoqViP5gi.json",
                      repeat: false,
                      width: size.width,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: size.width,
                      height: 260,
                      child: Lottie.asset(
                        "assets/images/successAnim.json",
                        width: size.width,
                      ),
                    ),
                    const Text(
                      "Transaction Success",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: UIGuide.PRIMARY),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 100,
              right: 100,
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserMainScreen()),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(elevation: 10),
                  child: const Text(
                    "Back Home",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
