class ShoptypeModel {
  String? id;
  String? shopType;

  ShoptypeModel({this.id, this.shopType});

  ShoptypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopType = json['shopType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shopType'] = this.shopType;
    return data;
  }
}