import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllResult extends StatefulWidget {
  // AllResult({Key key}) : super(key: key);

  _AllResultState createState() => _AllResultState();
}

class _AllResultState extends State<AllResult> {
  var decoded;
  bool isloding = true;
  getdata() async {
    http.Response response = await http
        .get("http://debjyoti2019.pythonanywhere.com/rspeed/api/rspeed");
    if (response.statusCode == 200) {
      decoded = jsonDecode(response.body);
      setState(() {
        isloding = false;
      });
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Results", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 10,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: isloding
              ? RefreshProgressIndicator()
              : ListView.builder(
                  itemCount: decoded.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                child: Text(
                                  '${index + 1}. ${decoded[index]['STUDENT_NAME']}'
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent.shade100,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                              Text(
                                'Subject - ${decoded[index]['SUBJECT_NAME']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                  'Toughness - ${decoded[index]['TOUGHNESS_LEVEL']}'),
                              Text('Type - ${decoded[index]['TYPE_OF']}'),
                              Text(
                                  'Length of Syllabus - ${decoded[index]['SUBJECT_SYLLABUS']}'),
                              Text(
                                  'Interest Level - ${decoded[index]['INTEREST_LEVEL']}'),
                              Text(
                                  'Your Knowledge - ${decoded[index]['SUPPORTING_KNOWLEDGE']}'),
                              Text(
                                  'Time/page - ${decoded[index]['AVERAGE_READING']}'),
                              Text(
                                  'Current Status - ${decoded[index]['CURRENT_STATUS']}'),
                              Text(
                                  'Revison Required -${decoded[index]['NUMBER_OF']}'),
                              Text(
                                  'Desired Number -${decoded[index]['DESIRED_NUMBER']}'),
                              Text(
                                  'Checking Level -${decoded[index]['CHECKING_LEVEL']}'),
                              Text(
                                  'Previous Marks -${decoded[index]['MARKS_IN']}'),
                              Text(
                                  'Acc. to ${decoded[index]['STUDENT_NAME']} time required - ${decoded[index]['AS_PER']}'),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
