import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Result extends StatefulWidget {
  var responsedata;
  Result({this.responsedata});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  bool hasdata = false;

  @override
  Widget build(BuildContext context) {
    if (widget.responsedata['status'] == 'Success') {
      return Scaffold(
        appBar: AppBar(
          title: Text("404 Error"),
          elevation: 10,
          centerTitle: true,
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent.shade100,
          title: Text("Results"),
          centerTitle: true,
          elevation: 10,
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.infoCircle),
              onPressed: () {
                Navigator.pushNamed(context, "/about");
              },
              color: Colors.white.withOpacity(0.7),
            )
          ],
        ),
        body: Container(
          child: Center(child: Text("${widget.responsedata['Hours'][0]}")),
        ),
      );
    }
  }
}
