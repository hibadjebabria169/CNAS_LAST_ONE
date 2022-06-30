import 'package:http/http.dart';

final url = "htppppslsds";

void postData() async {
  final response = await post(Uri.parse(url), body: {
    'idrdv': '1',
    'daterdv': '16-09-2019',
    'idoperateur': '1',
    'nss': 'nss',
    'typerdv': 'rdv',
    'longdep': '37.42796133580664',
    'longdes': 'lang',
    'latdep': '-122.085749655962',
    'latdes': 'lat'
  });
}
