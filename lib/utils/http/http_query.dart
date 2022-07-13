import 'dart:convert';

import 'package:http/http.dart' as http;

enum protocolType {
  http,
  https,
}

enum queryType {
  post,
  get,
  delete,
  put,
  patch,
  read,
  head,
}

class HttpQuery {
  static String _port = "";
  static String _ip = "";
  static String _path = "";
  static Map<String, String> _headers = {};
  static Object? _body;
  static Map<String, String> _coockies = {};
  static String _protocol = "";
  static bool _isSecure = false;
  late http.Response _response;
  late String _responseString;

  set port(String port) => _port = port;
  set ip(String ip) => _ip = ip;
  set path(String path) => _path = path;
  set header(Map<String, String> header) => _headers = header;
  set coockie(Map<String, String> coockie) => _coockies = coockie;
  set body(Object body) => _body = body;
  set protocol(String protocol) => _protocol = protocol.toLowerCase();
  set isSecure(bool isSecure) => _isSecure = isSecure;

  http.Response get responce {
    return _response;
  }

  String get responceString {
    return _responseString;
  }

  Uri get uri {
    String url = "";
    if (_isSecure) {
      url += "https://";
    } else {
      url += "http://";
    }
    url += _ip;
    if (_port != "") {
      url += ":" + _port + "/";
    }
    url += _path;
    return Uri.parse(url);
  }

  Map<String, String> get header {
    if (_coockies.isNotEmpty) {
      _headers["Cookie"] = stringifyCookies(_coockies);
    }
    return _headers;
  }

  Encoding? get enc {
    return Encoding.getByName("utf-8");
  }

  HttpQuery addHeaderKV(String key, String value) {
    _headers[key] = value;
    return this;
  }

  HttpQuery addHeaderMap(Map<String, String> header) {
    for (var item in header.entries) {
      _headers[item.key] = item.value;
    }
    return this;
  }

  HttpQuery addCoockieKV(String key, String value) {
    _coockies[key] = value;
    return this;
  }

  HttpQuery addCoockieMap(Map<String, String> coockie) {
    for (var item in coockie.entries) {
      _coockies[item.key] = item.value;
    }
    return this;
  }

  HttpQuery(
      {String? ip,
      String? port,
      String? path,
      Map<String, String>? header,
      Map<String, String>? coockie,
      Object? body,
      String? protocol,
      bool? isSecure}) {
    if (ip != null) {
      _ip = ip;
    }
    if (port != null) {
      _port = port;
    }
    if (path != null) {
      _path = path;
    }
    if (header != null) {
      _headers = header;
    }
    if (coockie != null) {
      _coockies = coockie;
    }
    if (body != null) {
      _body = body;
    }
    if (protocol != null) {
      _protocol = protocol;
    }
    if (isSecure != null) {
      _isSecure = isSecure;
    }
  }

  Future<http.Response?> exec() async {
    switch (_protocol) {
      case "post":
        _response =
            await http.post(uri, headers: header, body: _body, encoding: enc);
        return _response;
      case "get":
        _response = await http.get(uri, headers: header);
        return _response;
      case "put":
        _response =
            await http.post(uri, headers: header, body: _body, encoding: enc);
        return _response;
      case "delete":
        _response =
            await http.delete(uri, headers: header, body: _body, encoding: enc);
        return _response;
      case "patch":
        _response =
            await http.patch(uri, headers: header, body: _body, encoding: enc);
        return _response;
      case "read":
        _responseString = await http.read(uri, headers: header);
        return null;
      case "head":
        _response = await http.head(uri, headers: header);
        return _response;
      default:
        _response = await http.get(uri, headers: header);
        return _response;
    }
  }
}

String stringifyCookies(Map<String, String> cookies) =>
    cookies.entries.map((e) => '${e.key}=${e.value}').join('; ');
