class City {
 late int id;
 late String name;
 late int price;

  City({required this.id,required this.name,required this.price});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }
}
