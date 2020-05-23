import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhotoStreamer',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PhotoList(),
    );
  }
}

class PhotoList extends StatefulWidget {
  @override
  PhotoListState createState() => PhotoListState();
}}

class PhotoListState extends State<PhotoList> {
  StreamController<Photo> streamController;
  List<Photo> list = [];

  @override
  void initState() {
    super.initState();
    streamController = StreamController.broadcast();
    streamController.stream.listen((p) => setState(() => list.add(p)));
    load(streamController);
  }

  load(StreamController sc) async {
    String url ='https://jsonplaceholder.typicode.com/photos';
    var client = new http.Client();
    var req= new http.Request('get', Uri.parse(url));
    var streamRes.stream.transform(UTF8.decoder).transform(json.decode).expand(e)=>e).map((map)=> Photo.fromJsonMap(map));
  }

}

class Photo {
  final String title;
  final String url;

  Photo.fromJsonMap(Map map)
      : title = map['title'],
        url = map['url'];
}
