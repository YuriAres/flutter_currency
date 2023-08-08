// ignore_for_file: file_names
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIComunication {
  String urlAPI = "https://api.hgbrasil.com/finance?key=dd4425d8";

  void teste() async {
    http.Response response = await http.get(Uri.parse(urlAPI));
    print(response.body);
    print(json.decode(response.body)["results"]["currencies"]["USD"]["buy"]);
  }

  Future<Map> getData() async {
    http.Response response = await http.get(Uri.parse(urlAPI));
    return json.decode(response.body);
  }
}
