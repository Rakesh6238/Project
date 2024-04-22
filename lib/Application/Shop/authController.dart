import 'package:automarvelsystem/Domain/Shop/shopregistreModel.dart';
import 'package:automarvelsystem/Presentation/Shop/MainScreenShop.dart';
import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:dio/dio.dart' as dio;

import 'package:get/get.dart';

class AuthController extends GetxController {
  final dio.Dio _dio = dio.Dio();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    update();
  }

  //Shop register

  Future getShopRegister(
      String userName,
      String email,
      String phone,
      String shopName,
      String password,
      String location,
      String description,
      String locationLink,
      String district,
      String imagePath,
      String imageName,
      List shopTypeList) async {
    setLoading(true);

    var headers = {
      'Content-Type': 'application/json',
    };

    dio.FormData formData = dio.FormData.fromMap({
      'userName': userName,
      'email': email,
      'phone': phone,
      'shopName': shopName,
      'password': password,
      'accountType': 'ShopOwner',
      'location': location,
      'description': description,
      'state': 'Kerala',
      'district': district,
      'locationLink': locationLink,
      'profile': await dio.MultipartFile.fromFile(
        imagePath,
        filename: imageName,
      ),
    });

    Map<String, String> idMap = {};
    for (int i = 0; i < shopTypeList.length; i++) {
      idMap['shopType[$i]'] = shopTypeList[i];
    }
    formData.fields.addAll(idMap.entries);
    print(formData.fields);
    try {
      final response = await _dio.post(
        '${UIGuide.baseURL}api/Auth/register',
        data: formData,
        options: dio.Options(headers: headers),
      );

      if (response.statusCode == 200) {
        setLoading(true);
        var jsonData = await response.data;
        print(jsonData);
  
        snackbarWidget('Successfully Registered', 3);
   Get.off(()=>ShopMainScreen());
        setLoading(false);
        update();
      } else {
        setLoading(false);
        print(" error");
      }
    } catch (e) { snackbarWidget('An error occured, please try again', 3);
      setLoading(false);
      print(e);
    }
  }

  //get shop type

  List<ShoptypeModel> typeList = [];
  Future getShopType() async {
    setLoading(true);
    typeList.clear();

    var headers = {'Content-Type': 'application/json'};

    try {
      final response = await _dio.get(
        '${UIGuide.baseURL}api/Workshop/GetShopType',
        options: dio.Options(headers: headers),
      );

      if (response.statusCode == 200) {
        setLoading(true);
        var jsonData = await response.data;
        print(jsonData);

        List<ShoptypeModel> templist1 = List<ShoptypeModel>.from(
            jsonData.map((x) => ShoptypeModel.fromJson(x)));
        typeList.addAll(templist1);
        setLoading(false);
        update();
      } else {
        setLoading(false);
        print(" error");
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }
}
