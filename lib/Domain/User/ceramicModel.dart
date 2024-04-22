class CeramicModel {
    String? id;
    String? name;
    String? description;
    String? price;
    num? discount;
    String? workshop;
    num? rate;
    String? location;
    num? time;

    CeramicModel({this.id, this.name, this.description, this.price, this.discount, this.workshop, this.rate, this.location, this.time}); 

    CeramicModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        description = json['description'];
        price = json['price'];
        discount = json['discount'];
        workshop = json['workshop'];
        rate = json['rate'];
        location = json['location'];
        time = json['time'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['name'] = name;
        data['description'] = description;
        data['price'] = price;
        data['discount'] = discount;
        data['workshop'] = workshop;
        data['rate'] = rate;
        data['location'] = location;
        data['time'] = time;
        return data;
    }
}

