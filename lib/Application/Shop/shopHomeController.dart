import 'package:automarvelsystem/Utils/constants.dart';
import 'package:dio/dio.dart'as dio;
import 'package:get/get.dart';

class ShopHomeController extends GetxController {
  final dio.Dio _dio = dio.Dio(); 

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    update();
  }

  //Add battery

  Future getAddBattery(
    String price,
    num discount,
    String descri,
    String batteryName,
    num warantty,
  ) async {
    setLoading(true);

    var headers = {
      'Content-Type': 'application/json',
    };
 
    try {
      final response = await _dio.post(
        '${UIGuide.baseURL}api/Workshop/AddBattery',
        data: {
          "shopId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "price": price,
          "discount": discount,
          "description": descri,
          "batteryName": batteryName,
          "batteryType": "test",
          "warranty": warantty,
          "stock": 10
        },
        options: dio.Options(headers: headers),
      );

      if (response.statusCode == 200) {
        setLoading(true);
        var jsonData = await response.data;
        print(jsonData);

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

  // Add ac repait

  Future getAddAcRepair(
      String price, num discount, String descri, String acRepairType) async {
    setLoading(true);

    var headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await _dio.post(
        '${UIGuide.baseURL}api/Workshop/AddAcRepair',
        data: {
          "shopId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "price": "5000",
          "discount": 10,
          "description": "long life",
          "acRepairType": "Regular"
        },
        options: dio.Options(headers: headers),
      );

      if (response.statusCode == 200) {
        setLoading(true);
        var jsonData = await response.data;
        print(jsonData);

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
