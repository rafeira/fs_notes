class ResponseToken {
  String value;
  ResponseToken({required this.value});
  Map<String, dynamic> toJson() {
    return {'value': value};
  }

  factory ResponseToken.fromJson(Map<String, dynamic> json) {
    return ResponseToken(value: _valueFromJson(json['value']));
  }

  static String _valueFromJson(String? value) {
    if (value == null) throw 'Value can not be null';
    return value;
  }

  static ResponseToken fromHeader(String header) {
    return ResponseToken(value: header.substring(7));
  }
}
