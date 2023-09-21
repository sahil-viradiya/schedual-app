import 'package:flutter/material.dart';

import 'model/model.dart';
import 'schedule_screen.dart';

// ignore: use_key_in_widget_constructors
class LandingPage extends StatefulWidget {
  List<DayModel>? list = [];

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // Variable to track whether a schedule is available
  bool isScheduleAvailable = false;
  String scheduleText = '';
  List dayList = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'];

  List<DayModel> modelList() {
    return dayList.map((e) => DayModel(dayName: e)).toList();
  }

  Function? onSave;

  String logic(List<DayModel> days) {
    String text = "hii you are available on ";

    List<String> textList = [];
    days.forEach((DayModel day) {
      String tempText = "";
      if (day.dayActive &&
          (day.morningActive || day.afternoonActive || day.eveningActive)) {
        tempText = tempText + day.dayName;

        if (day.morningActive && day.afternoonActive && day.eveningActive) {
          tempText = "$tempText whole day ";
        } else {
          String temp2 = "";
          if (day.morningActive) {
            temp2 = temp2 == "" ? " Morning" : "$temp2 and Morning";
          }
          if (day.afternoonActive) {
            temp2 = temp2 == "" ? " Afternoon" : "$temp2 and Afternoon";
          }
          if (day.eveningActive) {
            temp2 = temp2 == "" ? " Evening" : "$temp2 and Evening";
          }

          tempText = tempText + temp2;
        }

        textList.add(tempText);
      }
    });

    if (textList.isNotEmpty) {
      textList.forEach((element) {
        text = text +
            (textList.first == element
                ? ""
                : textList.last == element
                    ? " and "
                    : ",") +
            element +
            (textList.last == element ? "." : "");
      });
    } else {
      return "No schedule available";
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    widget.list ??= modelList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              logic(widget.list!),
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to Scheduling page and pass the update function
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SchedulePage(
                      list: logic(widget.list!) == "No schedule available"
                          ? modelList()
                          : widget.list!,
                      onSave: (newList) {
                        newList.forEach((element) {});
                        setState(() {
                          widget.list = newList;
                        });
                      },
                    ),
                  ),
                );
              },
              child: Text(logic(widget.list!) != "No schedule available"
                  ? 'Edit Schedule'
                  : 'Add Schedule'),
            ),
          ],
        ),
      ),
    );
  }
}
