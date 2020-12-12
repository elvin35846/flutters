class Model {
  String modelName;
  int price;
  String engine;
  Model.fromJsonMap(Map<String, dynamic> map)
      : modelName = map["model_name"],
        price = map["price"],
        engine = map["engine"];
}
