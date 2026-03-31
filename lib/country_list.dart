
// country_list.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> fetchCountries() async {
  final response =
      await http.get(Uri.parse('https://restcountries.com/v3.1/all?fields=name;capital;population'));

  if (response.statusCode == 200) {
    List<dynamic> countriesJson = json.decode(response.body);
    List<String> countryList = countriesJson
        .map((country) => country['name']['common'] as String)
        .toList();
    return countryList;
  } else {
    throw Exception('Failed to load countries');
  }
}
// Future<List<String>> fetchCountries() async {
//   List<String> countries = [
//     'Viet Nam',
//     'Thai Lan',
//   ];

//   return countries;
// }
