/// Length : [{"name":"Meter","conversion":1.0,"base_unit":true},{"name":"Millimeter","conversion":1000.0},{"name":"Centimeter","conversion":100.0},{"name":"Kilometer","conversion":0.001},{"name":"Inch","conversion":39.3701},{"name":"Foot","conversion":3.28084},{"name":"Yard","conversion":1.09361},{"name":"Mile","conversion":0.000621371}]
/// Area : [{"name":"Meter squared","conversion":1.0,"base_unit":true},{"name":"Kilometer squared","conversion":0.000001},{"name":"Square inch","conversion":1550.0},{"name":"Square foot","conversion":10.7639},{"name":"Square yard","conversion":1.19599},{"name":"Acre","conversion":0.000247105},{"name":"Hectare","conversion":0.0001}]
/// Volume : [{"name":"Cubic meter","conversion":1.0,"base_unit":true},{"name":"US legal cup","conversion":4166.67},{"name":"US fluid ounce","conversion":33814.0},{"name":"US tablespoon","conversion":67628.0},{"name":"US teaspoon","conversion":202884.0},{"name":"Imperial cup","conversion":3519.51},{"name":"Imperial fluid ounce","conversion":35195.1},{"name":"Imperial tablespoon","conversion":56312.13673},{"name":"Imperial teaspoon","conversion":168936.41019}]
/// Mass : [{"name":"Kilogram","conversion":1.0,"base_unit":true},{"name":"Gram","conversion":1000.0},{"name":"Ounce","conversion":35.274},{"name":"Pound","conversion":2.20462},{"name":"Stone","conversion":0.157473},{"name":"US ton","conversion":0.00110231},{"name":"Metric ton","conversion":0.001}]
/// Time : [{"name":"Second","conversion":1.0,"base_unit":true},{"name":"Millisecond","conversion":1000.0},{"name":"Minute","conversion":0.0166666666666667},{"name":"Hour","conversion":0.0002777777777778},{"name":"Day","conversion":0.00001157407407},{"name":"Week","conversion":0.000001653439153},{"name":"Fortnight","conversion":0.000000826719576}]
/// Digital Storage : [{"name":"Megabyte","conversion":1.0,"base_unit":true},{"name":"Megabit","conversion":8.0},{"name":"Mebibyte","conversion":0.953674},{"name":"Byte","conversion":1000000.0},{"name":"Kilobyte","conversion":1000.0},{"name":"Gigabyte","conversion":0.001},{"name":"Terabyte","conversion":0.000001},{"name":"Petabyte","conversion":0.000000001}]
/// Energy : [{"name":"Joule","conversion":1.0,"base_unit":true},{"name":"Kilojoule","conversion":0.001},{"name":"Gram calorie","conversion":0.239006},{"name":"Kilocalorie (Calorie)","conversion":0.000239006},{"name":"Watt hour","conversion":0.000277778},{"name":"British thermal unit","conversion":0.000947817},{"name":"US therm","conversion":0.0000000094804}]

class DropDown {
  DropDown({
      List<Length>? length, 
      List<Area>? area, 
      List<Volume>? volume, 
      List<Mass>? mass, 
      List<Time>? time, 
      List<DigitalStorage>? digitalStorage, 
      List<Energy>? energy,}){
    _length = length;
    _area = area;
    _volume = volume;
    _mass = mass;
    _time = time;
    _digitalStorage = digitalStorage;
    _energy = energy;
}

  DropDown.fromJson(dynamic json) {
    if (json['Length'] != null) {
      _length = [];
      json['Length'].forEach((v) {
        _length?.add(Length.fromJson(v));
      });
    }
    if (json['Area'] != null) {
      _area = [];
      json['Area'].forEach((v) {
        _area?.add(Area.fromJson(v));
      });
    }
    if (json['Volume'] != null) {
      _volume = [];
      json['Volume'].forEach((v) {
        _volume?.add(Volume.fromJson(v));
      });
    }
    if (json['Mass'] != null) {
      _mass = [];
      json['Mass'].forEach((v) {
        _mass?.add(Mass.fromJson(v));
      });
    }
    if (json['Time'] != null) {
      _time = [];
      json['Time'].forEach((v) {
        _time?.add(Time.fromJson(v));
      });
    }
    if (json['Digital Storage'] != null) {
      _digitalStorage = [];
      json['Digital Storage'].forEach((v) {
        _digitalStorage?.add(DigitalStorage.fromJson(v));
      });
    }
    if (json['Energy'] != null) {
      _energy = [];
      json['Energy'].forEach((v) {
        _energy?.add(Energy.fromJson(v));
      });
    }
  }
  List<Length>? _length;
  List<Area>? _area;
  List<Volume>? _volume;
  List<Mass>? _mass;
  List<Time>? _time;
  List<DigitalStorage>? _digitalStorage;
  List<Energy>? _energy;

