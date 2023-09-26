class DataModel {
  String name;
  String img;
  double price;
  int people;
  int stars;
  String description;
  String location;

  DataModel(this.name, this.img, this.price, this.people, this.stars,
      this.description, this.location);

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      json['name'],
      json['img'],
      json['price'],
      json['people'],
      json['stars'],
      json['description'],
      json['location'],
    );
  }
}
