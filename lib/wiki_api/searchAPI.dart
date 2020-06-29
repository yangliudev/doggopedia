import 'dart:async';
import 'dart:convert';
import 'dart:collection';
import 'package:xml/xml.dart';
import 'package:http/http.dart' as http;

class SearchAPI {

  static Future<http.Response> _searchBy(String searchTerm) async {
    var response = await http.get("https://en.wikipedia.org/w/api.php?action=parse&page=" + searchTerm + "&prop=text&formatversion=2&format=json",
      headers: {
        "Content-type": "application/json"
      }
    );

    return response;
  }

  static Future<XmlDocument> search(String searchTerm) async {
    var response = await _searchBy(searchTerm);

    LinkedHashMap data = json.decode(response.body);

    String xml = data['parse']['text'];

    XmlDocument document = XmlDocument.parse(xml);

    return document;
  }
}