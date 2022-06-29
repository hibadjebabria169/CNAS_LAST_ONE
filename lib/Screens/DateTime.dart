import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class date_time extends StatefulWidget {
  const date_time({Key? key}) : super(key: key);

  @override
  State<date_time> createState() => _date_timeState();
}

class _date_timeState extends State<date_time> {
  @override
  Widget build(BuildContext context) {
    final format = DateFormat('yyyy-MM-dd HH:mm');
    return Scaffold(
      appBar: AppBar(
        title: Text("Rendez-vous"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.combine(date, time);
                } else {
                  return currentValue;
                }
              }),
        ),
      ),
    );
  }
}
