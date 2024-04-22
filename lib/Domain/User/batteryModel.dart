class BatteryModel {
    String? id;
    String? name;
    String? typeOfItem;
    String? description;
    String? price;
    num? warranty;
    num? discount;
    String? workshop;
    int? rate;

    BatteryModel({this.id, this.name, this.typeOfItem, this.description, this.price, this.warranty, this.discount, this.workshop, this.rate}); 

    BatteryModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        typeOfItem = json['typeOfItem'];
        description = json['description'];
        price = json['price'];
        warranty = json['warranty'];
        discount = json['discount'];
        workshop = json['workshop'];
        rate = json['rate'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['name'] = name;
        data['typeOfItem'] = typeOfItem;
        data['description'] = description;
        data['price'] = price;
        data['warranty'] = warranty;
        data['discount'] = discount;
        data['workshop'] = workshop;
        data['rate'] = rate;
        return data;
    }
}
