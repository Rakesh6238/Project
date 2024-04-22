class AcRepairModel {
    String? id;
    String? description;
    String? typeOfItem;
    String? price;
    num? discount;
    String? name;
    num? rate;
    String? location;

    AcRepairModel({this.id, this.description, this.typeOfItem, this.price, this.discount, this.name, this.rate, this.location}); 

    AcRepairModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        description = json['description'];
        typeOfItem = json['typeOfItem'];
        price = json['price'];
        discount = json['discount'];
        name = json['name'];
        rate = json['rate'];
        location = json['location'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['description'] = description;
        data['typeOfItem'] = typeOfItem;
        data['price'] = price;
        data['discount'] = discount;
        data['name'] = name;
        data['rate'] = rate;
        data['location'] = location;
        return data;
    }
}

