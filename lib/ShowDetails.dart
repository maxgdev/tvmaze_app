import 'package:flutter/material.dart';
import 'model.dart';

class ShowDetails extends StatelessWidget {

  final Show show;

  // receive data from the FirstScreen as a parameter
  ShowDetails({Key key, @required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Text(show.name),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child:  Image.network(show.showImage.original),                
              ),
              Text(show.summary),
              Text(show.officialSite),
              Text("${show.type}"),
              Text("${show.rating.average}"),
            ],
          ),
        ),
      ),
    );

  }
}
