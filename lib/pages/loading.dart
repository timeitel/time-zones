import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/pages/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');

    // request time from api
    await instance.getTime();
    print(instance.time);

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
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
      body: Padding(padding: EdgeInsets.all(50.0), child: Text('Loading')),
    );
  }
}
