import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'mytxtfield.dart';
import 'result.dart';

const String url = "http://debjyoti2019.pythonanywhere.com/rspeed/api/rspeed/";

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String toughness;
  String typeofsub;
  String syllabuslength;
  String studytype;
  String interest;
  String supportingknowledge;
  String currstatus;
  String noofrevison;
  String checkinglevel;
  String name;
  String subject;
  String avrgetym;
  String desiredper;
  String prevmarks;
  String asper;
  String result;
  String curentcompleted;
  bool isloading = false;
  var decoded;
  //17 fields
  var _toughness = [
    "Easy",
    "Medium",
    "Hard",
  ];
  // var _toughness = [
  //     "Easy",
  //     "Medium",
  //     "Hard",
  //   ];
  var _typeofsub = [
    "Theoritical",
    "Practical",
    "Numerical",
    "Other",
  ];
  var _syllabuslength = [
    "Short",
    "Medium (400+ pages)",
    "Lengthy (600+ pages)",
    "Very Lengthy (800+ pages)"
  ];
  var _readingtype = [
    "Notes",
    "Book",
    "Video",
    "Multiple",
  ];

  var _interest = [
    "Very Interesting",
    "Interesting",
    "Normal",
    "Boring",
  ];

  var _supportKnowledge = [
    "Expert",
    "Intermediate",
    "Beginner",
    "None",
  ];

  var _checklevel = [
    "Lenient",
    "Normal",
    "Strict",
  ];
  var __norevison = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  var _currentPercentage = [
    '10',
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
    '80',
    '90',
    '100',
  ];

  postReq(Map<String, String> bodyof) async {
    var jsonbody = json.encode(bodyof);
    print(jsonbody);
    http.Response response = await http.post(
      url,
      body: bodyof,
    );

    if (response.statusCode == 200) {
      setState(() {
        decoded = jsonDecode(response.body);
      });
      result = decoded["Hours"][0].toString();
      print("-------------------" + result + "----------------");
    } else {
      setState(() {
        isloading = false;
      });
      AlertDialog(
        content: Text("${response.statusCode}"),
        title: Text("Please try Again"),
        actions: <Widget>[
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
      var code = response.statusCode;
      result = """Error number - $code  s
                   Please retry""";
      print(response.statusCode);
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: isloading
            ? Center(
                child: RefreshProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      label: "Name",
                      icon: FontAwesomeIcons.userAlt,
                      onChanged: (String value) {
                        setState(() {
                          name = value;
                          print(value);
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                      label: "Subject",
                      icon: FontAwesomeIcons.book,
                      onChanged: (String value) {
                        setState(() {
                          subject = value;
                          print(value);
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              toughness = value;
                              print(toughness);
                            });
                          },
                          icon: Icon(FontAwesomeIcons.angleDown),
                          items: _toughness.map(
                            (String dropDownStringToughness) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringToughness,
                                child: Text(dropDownStringToughness),
                              );
                            },
                          ).toList(),
                          value: toughness,
                          hint: Text("Select Toughness"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              typeofsub = value;
                              print(typeofsub);
                            });
                          },
                          icon: Icon(FontAwesomeIcons.angleDown),
                          items: _typeofsub.map(
                            (String dropDownStringToughness) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringToughness,
                                child: Text(dropDownStringToughness),
                              );
                            },
                          ).toList(),
                          value: typeofsub,
                          hint: Text("Type Of Subject"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              syllabuslength = value;
                              print(syllabuslength);
                            });
                          },
                          icon: Icon(FontAwesomeIcons.angleDown),
                          items: _syllabuslength.map(
                            (String dropDownStringToughness) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringToughness,
                                child: Text(dropDownStringToughness),
                              );
                            },
                          ).toList(),
                          value: syllabuslength,
                          hint: Text("Syllabus Length"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              studytype = value;
                              print(studytype);
                            });
                          },
                          icon: Icon(FontAwesomeIcons.angleDown),
                          items: _readingtype.map(
                            (String dropDownStringToughness) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringToughness,
                                child: Text(dropDownStringToughness),
                              );
                            },
                          ).toList(),
                          value: studytype,
                          hint: Text("Preferred Study Type"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              interest = value;
                              print(interest);
                            });
                          },
                          icon: Icon(FontAwesomeIcons.angleDown),
                          items: _interest.map(
                            (String dropDownStringToughness) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringToughness,
                                child: Text(dropDownStringToughness),
                              );
                            },
                          ).toList(),
                          value: interest,
                          hint: Text("Interest Level"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              supportingknowledge = value;
                              print(supportingknowledge);
                            });
                          },
                          icon: Icon(FontAwesomeIcons.angleDown),
                          items: _supportKnowledge.map(
                            (String dropDownStringToughness) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringToughness,
                                child: Text(dropDownStringToughness),
                              );
                            },
                          ).toList(),
                          value: supportingknowledge,
                          hint: Text("Supporting Knowledge"),
                        ),
                      ),
                    ),
                    MyTextField(
                      label: "Average Time Reading per page",
                      icon: FontAwesomeIcons.clock,
                      onChanged: (String value) {
                        setState(() {
                          avrgetym = value;
                          print(value);
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              currstatus = value.toString();
                              // curentcompleted =
                              print(currstatus);
                            });
                          },
                          icon: Icon(FontAwesomeIcons.angleDown),
                          items: _currentPercentage.map(
                            (String dropDownStringToughness) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringToughness,
                                child: Text(dropDownStringToughness),
                              );
                            },
                          ).toList(),
                          value: currstatus,
                          hint: Text("Current Status in %"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              noofrevison = value.toString();
                              print(noofrevison);
                            });
                          },
                          icon: Icon(FontAwesomeIcons.angleDown),
                          items: __norevison.map(
                            (String dropDownStringToughness) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringToughness,
                                child: Text(dropDownStringToughness),
                              );
                            },
                          ).toList(),
                          value: noofrevison,
                          hint: Text("No of Revision"),
                        ),
                      ),
                    ),
                    MyTextField(
                      label: "Desired Percentage",
                      icon: FontAwesomeIcons.percentage,
                      onChanged: (String value) {
                        setState(() {
                          desiredper = value.toString();
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            setState(() {
                              checkinglevel = value;
                              print(checkinglevel);
                            });
                          },
                          icon: Icon(FontAwesomeIcons.angleDown),
                          items: _checklevel.map(
                            (String dropDownStringToughness) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringToughness,
                                child: Text(dropDownStringToughness),
                              );
                            },
                          ).toList(),
                          value: checkinglevel,
                          hint: Text("Checking Level"),
                        ),
                      ),
                    ),
                    MyTextField(
                      label: "PREVIOUS MARKS",
                      hinttext:
                          "Enter Previous Marks in Same or Similar Subject",
                      icon: FontAwesomeIcons.chevronCircleLeft,
                      onChanged: (String value) {
                        setState(() {
                          prevmarks = value.toString();
                        });
                      },
                    ),
                    MyTextField(
                      label: "NO OF HOURS REQUIRED",
                      hinttext:
                          "NO OF HOURS REQUIRED AS PER YOU TO COMPLETE SYLLABUS",
                      icon: FontAwesomeIcons.clock,
                      onChanged: (String value) {
                        setState(() {
                          asper = value.toString();
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 20),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        elevation: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.book,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "CALCULATE",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        color: Colors.blueGrey,
                        onPressed: () {
                          int curstat = (int.parse(currstatus));
                          var compercen = (curstat ~/ 10);
                          curentcompleted = (compercen).toString();

                          Map<String, String> body = {
                            "STUDENT_NAME": "$name",
                            "SUBJECT_NAME": "$subject",
                            "TOUGHNESS_LEVEL": "$toughness",
                            "TYPE_OF": "$typeofsub",
                            "SUBJECT_SYLLABUS": "$syllabuslength",
                            "PREFERRED_READING": "$studytype",
                            "INTEREST_LEVEL": "$interest",
                            "SUPPORTING_KNOWLEDGE": "$supportingknowledge",
                            "AVERAGE_READING": "$avrgetym",
                            "CURRENT_STATUS": "$curentcompleted",
                            "NUMBER_OF": "$noofrevison",
                            "DESIRED_NUMBER": "$desiredper",
                            "CHECKING_LEVEL": "$checkinglevel",
                            "MARKS_IN": "$prevmarks",
                            "AS_PER": "$asper"
                          };
                          postReq(body);

                          if (decoded != null) {
                            setState(() {
                              isloading = false;
                            });

                            if (decoded['status'] == 'Success') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Result(
                                    responsedata: decoded,
                                  ),
                                ),
                              );
                            }
                          } else {
                            
                            setState(() {
                              isloading = true;
                            });
                            // RefreshProgressIndicator();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
