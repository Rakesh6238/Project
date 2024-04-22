import 'dart:io';

import 'package:automarvelsystem/Application/Shop/shopHomeController.dart';
import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/common_textfield.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BatteryUploadScreen extends StatefulWidget {
  const BatteryUploadScreen({super.key});

  @override
  State<BatteryUploadScreen> createState() => _BatteryUploadScreenState();
}

class _BatteryUploadScreenState extends State<BatteryUploadScreen> {
  final batteryNameController = TextEditingController();
  final batteryDetailController = TextEditingController();
  final rateController = TextEditingController();
  final offerrateController = TextEditingController();
  final timeController = TextEditingController();
  final warrantyController = TextEditingController();
  ShopHomeController shopController = Get.find<ShopHomeController>();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 244, 250),
      appBar: appBarScreen("Add Battery Details"),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            commonTextField(
                hintText: "",
                labelText: '  Battery Name *',
                validationFunction: (val) {
                  return isNotEmptyValidation(val);
                },
                textEditingController: batteryNameController),
            kheight10,
            commonTextField(
                hintText: "",
                labelText: '  Battery Details *',
                maxLine: 5,
                validationFunction: (val) {
                  return isNotEmptyValidation(val);
                },
                textEditingController: batteryDetailController),
            kheight10,
            commonTextField(
                hintText: "",
                labelText: '  Rate *',
                validationFunction: (val) {
                  return isNotEmptyValidation(val);
                },
                keyboardType: TextInputType.number,
                maxLine: 1,
                preFixWidget: const Icon(
                  Icons.currency_rupee_outlined,
                  color: UIGuide.Grey,
                ),
                textEditingController: rateController),
            kheight10,
            commonTextField(
                hintText: "",
                labelText: '  Offer Rate ',
                keyboardType: TextInputType.number,
                maxLine: 1,
                preFixWidget: const Icon(
                  Icons.currency_rupee_outlined,
                  color: UIGuide.Grey,
                ),
                textEditingController: offerrateController),
            kheight10,
             commonTextField(
                hintText: "",
                labelText: '  Warranty Period',
                keyboardType: TextInputType.number,
                maxLine: 1,
                preFixWidget: const Icon(
                  Icons.wallet,
                  color: UIGuide.Grey,
                ),
                textEditingController: warrantyController),
            kheight10,
            commonTextField(
                hintText: "",
                labelText: '  Time Taken *',
                validationFunction: (val) {
                  return isNotEmptyValidation(val);
                },
                maxLine: 1,
                preFixWidget: const Icon(
                  Icons.schedule_outlined,
                  color: UIGuide.Grey,
                ),
                textEditingController: timeController),
            kheight10,
            kheight10,
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                height: 150,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 255, 255, 255)),
                child: Center(
                    child: _image == null
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Upload image'),
                              Icon(Icons.image_outlined)
                            ],
                          )
                        : Image.file(_image!)),
              ),
            ),
            kheight30,
            SizedBox(
                width: getScreenWidth(context) / 2,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: UIGuide.PRIMARY,
                        foregroundColor: UIGuide.WHITE),
                    onPressed: () async{
                      hideKeyboard(context);
                      if (formkey.currentState!.validate()) {
                        print('object');
       await shopController.getAddBattery(rateController.text, num.parse(offerrateController.text) , batteryDetailController.text, batteryNameController.text, num.parse(warrantyController.text));
                        
                      }
                    },
                    child: const Text(
                      "Upload",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )))
          ],
        ),
      ),
    );
  }

  File? _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
