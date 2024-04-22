class WorkShopList {
    String? id;
    String? name;
    String? description;
    num? rate;
    String? profile;
    String? location;

    WorkShopList({this.id, this.name, this.description, this.rate, this.profile, this.location}); 

    WorkShopList.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        description = json['description'];
        rate = json['rate'];
        profile = json['profile'];
        location = json['location'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['name'] = name;
        data['description'] = description;
        data['rate'] = rate;
        data['profile'] = profile;
        data['location'] = location;
        return data;
    }
}
