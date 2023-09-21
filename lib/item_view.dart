import 'package:flutter/material.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:weekly_scheduler/model/model.dart';

class ItemView extends StatefulWidget {
  DayModel? model;
  ItemView({super.key, this.model});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        // height: 80,
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CheckBoxRounded(
                  // border: Border.all(color: Colors.transparent),
                  size: 25,
                  onTap: (value) {
                    setState(() {
                      widget.model?.dayActive = value!;
                    });
                  },
                  isChecked: widget.model?.dayActive,
                  uncheckedColor: Colors.grey.shade200,
                  checkedColor: Colors.green,
                  uncheckedWidget: Icon(
                    Icons.done,
                    color: Colors.black12,
                    size: 14,
                  ),
                  checkedWidget: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
                //
                SizedBox(
                  width: 50,
                  child: Text(
                    widget.model!.dayName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                widget.model!.dayActive
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          side: BorderSide(
                              color: widget.model!.morningActive
                                  ? Color.fromRGBO(118, 93, 208, 1)
                                  : Colors.grey),
                        ),
                        onPressed: () {
                          //todo
                          setState(() {
                            widget.model?.morningActive =
                                !widget.model!.morningActive;
                          });
                        },
                        child: Text(
                          "Morning",
                          style: TextStyle(
                              color: widget.model!.morningActive
                                  ? Color.fromRGBO(118, 93, 208, 1)
                                  : Colors.grey),
                        ),
                      )
                    : SizedBox(),

                //
                widget.model!.dayActive
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            side: BorderSide(
                              color: widget.model!.afternoonActive
                                  ? Color.fromRGBO(118, 93, 208, 1)
                                  : Colors.grey,
                            )),
                        onPressed: () {
                          setState(() {
                            widget.model?.afternoonActive =
                                !widget.model!.afternoonActive;
                          });
                        },
                        child: Text(
                          "Afternoon",
                          style: TextStyle(
                              color: widget.model!.afternoonActive
                                  ? Color.fromRGBO(118, 93, 208, 1)
                                  : Colors.grey),
                        ),
                      )
                    : SizedBox(),

                //
                widget.model!.dayActive
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            side: BorderSide(
                              color: widget.model!.eveningActive
                                  ? Color.fromRGBO(118, 93, 208, 1)
                                  : Colors.grey,
                            )),
                        onPressed: () {
                          //todo
                          setState(() {
                            widget.model!.eveningActive =
                                !widget.model!.eveningActive;
                          });
                        },
                        child: Text(
                          "Evening",
                          style: TextStyle(
                            color: widget.model!.eveningActive
                                ? Color.fromRGBO(118, 93, 208, 1)
                                : Colors.grey,
                          ),
                        ),
                      )
                    : Text(
                        "UnAvailable",
                        style: TextStyle(color: Colors.grey),
                      ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
    ;
  }
}
