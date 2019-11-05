import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedometer/about.dart';
import 'package:speedometer/allres.dart';
// import 'package:speedometer/formtry.dart';
// import 'package:speedometer/formtry3.dart';

import 'formpage.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade100,
      body: Container(
        child: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Study \n Speedometer",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "slabo",
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Predicts time required for you to \n achieve your desired result",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "indie",
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => FormPage(),
                            ),
                          );
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(40),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.spotify,
                                  color: Colors.lightBlueAccent.shade100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Know your speed",
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent.shade100,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => About(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.atlassian,
                                size: 10,
                                color: Colors.lightBlueAccent.shade100,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "BOUT",
                                style: TextStyle(
                                    color: Colors.lightBlueAccent.shade100),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AllResult(),
                        ),
                      );
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(40),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 50,
                            ),
                            Icon(
                              FontAwesomeIcons.atlassian,
                              size: 10,
                              color: Colors.lightBlueAccent.shade100,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "ALL RESULTS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.lightBlueAccent.shade100,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
