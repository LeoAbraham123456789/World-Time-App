import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;//location name for the ui
  late String time;//time in that location
  String flag;//url to an asset flag icon
  String url;//location url for api endpoint
  late bool isDayTime;//to know whether it is day or night

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async
  {
    try{
      //make the request
      Response response=await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data= jsonDecode(response.body);

      //get properties from data
      String datetime=data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create datetime object
      DateTime now= DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime= now.hour>6 && now.hour<19 ? true : false;
      //set time property
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caugth error: $e');
      time='not able to find time';
    }
  }
}
