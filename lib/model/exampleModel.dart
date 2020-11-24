import 'dart:convert';

List<ExampleModel> exampleModelFromJson(String str) => List<ExampleModel>.from(
    json.decode(str).map((x) => ExampleModel.fromJson(x)));

String exampleModelToJson(List<ExampleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExampleModel {
  ExampleModel({
    this.name,
    this.manufacturer,
    this.productCode,
    this.sum,
    this.priceInclude,
    this.availability,
    this.image,
    this.color,
  });

  String name;
  String manufacturer;
  String productCode;
  double sum;
  String priceInclude;
  int availability;
  String image;
  String color;

  factory ExampleModel.fromJson(Map<String, dynamic> json) => ExampleModel(
        name: json["name"],
        manufacturer: json["manufacturer"],
        productCode: json["productCode"],
        sum: json["sum"].toDouble(),
        priceInclude: json["priceInclude"],
        availability: json["availability"],
        image: json["image"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "manufacturer": manufacturer,
        "productCode": productCode,
        "sum": sum,
        "priceInclude": priceInclude,
        "availability": availability,
        "image": image,
        "color": color,
      };
}
