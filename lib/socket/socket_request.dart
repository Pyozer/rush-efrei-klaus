import 'dart:convert';

class SocketRequest<T> {
  String method;
  T data;

  SocketRequest({this.method, this.data});

  factory SocketRequest.fromRawJson(String str) =>
      SocketRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SocketRequest.fromJson(Map<String, dynamic> json) =>
      SocketRequest(method: json["method"], data: json["data"]);

  Map<String, dynamic> toJson() => {"method": method, "data": data};
}
