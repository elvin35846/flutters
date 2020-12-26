class Students {
  int _id;
  String _name;
  int _active;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get active => _active;

  set active(int value) {
    _active = value;
  }

  Students(this._active, this._name);

  Students.withID(this._active, this._name, this._id);

  Students.converObjectfromReadDBMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._active = map['active'];
  }

  Map<String, dynamic> convertToMapForWriteDB() {
    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['name'] = _name;
    map['active'] = _active;
    return map;
  }
}
