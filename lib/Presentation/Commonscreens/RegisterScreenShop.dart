import 'dart:io';

import 'package:automarvelsystem/Application/Shop/authController.dart';
import 'package:automarvelsystem/Presentation/Commonscreens/LoginScreen.dart';
import 'package:automarvelsystem/Presentation/Commonscreens/RegisterScreenUser.dart';
import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/common_textfield.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:automarvelsystem/Utils/progressLoader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:get/route_manager.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart'
    as gMapPlacePicker;
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gMap;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreenShopOwner extends StatefulWidget {
  RegisterScreenShopOwner({super.key});

  @override
  State<RegisterScreenShopOwner> createState() =>
      _RegisterScreenShopOwnerState();
}

class _RegisterScreenShopOwnerState extends State<RegisterScreenShopOwner> {
  final _formKey = GlobalKey<FormState>();

  final _emailId = TextEditingController();

  final _phonenum = TextEditingController();

  final _username = TextEditingController();

  final _shopname = TextEditingController();
  final _shopLocation = TextEditingController();
  final _shopDescription = TextEditingController();

  final _password = TextEditingController();
  final _confPassword = TextEditingController();

  final authController = Get.put(AuthController());

  List<String> _selectedItems = [];
  List<String> _selectedID = [];

  // List<String> _items = [
  //   'Workshop',
  //   'Car wash',
  //   'Battery',
  //   'Ceramic Coating',
  //   'Ac Repair'
  // ];
  List _checkedItems = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await authController.getShopType();
      _checkedItems =
          await List<bool>.filled(authController.typeList.length, false);
    });
  }

  File? _image;
  final picker = ImagePicker();
  String? imagePath;
    String? imageName;

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(pickedFile.path);
        imagePath=pickedFile.path;
         imageName=pickedFile.name;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (auth) {
          return auth.loading?ProgressLoader(): Form(
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
                  kheight30,
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: commonTextField(
                        hintText: "Enter Your Name",
                        textEditingController: _username,
                        suffixIcon: Icon(Icons.person_2_outlined)),
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
                        suffixIcon: Icon(Icons.phone_android_outlined)),
                  ),
                  kheight10,
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: commonTextField(
                        hintText: "Enter E-mail Id",
                        textEditingController: _emailId,
                        suffixIcon: Icon(Icons.email_outlined)),
                  ),
                  kheight10,
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: commonTextField(
                        hintText: "Enter Your Shop Name",
                        textEditingController: _shopname,
                        suffixIcon: Icon(Icons.storefront_outlined)),
                  ),
                  kheight10,
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: commonTextField(
                        hintText: "Enter Your Shop Location",
                        textEditingController: _shopLocation,
                        suffixIcon: Icon(Icons.location_city_rounded)),
                  ),
                  kheight10,
                  kheight10,
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: commonTextField(
                        hintText: "Enter Your Shop Description",
                        maxLine: 3,
                        textEditingController: _shopDescription,
                        suffixIcon: Icon(Icons.description)),
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
                        hintText: "Confirm  Password",
                        textEditingController: _confPassword,
                        isPassword: true,
                        showPassword: false,
                        isShowEye: true),
                  ),
                  kheight10,
                  Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: InkWell(
                        onTap: () async {
                          _showMultiSelectDialog(context);
                        },
                        child: Container(
                          width: getScreenWidth(context),
                          decoration: BoxDecoration(
                            color: UIGuide.WHITE,
                            border: Border.all(
                                color: borderColor ?? UIGuide.Grey, width: 1),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ListTile(
                            title: Text(_selectedID.isEmpty
                                ? "Select your shop type"
                                : "${_selectedID.length} Selected"),
                            trailing: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      )),
                  kheight10,
                  Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: InkWell(
                        onTap: () async {
                          await getLocation();
                          // setState(() {});
                        },
                        child: Container(
                          width: getScreenWidth(context),
                          decoration: BoxDecoration(
                            color: UIGuide.WHITE,
                            border: Border.all(
                                color: borderColor ?? UIGuide.Grey, width: 1),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ListTile(
                            title: Text(
                                "${placeName.isEmpty ? 'Select your shop Location' : placeName}"),
                            trailing: Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )),
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
                          color: const Color.fromARGB(255, 230, 230, 230)),
                      child: Center(
                          child: _image == null
                              ? Text('No image selected.')
                              : Image.file(_image!)),
                    ),
                  ),
                  kheight20,
                  SizedBox(
                    width: getScreenWidth(context) / 2,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (_confPassword.text != _password.text) {
                            snackbarWidget('Password not match', 2);
                          } else {
                            String googleUrl =
                                'https://www.google.com/maps/search/?api=1&query=$_latitude,$_longitude';
          
                            await authController.getShopRegister(
                                _username.text,
                                _emailId.text,
                                _phonenum.text,
                                _shopname.text,
                                _password.text,
                                _shopLocation.text,
                                _shopDescription.text,
                                googleUrl,
                                district,imagePath??"",imageName??"",_selectedID);
                          }
                        }
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
                      child: Text('Register'),
                    ),
                  ),
                  kheight10,
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text(
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
                              builder: (context) => RegisterScreenUser()));
                    },
                    child: Text(
                      "Register as a user",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  bool selectLocation = false;
  var _latitude;
  String placeName = '';
  String district = '';
  var _longitude;
  String locationString = '';
  getLocation() async {
    ph.PermissionStatus status = await ph.Permission.location.request();
    if (status.isGranted) {
      if (!selectLocation) {
        selectLocation = true;
        showDialog(
          context: context,
          builder: (ctx) {
            return const Center(
              child: CircularProgressIndicator(
                color: UIGuide.PRIMARY,
              ),
            );
          },
        );

        geolocator.Position location =
            await geolocator.Geolocator.getCurrentPosition(
                desiredAccuracy: geolocator.LocationAccuracy.high);

        Navigator.pop(context);

        List<geocoding.Placemark> placemarks =
            await geocoding.placemarkFromCoordinates(
                location.latitude, location.longitude); // Reverse geocoding

        placeName =
            placemarks.first.name ?? 'Unknown Place'; // Extract place name
        print('Place Name: $placeName');
        district = placemarks.first.street ?? 'Unknown Place';
        print(placemarks); // Extract place name
        print('District Name: $placeName');

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setDouble('latitude', location.latitude);
        await prefs.setDouble('longitude', location.longitude);
        await prefs.setString('placeName', placeName);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => gMapPlacePicker.PlacePicker(
              apiKey: 'AIzaSyDYh8T3snTBbQzon7qRybZw-0Y1LvNqdqU',
              initialPosition: gMap.LatLng(
                location.latitude,
                location.longitude,
              ),
              searchForInitialValue: false,
              selectInitialPosition: true,
              onPlacePicked: (res) async {
                Navigator.of(context).pop();

                _latitude = res.geometry!.location.lat;
                _longitude = res.geometry!.location.lng;
                locationString = '$_latitude , $_longitude';
                print(locationString);
                print("Latitude: $_latitude    Longitude: $_longitude");
                setState(() {});
              },
              useCurrentLocation: true,
            ),
          ),
        );
        selectLocation = false;
      }
    } else {
      // showsna(context, "Allow location to continue", 2);
    }
  }

  void _showMultiSelectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return GetBuilder<AuthController>(builder: (auth) {
              return AlertDialog(
                title: Text(
                  'Select your shop type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                content: Container(
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: auth.typeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = auth.typeList[index];
                      print(_selectedID.length);
                      return CheckboxListTile(
                        title: Text(item.shopType ?? ""),
                        value: _checkedItems[index],
                        activeColor: UIGuide.PRIMARY,
                        onChanged: (bool? value) {
                          setState(() {
                            _checkedItems[index] = value ?? false;
                            if (value ?? false) {
                              _selectedItems.add(item.shopType ?? "");
                              _selectedID.add(item.id ?? "");
                            } else {
                              _selectedID.remove(item.id ?? "");
                              _selectedItems.remove(item.shopType ?? "");
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        print(_selectedID.length);
                      });
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(color: UIGuide.PRIMARY),
                    ),
                  ),
                ],
              );
            });
          },
        );
      },
    );
  }
}
