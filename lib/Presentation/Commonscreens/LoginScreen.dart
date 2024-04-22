import 'package:automarvelsystem/Application/Shop/authController.dart';
import 'package:automarvelsystem/Presentation/Commonscreens/RegisterScreenUser.dart';
import 'package:automarvelsystem/Presentation/User/UserMainScreen.dart';
import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/common_textfield.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailId = TextEditingController();

  final _password = TextEditingController();

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: getScreenWidth(context),
                height: 250,
                decoration: const BoxDecoration(
                    color: UIGuide.PRIMARY,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(80))),
                child: const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kheight30,
                      kheight30,
                      kheight20,
                      kheight30,
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30,
                            color: UIGuide.WHITE,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Rev up your repairs with ease!",
                        style: TextStyle(
                            fontSize: 12,
                            color: UIGuide.WHITE,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
              kheight30,
              kheight10,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: commonTextField(
                    hintText: "Enter Registered EmailId",
                    textEditingController: _emailId,
                    validationFunction: (val) {
                      return phoneNumberValidation(val);
                    },
                    suffixIcon: Icon(Icons.phone_android_outlined)),
              ),
              kheight10,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: commonTextField(
                    hintText: "Enter Registered Password",
                    textEditingController: _password,
                    isPassword: true,
                    showPassword: false,
                    isShowEye: true),
              ),
              kheight20,
              SizedBox(
                width: getScreenWidth(context) / 2,
                child: ElevatedButton(
                  onPressed: () {
                    Get.off(() => UserMainScreen());
                    //  Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => UserMainScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: UIGuide.WHITE,
                    backgroundColor: UIGuide.PRIMARY,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.blue),
                    ),
                    elevation: 5, // Elevation
                    padding: EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10), // Button padding
                  ),
                  child: Text('Login'),
                ),
              ),
              kheight10,
              InkWell(
                  onTap: () {
                    Get.off(RegisterScreenUser());
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => RegisterScreenUser()));
                  },
                  child: Text(
                    "Don't have an account? Register",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
