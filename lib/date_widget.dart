/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        margin: EdgeInsets.all(3.0),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //   color: selectionColor,
        // ),
        child: Padding(
          padding: EdgeInsets.all(3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                  new DateFormat("E", locale)
                      .format(date)
                      .toUpperCase()[0], // WeekDay
                  style: dayTextStyle),
              // SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              ),
              Expanded(
                  child: Container(
                      width: width,
                      margin: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20,
                              color: Color(0xffE59999),
                              offset: Offset(0, 3))
                        ],
                        color: selectionColor,
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: selectionColor,
                                // child: CircleAvatar(
                                // backgroundColor: Colors.white,
                                // radius: 16,
                                child: Text(date.day.toString(), // Date
                                    style: dateTextStyle),
                                // ),
                              )
                            ],
                          ))))

              // Text(
              //     new DateFormat("MMM", locale)
              //         .format(date)
              //         .toUpperCase(), // Month
              //     style: monthTextStyle),
            ],
          ),
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(this.date);
        }
      },
    );
  }
}
