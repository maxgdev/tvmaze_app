import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the Debug banner
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Can't call async function directly within initState
    getShows();
  }

  void getShows() async {
    await GetHttpData.getShows();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Query TVMaze.com ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text('Makes a call to tvmaze api using http plugin.'),
          ],
        ),
      ),
    );
  }
}

class GetHttpData {
  static Future<dynamic> getShows() async {
    var url = "https://api.tvmaze.com/search/shows?q=vikings";

    http.Response response = await http.get(url);
    var responseData = convert.jsonDecode(response.body) as List;
    var shows =
        responseData.map((json) => SearchShow.fromJson(json).show).toList();
    print(shows);
    // print("===============================================================");
    print("Number of shows ${shows.length}");
    return shows;
  }
}
