import 'dart:io';

import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/common_textfield.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WashimgUploadScreen extends StatefulWidget {
  const WashimgUploadScreen({super.key});

  @override
  State<WashimgUploadScreen> createState() => _WashimgUploadScreenState();
}

class _WashimgUploadScreenState extends State<WashimgUploadScreen> {
  final washtypeController = TextEditingController();
  final washDetailController = TextEditingController();
  final rateController = TextEditingController();
  final offerrateController = TextEditingController();
  final timeController = TextEditingController();
  final offerDetailController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 244, 250),
      appBar: appBarScreen("Add Details"),
      body: Form(
        key: formkey,
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            commonTextField(
                hintText: "",
                labelText: '  Car wash types *',
                maxLine: 5,
                validationFunction: (val) {
                  return isNotEmptyValidation(val);
                },
                textEditingController: washtypeController),
            kheight10,
            commonTextField(
                hintText: "",
                labelText: '  Car wash details *',
                maxLine: 5,
                validationFunction: (val) {
                  return isNotEmptyValidation(val);
                },
                textEditingController: washDetailController),
            kheight10,
            commonTextField(
                hintText: "",
                labelText: '  Rate of service *',
                keyboardType: TextInputType.number,
                maxLine: 1,
                validationFunction: (val) {
                  return isNotEmptyValidation(val);
                },
                preFixWidget: Icon(
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
                preFixWidget: Icon(
                  Icons.currency_rupee_outlined,
                  color: UIGuide.Grey,
                ),
                textEditingController: offerrateController),
            kheight10,
            commonTextField(
                hintText: "",
                labelText: '  Time Taken *',
                maxLine: 1,
                validationFunction: (val) {
                  return isNotEmptyValidation(val);
                },
                preFixWidget: Icon(
                  Icons.schedule_outlined,
                  color: UIGuide.Grey,
                ),
                textEditingController: timeController),
            kheight10,
            commonTextField(
                hintText: "",
                labelText: '  Offer details (If any)',
                textEditingController: offerDetailController),
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
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Center(
                    child: _image == null
                        ? Row(
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
                    onPressed: () {
                      hideKeyboard(context);
                      if (formkey.currentState!.validate()) {
                        print('object');
                      }
                    },
                    child: Text(
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
