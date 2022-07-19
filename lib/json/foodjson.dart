class FoodJson {
  int? id;
  String? name;
  String? image;
  String? detail;
  int? star;
  int? price;
  int? sale;
  String? distance;
  String? time;

  FoodJson(
      {this.id,
      this.name,
      this.image,
      this.detail,
      this.star,
      this.price,
      this.sale,
      this.distance,
      this.time});

  FoodJson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    detail = json['detail'];
    star = json['star'];
    price = json['price'];
    sale = json['sale'];
    distance = json['distance'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['detail'] = this.detail;
    data['star'] = this.star;
    data['price'] = this.price;
    data['sale'] = this.sale;
    data['distance'] = this.distance;
    data['time'] = this.time;
    return data;
  }
}
