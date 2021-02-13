// import 'dart:js';
// import './model.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_app/ShowDetails.dart';
// import 'package:tvmaze_app/ShowDetails.dart';
import 'ShowDetails.dart';

Widget showTile(BuildContext context, show) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              print('---Details page---');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShowDetails(show: show)),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              // child: Text('show image'),
              child: Image.network(show.showImage.medium),
            ),
          ),
        ),
        Expanded(
            flex: 3,
            child: ListTile(
              // leading: Icon(Icons.movie),
              title: Text(show.name),
              // subtitle: Text("${show.summary}"),
              subtitle: Text(
                show.summary,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              trailing: Column(
                children: [
                  Text("${show.rating.average}"),
                  Icon(Icons.favorite, color: Colors.red[200]),
                ],
              ),
            )),
      ],
    ),
  );
}
