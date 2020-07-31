import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;

  WorldTime({this.flag, this.location, this.time, this.url});

  Future<void> getTime() async {
    try {
      Response res = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(res.body);

      // get properties from time api
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);

      // creating datetime object
      now = now.add(Duration(hours: int.parse(offset)));
      time = now.toString();
    } catch (e) {
      print('caught error: $e');
      time = 'Could not get time data';
    }
  }
}