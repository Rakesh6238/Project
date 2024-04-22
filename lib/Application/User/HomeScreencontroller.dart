import 'package:automarvelsystem/Domain/User/acrepairModel.dart';
import 'package:automarvelsystem/Domain/User/batteryModel.dart';
import 'package:automarvelsystem/Domain/User/carwashModel.dart';
import 'package:automarvelsystem/Domain/User/ceramicModel.dart';
import 'package:automarvelsystem/Domain/User/workshopModel.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  Dio dio = Dio();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    update();
  }

// workshop
  List<WorkShopList> workshopList = [];
  Future getWorskshopData() async {
    setLoading(true);
    workshopList.clear();

    var headers = {'Content-Type': 'application/json'};

    try {
      final response = await dio.get(
        '${UIGuide.baseURL}api/CarOwner/GetWorkshops',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        setLoading(true);
        var jsonData = await response.data;

        List<WorkShopList> templist1 = List<WorkShopList>.from(
            jsonData.map((x) => WorkShopList.fromJson(x)));
        workshopList.addAll(templist1);

        //Image.memory(
        //   base64Decode(_imageList[index].base64String),
        //   width: 100,
        //   height: 100,
        // ),

        setLoading(false);

        update();
      } else {
        setLoading(false);
        print(" error");
      }
    } catch (e) {
      setLoading(false);
      print(e);
      // checkDioException(e);
    }
  }

  //Battery
  List<BatteryModel> batteryList = [];
  Future getBatteryData() async {
    setLoading(true);
    batteryList.clear();

    var headers = {'Content-Type': 'application/json'};

    try {
      final response = await dio.get(
        '${UIGuide.baseURL}api/CarOwner/GetBattery',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        setLoading(true);
        var jsonData = await response.data;

        List<BatteryModel> templist1 = List<BatteryModel>.from(
            jsonData.map((x) => BatteryModel.fromJson(x)));
        batteryList.addAll(templist1);
        setLoading(false);
        update();
      } else {
        setLoading(false);
        print("getBatteryData error");
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }

  //Ac replair

  List<AcRepairModel> acRepairList = [];
  Future getAcRepair() async {
    setLoading(true);
    acRepairList.clear();

    var headers = {'Content-Type': 'application/json'};

    try {
      final response = await dio.get(
        '${UIGuide.baseURL}api/CarOwner/GetAcRepair',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        setLoading(true);
        var jsonData = await response.data;

        List<AcRepairModel> templist1 = List<AcRepairModel>.from(
            jsonData.map((x) => AcRepairModel.fromJson(x)));
        acRepairList.addAll(templist1);
        setLoading(false);
        update();
      } else {
        setLoading(false);
        print("getAcRepair error");
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }

  //Ceramic

  List<CeramicModel> cermaicList = [];
  Future getCeramic() async {
    setLoading(true);
    cermaicList.clear();

    var headers = {'Content-Type': 'application/json'};

    try {
      final response = await dio.get(
        '${UIGuide.baseURL}api/CarOwner/GetCeramic',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        setLoading(true);
        var jsonData = await response.data;

        List<CeramicModel> templist1 = List<CeramicModel>.from(
            jsonData.map((x) => CeramicModel.fromJson(x)));
        cermaicList.addAll(templist1);
        setLoading(false);
        update();
      } else {
        setLoading(false);
        print("getCeramic error");
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }

  //get car wash

  List<CarWashModel> carwashList = [];
  Future getCarWash() async {
    setLoading(true);
    carwashList.clear();

    var headers = {'Content-Type': 'application/json'};

    try {
      final response = await dio.get(
        '${UIGuide.baseURL}api/CarOwner/GetCarWash',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        setLoading(true);
        var jsonData = await response.data;

        List<CarWashModel> templist1 = List<CarWashModel>.from(
            jsonData.map((x) => CarWashModel.fromJson(x)));
        carwashList.addAll(templist1);
        setLoading(false);
        update();
      } else {
        setLoading(false);
        print("getCeramic error");
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }
}
