import 'dart:io';

import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/common_textfield.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CeramicUploadScreen extends StatefulWidget {
  const CeramicUploadScreen({super.key});

  @override
  State<CeramicUploadScreen> createState() => _CeramicUploadScreenState();
}

class _CeramicUploadScreenState extends State<CeramicUploadScreen> {
  final nameController = TextEditingController();
  final detailController = TextEditingController();
  final rateController = TextEditingController();
  final offerrateController = TextEditingController();
  final timeController = TextEditingController();
  final offerDetailController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 244, 250),
      appBar: appBarScreen("Add Ceramic Details"),
      body: Form(
        key: formkey,
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            commonTextField(
                hintText: "",
                labelText: '  Ceramic Name & Warantty *',
                validationFunction: (val) {
                  return isNotEmptyValidation(val);
                },
                textEditingController: nameController),
            kheight10,
            commonTextField(
                hintText: "",
                labelText: '  Ceramic Details *',
                maxLine: 5,
                validationFunction: (val) {
                  return isNotEmptyValidation(val);
                },
                textEditingController: detailController),
            kheight10,
            commonTextField(
                hintText: "",
                validationFunction: (val) {
                  return isNotEmptyValidation(val);
                },
                labelText: '  Rate *',
                keyboardType: TextInputType.number,
                maxLine: 1,
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
                validationFunction: (val) {
                  return isNotEmptyValidation(val);
                },
                labelText: '  Time Taken *',
                maxLine: 1,
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
