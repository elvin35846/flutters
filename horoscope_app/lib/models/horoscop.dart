class Horoscop {
  String _horoscopName;
  String _horoscopeDate;
  String _horoscopeInfo;
  String _horoscopeSmallImg;
  String _horoscopeBigImg;

  Horoscop(this._horoscopName, this._horoscopeDate, this._horoscopeInfo,  this._horoscopeSmallImg, this._horoscopeBigImg);

  String get horoscopName => _horoscopName;

  set horoscopName(String val) {
    _horoscopName = val;
  }

  String get horoscopeDate => _horoscopeDate;

  set horoscopeDate(String val) {
    _horoscopeDate = val;
  }

  String get horoscopeInfo => _horoscopeInfo;

  set horoscopeInfo(String val) {
    _horoscopeInfo = val;
  }

  String get horoscopeSmallImg => _horoscopeSmallImg;

  set horoscopeSmallImg(String val) {
    _horoscopeSmallImg = val;
  }

  String get horoscopeBigImg => _horoscopeBigImg;

  set horoscopeBigImg(String val) {
    _horoscopeBigImg = val;
  }
}
