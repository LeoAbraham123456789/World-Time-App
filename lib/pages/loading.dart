import 'package:flutter/material.dart';
import 'package:myappflutter/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instancy = WorldTime(
        location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');
    await instancy.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instancy.location,
      'time': instancy.time,
      'flag': instancy.flag,
      'isDayTime': instancy.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
