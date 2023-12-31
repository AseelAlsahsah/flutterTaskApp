import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  late String location; //location name for the UI
  late String time; //time for that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try{
      //make request
      Uri urlUri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(urlUri);

      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      time = DateFormat.jm().format(now); // to be more human readable
    }catch(e){
      print("caught error: $e");
      time = "could not get time data";
    }

  }
}