  List<Length>? get length => _length;
  List<Area>? get area => _area;
  List<Volume>? get volume => _volume;
  List<Mass>? get mass => _mass;
  List<Time>? get time => _time;
  List<DigitalStorage>? get digitalStorage => _digitalStorage;
  List<Energy>? get energy => _energy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_length != null) {
      map['Length'] = _length?.map((v) => v.toJson()).toList();
    }
    if (_area != null) {
      map['Area'] = _area?.map((v) => v.toJson()).toList();
    }
    if (_volume != null) {
      map['Volume'] = _volume?.map((v) => v.toJson()).toList();
    }
    if (_mass != null) {
      map['Mass'] = _mass?.map((v) => v.toJson()).toList();
    }
    if (_time != null) {
      map['Time'] = _time?.map((v) => v.toJson()).toList();
    }
    if (_digitalStorage != null) {
      map['Digital Storage'] = _digitalStorage?.map((v) => v.toJson()).toList();
    }
    if (_energy != null) {
      map['Energy'] = _energy?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Joule"
/// conversion : 1.0
/// base_unit : true

class Energy {
  Energy({
      String? name, 
      double? conversion, 
      bool? baseUnit,}){
    _name = name;
    _conversion = conversion;
    _baseUnit = baseUnit;
}

  Energy.fromJson(dynamic json) {
    _name = json['name'];
    _conversion = json['conversion'];
    _baseUnit = json['base_unit'];
  }
  String? _name;
  double? _conversion;
  bool? _baseUnit;

  String? get name => _name;
  double? get conversion => _conversion;
  bool? get baseUnit => _baseUnit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['conversion'] = _conversion;
    map['base_unit'] = _baseUnit;
    return map;
  }

}

/// name : "Megabyte"
/// conversion : 1.0
/// base_unit : true

class DigitalStorage {
  DigitalStorage({
      String? name, 
      double? conversion, 
      bool? baseUnit,}){
    _name = name;
    _conversion = conversion;
    _baseUnit = baseUnit;
}

  DigitalStorage.fromJson(dynamic json) {
    _name = json['name'];
    _conversion = json['conversion'];
    _baseUnit = json['base_unit'];
  }
  String? _name;
  double? _conversion;
  bool? _baseUnit;

  String? get name => _name;
  double? get conversion => _conversion;
  bool? get baseUnit => _baseUnit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['conversion'] = _conversion;
    map['base_unit'] = _baseUnit;
    return map;
  }

}

/// name : "Second"
/// conversion : 1.0
/// base_unit : true

class Time {
  Time({
      String? name, 
      double? conversion, 
      bool? baseUnit,}){
    _name = name;
    _conversion = conversion;
    _baseUnit = baseUnit;
}

  Time.fromJson(dynamic json) {
    _name = json['name'];
    _conversion = json['conversion'];
    _baseUnit = json['base_unit'];
  }
  String? _name;
  double? _conversion;
  bool? _baseUnit;

  String? get name => _name;
  double? get conversion => _conversion;
  bool? get baseUnit => _baseUnit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['conversion'] = _conversion;
    map['base_unit'] = _baseUnit;
    return map;
  }

}

/// name : "Kilogram"
/// conversion : 1.0
/// base_unit : true

class Mass {
  Mass({
      String? name, 
      double? conversion, 
      bool? baseUnit,}){
    _name = name;
    _conversion = conversion;
    _baseUnit = baseUnit;
}

  Mass.fromJson(dynamic json) {
    _name = json['name'];
    _conversion = json['conversion'];
    _baseUnit = json['base_unit'];
  }
  String? _name;
  double? _conversion;
  bool? _baseUnit;

  String? get name => _name;
  double? get conversion => _conversion;
  bool? get baseUnit => _baseUnit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['conversion'] = _conversion;
    map['base_unit'] = _baseUnit;
    return map;
  }

}

/// name : "Cubic meter"
/// conversion : 1.0
/// base_unit : true

class Volume {
  Volume({
      String? name, 
      double? conversion, 
      bool? baseUnit,}){
    _name = name;
    _conversion = conversion;
    _baseUnit = baseUnit;
}

  Volume.fromJson(dynamic json) {
    _name = json['name'];
    _conversion = json['conversion'];
    _baseUnit = json['base_unit'];
  }
  String? _name;
  double? _conversion;
  bool? _baseUnit;

  String? get name => _name;
  double? get conversion => _conversion;
  bool? get baseUnit => _baseUnit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['conversion'] = _conversion;
    map['base_unit'] = _baseUnit;
    return map;
  }

}

/// name : "Meter squared"
/// conversion : 1.0
/// base_unit : true

class Area {
  Area({
      String? name, 
      double? conversion, 
      bool? baseUnit,}){
    _name = name;
    _conversion = conversion;
    _baseUnit = baseUnit;
}

  Area.fromJson(dynamic json) {
    _name = json['name'];
    _conversion = json['conversion'];
    _baseUnit = json['base_unit'];
  }
  String? _name;
  double? _conversion;
  bool? _baseUnit;

  String? get name => _name;
  double? get conversion => _conversion;
  bool? get baseUnit => _baseUnit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['conversion'] = _conversion;
    map['base_unit'] = _baseUnit;
    return map;
  }

}

/// name : "Meter"
/// conversion : 1.0
/// base_unit : true

class Length {
  Length({
      String? name, 
      double? conversion, 
      bool? baseUnit,}){
    _name = name;
    _conversion = conversion;
    _baseUnit = baseUnit;
}

 factory Length.fromJson(dynamic json) {
    return Length(name :json['name'],
        conversion : json['conversion'],
        baseUnit : json['base_unit']);

  }
  String? _name;
  double? _conversion;
  bool? _baseUnit;

  String? get name => _name;
  double? get conversion => _conversion;
  bool? get baseUnit => _baseUnit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['conversion'] = _conversion;
    map['base_unit'] = _baseUnit;
    return map;
  }

}