import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

const URL = 'http://worldtimeapi.org/api/timezone/';

class WorldTime {
  String area = '';
  String location = '';
  String url = '';
  String dateTime = '';
  String flag = '';

  WorldTime({required this.area, required this.location});

  Future<void> getTime() async {
    url = URL + area + '/' + location;
    try {
      Response response = await get(Uri.parse(url));
      Map data = jsonDecode(response.body);

      dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      dateTime = DateFormat.jm().format(now);
    } catch (error) {
      // print(error);
      dateTime = 'Can not get the time!';
    }
  }
}
