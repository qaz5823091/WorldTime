import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<WorldTime> data = [];

  @override
  void initState() {
    super.initState();
    data.add(WorldTime(area: 'Asia', location: 'Taipei'));
    data.add(WorldTime(area: 'America', location: 'New_York'));
    data.add(WorldTime(area: 'Europe', location: 'Moscow'));
    data.add(WorldTime(area: 'Africa', location: 'Johannesburg'));
    data.add(WorldTime(area: 'Atlantic', location: 'Stanley'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World Time'),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, index) {
            return SafeArea(
              key: Key(data[index].location),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: ListTile(
                  title: Text(
                    data[index].location,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: Text(data[index].area),
                  onTap: () async {
                    await data[index].getTime();
                    Navigator.pushNamed(context, '/show_time', arguments: {
                      'area': data[index].area,
                      'location': data[index].location,
                      'dateTime': data[index].dateTime,
                    });
                  },
                ),
              ),
            );
          }),
    );
  }
}
