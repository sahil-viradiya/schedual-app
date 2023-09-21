// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unused_local_variable, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:weekly_scheduler/item_view.dart';
import 'package:weekly_scheduler/model/model.dart';

class SchedulePage extends StatelessWidget {
  List<DayModel> list;
  Function? onSave;
  SchedulePage({super.key, required this.list, this.onSave});

  // Track the selected slots
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              itemCount: list.length,
              
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ItemView(
                  model: list[index],
                );
              },
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 14),
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(118, 93, 208, 1),
                  ),
                  onPressed: () {
                   
                    //todo
                    onSave!(list);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
