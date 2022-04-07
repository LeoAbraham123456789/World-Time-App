import 'package:flutter/material.dart';
import 'package:myappflutter/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Berlin', flag: 'Germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'Chicago', flag: 'America.png', url: 'America/Chicago'),
    WorldTime(location: 'Cairo', flag: 'Egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'London', flag: 'England.png', url: 'Europe/London'),
];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation:0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('Images/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
