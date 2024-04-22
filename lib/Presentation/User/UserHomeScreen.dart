import 'package:automarvelsystem/Presentation/User/AcRepairScreen.dart';
import 'package:automarvelsystem/Presentation/User/BatteryScreen.dart';
import 'package:automarvelsystem/Presentation/User/CarWashScreen.dart';
import 'package:automarvelsystem/Presentation/User/CeramicCoatingScreen.dart';
import 'package:automarvelsystem/Presentation/User/MoreAccessories.dart';
import 'package:automarvelsystem/Presentation/User/WorkshopScreen.dart';
import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:geocoding/geocoding.dart' as geocoding;

import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart'
    as gMapPlacePicker;
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gMap;
import 'package:shared_preferences/shared_preferences.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove("placeNameUser");
        final lat = prefs.getDouble('latitudeUser');
        placeName = prefs.getString('placeNameUser') ?? '';

        print('Lat---$lat');

        if (lat == null) {
          print('getlocation=====');
          getLocation();
        }
      },
    );
  }

  String placeName = 'Select Location';

  bool selectLocation = false;
  var _latitude;
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
            placemarks.first.street ?? 'Unknown Place'; // Extract place name
        print('Place Name: $placeName');

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setDouble('latitudeUser', location.latitude);
        await prefs.setDouble('longitudeUser', location.longitude);
        await prefs.setString('placeNameUser', placeName);

        // Perform desired actions with the obtained location data
        _latitude = location.latitude;
        _longitude = location.longitude;
        locationString = '$_latitude , $_longitude';
        print(locationString);
        print("Latitude: $_latitude    Longitude: $_longitude");
        setState(() {});

        selectLocation = false;
      }
    } else {
      // showsna(context, "Allow location to continue", 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: getScreenWidth(context),
          height: 215,
          decoration: const BoxDecoration(
              color: UIGuide.PRIMARY,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight30,
              kheight20,
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: UIGuide.WHITE,
                      backgroundImage: NetworkImage(
                          "https://www.surtecsuzuki.com.mx/facturas/img/user1.jpg"),
                    ),
                    kWidth,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rakesh",
                          style: TextStyle(
                              fontSize: 23,
                              color: UIGuide.WHITE,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Welcome back..!",
                          style: TextStyle(
                              fontSize: 12,
                              color: UIGuide.WHITE,
                              fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            getLocation();
                          },
                          child: Text(
                            "📍  $placeName",
                            style: TextStyle(
                                fontSize: 12,
                                color: UIGuide.WHITE,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              kheight20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return CarCompanyBottomSheet();
                      },
                    );
                  },
                  child: Container(
                    width: getScreenWidth(context),
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: UIGuide.WHITE),
                    child: const Center(
                        child: Row(
                      children: [
                        kWidth,
                        kWidth,
                        Text('Please Choose Your Car Model'),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: VerticalDivider(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.edit,
                            color: UIGuide.LIGHT_BLACK,
                          ),
                        )
                      ],
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              kheight30,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: getScreenWidth(context),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Color.fromARGB(255, 178, 203, 232)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "        Custom Services",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      width: getScreenWidth(context),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          border: Border.all(
                              color: const Color.fromARGB(255, 149, 189, 235))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          cardShape('assets/images/worskshop.png', 'WorkShop\n',
                              () {
                            Get.to(() => WorkShopScreenUser());
                          }),
                          cardShapeWithLottie(
                              'assets/images/emergency.json', 'Emergency\n',
                              () {
                            Get.to(() => BatteryScreenUser());
                          }),
                          cardShape('assets/images/battery.png', 'Battery\n',
                              () {
                            Get.to(() => BatteryScreenUser());
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              kheight20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: getScreenWidth(context),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Color.fromARGB(255, 178, 203, 232)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "        Spare Services",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      width: getScreenWidth(context),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          border: Border.all(
                              color: const Color.fromARGB(255, 149, 189, 235))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          cardShape('assets/images/ac repair.png',
                              'Ac Repair &\nServices', () {
                            Get.to(() => AcRepairService());
                          }),
                          cardShapeWithLottie('assets/images/car spa.json',
                              'Car Spa &\nCleaning', () {
                            Get.to(() => CarWashScreen());
                          }),
                          cardShape('assets/images/accessories.png',
                              'Ceramic\nCoating', () {
                            Get.to(() => CeramicCoatingUserScreen());
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              kheight20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    Get.to(() => MoreAccessoriesScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    width: getScreenWidth(context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: UIGuide.PRIMARYLight)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("More Accessories"),
                        // kWidth20,
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: LottieBuilder.asset(
                            "assets/images/car spa.json",
                            fit: BoxFit.cover,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: UIGuide.Grey,
                            )),
                        //kWidth20,
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ))
      ]),
    );
  }
}

class CarCompanyBottomSheet extends StatefulWidget {
  @override
  _CarCompanyBottomSheetState createState() => _CarCompanyBottomSheetState();
}

class _CarCompanyBottomSheetState extends State<CarCompanyBottomSheet> {
  String? _selectedCompany;

  final List<String> _carCompanies = [
    'Toyota',
    'Honda',
    'Ford',
    'Chevrolet',
    'BMW',
    'Mercedes-Benz',
    'Audi',
    'Tesla',
    'Volkswagen',
    'Nissan',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Select a Car Company',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: _carCompanies.length,
              itemBuilder: (context, index) {
                final company = _carCompanies[index];
                return RadioListTile(
                  title: Text(company),
                  value: company,
                  groupValue: _selectedCompany,
                  onChanged: (value) {
                    setState(() {
                      _selectedCompany = value as String?;
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ),
                kWidth,
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: UIGuide.WHITE,
                      backgroundColor: UIGuide.PRIMARY,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: _selectedCompany == null
                        ? null
                        : () {
                            Navigator.pop(context, _selectedCompany);
                          },
                    child: Text('OK'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
