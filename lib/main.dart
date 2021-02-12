import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the Debug banner
      debugShowCheckedModeBanner: false,
      title: 'Flutter TVMaze App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter TVMaze App'),
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
  List<Show> shows = [];
  @override
  void initState() {
    super.initState();
    // Can't call async function directly within initState
    getShows();
  }

  void getShows() async {
    final showData = await GetHttpData.getShows();
    setState(() {
      shows = showData;
    });
  }

  Widget showTile(show) {
    return ListTile(
      leading: Icon(Icons.movie, color: Colors.blue[200]),
      title: Text(show.name),
      subtitle: Text("${show.summary}"),
      trailing: Column(
        children: [
          Text("${show.rating.average}"),
          Icon(Icons.favorite, color: Colors.red[200]),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Query TVMaze.com ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Column(
                children: shows.map((e) => showTile(e)).toList(),
                
              ),
            ],
          ),
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
    return shows;
  }
}
