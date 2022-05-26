import 'package:dmp/Services/service.dart';
import 'package:http/http.dart' as http;

class RomoteService {
  Future<List<Post>?> getposts() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://vegetablemarketprice.com/api/data/market/dharmapuri/daywise?date=2022-05-24');
    var respons = await client.get(uri);
    if (respons.statusCode == 200) {
      var json = respons.body;
      postFromJson(json);
    } else
      return null;
  }
}
