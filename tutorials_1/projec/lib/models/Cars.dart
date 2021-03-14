import 'package:projec/models/model.dart';

class Cars {
  String carName;
  String country;
  int year;
  List<Model> model;

  Cars.fromJsonMap(Map<String, dynamic> map)
      : carName = map["car_name"],
        country = map["country"],
        year = map["year"],
        model =
            List<Model>.from(map["model"].map((it) => Model.fromJsonMap(it)));
}
