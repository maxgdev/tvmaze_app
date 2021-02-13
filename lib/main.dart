import 'package:flutter/material.dart';
import './model.dart';
import 'ShowTile.dart';
import 'GetHttpData.dart';
import 'ShowDetails.dart';

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: shows.length,
        itemBuilder: (context, index) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: shows.map((e) => showTile(context, e)).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

