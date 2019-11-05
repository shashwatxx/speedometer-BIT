import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  int current_step1 = 0;

  int current_step2 = 0;

  List<Step> my_steps1 = [
    Step(
      title: Text("Install Dependencies in \nDjango Project"),
      content: SelectableText("pip install -r requirements.txt"),
      subtitle: Text(
          "after uploading project to server \ncopy below command and\npaste on server"),
      isActive: true,
    ),
    Step(
      title: Text("Migrate Django Project"),
      subtitle: Text("copy below command to do so."),
      content: SelectableText("python manage.py migrate"),
      isActive: true,
    ),
    Step(
      title: Text("Start the server"),
      subtitle: Text("copy below command to start"),
      content: SelectableText("python manage.py runserver"),
      isActive: true,
    ),
    Step(
        title: Text("Copy API Link"),
        subtitle: Text(
            "copy and paste api link into the app to \nlink it to server,currently hosted link\n is provided below"),
        isActive: true,
        content: SelectableText(
            "http://debjyoti2019.pythonanywhere.com/rspeed/api/rspeed/")),
  ];

  List<Step> my_steps2 = [
    Step(
      title: Text("Open flutter project using any IDE"),
      content: Text("Browse  lib/formpage.dart"),
      subtitle: Text("VS code is recommended"),
      isActive: true,
    ),
    Step(
      title: Text("Change URL"),
      subtitle:
          Text("at top you will see \nconst String url = 'default api link' "),
      content: SelectableText("change it to your API link"),
      isActive: true,
    ),
    Step(
      title: Text("To build APK"),
      subtitle: Text("copy below command to build"),
      content: SelectableText("flutter build apk"),
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // final makeListTile = ListTile(
    //     contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    //     leading: Container(
    //       padding: EdgeInsets.only(right: 12.0),
    //       decoration: new BoxDecoration(
    //           border: new Border(
    //               right: new BorderSide(width: 1.0, color: Colors.white24))),
    //       child: Icon(Icons.autorenew, color: Colors.white),
    //     ),
    //     title: Text(
    //       "Introduction to Driving",
    //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    //     ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    //     subtitle: Row(
    //       children: <Widget>[
    //         Icon(Icons.linear_scale, color: Colors.yellowAccent),
    //         Text(" Intermediate", style: TextStyle(color: Colors.white))
    //       ],
    //     ),
    //     trailing:
    //         Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
    // final makeCard = Card(
    //   elevation: 8.0,
    //   margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    //   child: Container(
    //     decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
    //     child: makeListTile,
    //   ),
    // );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: <Widget>[
              Align(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "ABOUT",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 35,
                        fontFamily: "slabo",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '''This project includes the Django API separately \n and the Flutter build. Steps to run each of them \nindividually are given below.Also note that we have\nprovided apk for different architectures as well.\nJust install the apk in any android phone and you're \nready to go.For running the project on any machine \nfollow below steps:-''',
                style: TextStyle(fontSize: 17, fontFamily: "slabo"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment(0, 0),
                  color: Colors.blueGrey,
                  child: Text(
                    "Steps for Server Side Part",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.blueGrey,
                  ),
                  child: Card(
                    child: Stepper(
                      steps: my_steps1,
                      currentStep: this.current_step1,
                      type: StepperType.vertical,
                      onStepTapped: (step) {
                        setState(() {
                          current_step1 = step;
                        });
                      },
                      onStepContinue: () {
                        setState(
                          () {
                            if (current_step1 < my_steps1.length - 1) {
                              current_step1 = current_step1 + 1;
                            } else {
                              current_step1 = 0;
                            }
                          },
                        );
                      },
                      onStepCancel: () {
                        setState(() {
                          if (current_step1 > 0) {
                            current_step1 = current_step1 - 1;
                          } else {
                            current_step1 = 0;
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment(0, 0),
                  color: Colors.blueGrey,
                  child: Text(
                    "Steps for App ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.blueGrey,
                  ),
                  child: Stepper(
                    steps: my_steps2,
                    currentStep: this.current_step2,
                    type: StepperType.vertical,
                    onStepTapped: (step) {
                      setState(() {
                        current_step2 = step;
                      });
                    },
                    onStepContinue: () {
                      setState(
                        () {
                          if (current_step2 < my_steps2.length - 1) {
                            current_step2 = current_step2 + 1;
                          } else {
                            current_step2 = 0;
                          }
                        },
                      );
                    },
                    onStepCancel: () {
                      setState(() {
                        if (current_step2 > 0) {
                          current_step2 = current_step2 - 1;
                        } else {
                          current_step2 = 0;
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
