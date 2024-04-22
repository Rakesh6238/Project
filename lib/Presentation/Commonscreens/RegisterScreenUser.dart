import 'package:automarvelsystem/Presentation/Commonscreens/LoginScreen.dart';
import 'package:automarvelsystem/Presentation/Commonscreens/RegisterScreenShop.dart';
import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/common_textfield.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';

class RegisterScreenUser extends StatelessWidget {
  RegisterScreenUser({super.key});
  final _formKey = GlobalKey<FormState>();

  final _phonenum = TextEditingController();
   final _username = TextEditingController();
 final _emailId = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: getScreenWidth(context),
                height: 180,
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
                      Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 30,
                            color: UIGuide.WHITE,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Ultimate Toolbox for Automotive Solutions",
                        style: TextStyle(
                            fontSize: 12,
                            color: UIGuide.WHITE,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
              kheight10,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: commonTextField(
                    hintText: "Enter Your Name",
                    textEditingController: _username,
                    suffixIcon: const Icon(Icons.person_2_outlined)),
              ),
              kheight10,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: commonTextField(
                    hintText: "Enter Phone Number",
                    textEditingController: _phonenum,
                    validationFunction: (val) {
                      return phoneNumberValidation(val);
                    },
                    suffixIcon: const Icon(Icons.phone_android_outlined)),
              ),
              kheight10,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: commonTextField(
                    hintText: "Enter E-mail Id",
                    textEditingController: _emailId,
                    suffixIcon: const Icon(Icons.email_outlined)),
              ),
              kheight10,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: commonTextField(
                    hintText: "Enter Password",
                    textEditingController: _password,
                    isPassword: true,
                    showPassword: false,
                    isShowEye: true),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: commonTextField(
                    hintText: "Please confirm Password",
                    textEditingController: _confirmpassword,
                    isPassword: true,
                    showPassword: false,
                    isShowEye: true),
              ),
              kheight10,
              kheight20,
              SizedBox(
                width: getScreenWidth(context) / 2,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: UIGuide.WHITE,
                    backgroundColor: UIGuide.PRIMARY,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Colors.blue),
                    ),
                    elevation: 5, // Elevation
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10), // Button padding
                  ),
                  child: const Text('Register'),
                ),
              ),
              kheight10,
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text(
                  "Already have an account? Login",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              kheight30,
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreenShopOwner()));
                },
                child: const Text(
                  "Register as a shop owner",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
