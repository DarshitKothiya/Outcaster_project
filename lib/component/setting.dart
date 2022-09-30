import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/global.dart';

class settingpage extends StatefulWidget {
  const settingpage({Key? key}) : super(key: key);

  @override
  State<settingpage> createState() => _settingpageState();
}

class _settingpageState extends State<settingpage> {
  DateTime initialDate = DateTime.now();
  TimeOfDay initialTime = TimeOfDay.now();
  String selectDate = '';
  String selectMonth = '';
  String selectTime = '';
  String selectHour = '';

  TextStyle titelstyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: Colors.blueGrey);

  @override
  initState() {
    super.initState();

    if (initialDate.month == 1) {
      selectMonth = 'January';
    } else if (initialDate.month == 2) {
      selectMonth = 'February';
    } else if (initialDate.month == 3) {
      selectMonth = 'March';
    } else if (initialDate.month == 4) {
      selectMonth = 'April';
    } else if (initialDate.month == 5) {
      selectMonth = 'May';
    } else if (initialDate.month == 6) {
      selectMonth = 'June';
    } else if (initialDate.month == 7) {
      selectMonth = 'July';
    } else if (initialDate.month == 8) {
      selectMonth = 'August';
    } else if (initialDate.month == 9) {
      selectMonth = 'September';
    } else if (initialDate.month == 10) {
      selectMonth = 'October';
    } else if (initialDate.month == 11) {
      selectMonth = 'November';
    } else if (initialDate.month == 12) {
      selectMonth = 'December';
    }

    selectDate = '${initialDate.day} ${selectMonth}, ${initialDate.year}';

    if (initialTime.hour > 12) {
      selectHour = '${initialTime.hour - 12}';
    }

    selectTime =
        '${selectHour}:${initialTime.minute}:${initialDate.second} ${initialTime.period.name}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Date',
                style: titelstyle,
              ),
              const Spacer(),
              Text(
                selectDate,
                style: titelstyle,
              )
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                (Global.isIos==false)?androidDatepicker():iosDatepicker();
              },
              child: const Text('Change Date'),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text(
                'Time',
                style: titelstyle,
              ),
              const Spacer(),
              Text(
                selectTime,
                style: titelstyle,
              )
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  androidTimepicker();
                },
                child: const Text('Change Time'),
              )),
        ],
      ),
    );
  }

  androidDatepicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      builder: (BuildContext context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.blueGrey, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.blueGrey, // button text color
                ),
              ),
            ),
            child: child!);
      },
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    setState(() {
      if (pickedDate != null) {
        if (pickedDate.month == 1) {
          selectMonth = 'January';
        } else if (pickedDate.month == 2) {
          selectMonth = 'February';
        } else if (pickedDate.month == 3) {
          selectMonth = 'March';
        } else if (pickedDate.month == 4) {
          selectMonth = 'April';
        } else if (pickedDate.month == 5) {
          selectMonth = 'May';
        } else if (pickedDate.month == 6) {
          selectMonth = 'June';
        } else if (pickedDate.month == 7) {
          selectMonth = 'July';
        } else if (pickedDate.month == 8) {
          selectMonth = 'August';
        } else if (pickedDate.month == 9) {
          selectMonth = 'September';
        } else if (pickedDate.month == 10) {
          selectMonth = 'October';
        } else if (pickedDate.month == 11) {
          selectMonth = 'November';
        } else if (pickedDate.month == 12) {
          selectMonth = 'December';
        }

        selectDate = '${pickedDate.day}, $selectMonth, ${pickedDate.year}';
      }
    });
  }

  iosDatepicker() async {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            height: 250,
            width: double.infinity,
            child: CupertinoDatePicker(
              initialDateTime: initialDate,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (val) {
                setState(() {
                  if (val != null) {
                    if (val.month == 1) {
                      selectMonth = 'January';
                    } else if (val.month == 2) {
                      selectMonth = 'February';
                    } else if (val.month == 3) {
                      selectMonth = 'March';
                    } else if (val.month == 4) {
                      selectMonth = 'April';
                    } else if (val.month == 5) {
                      selectMonth = 'May';
                    } else if (val.month == 6) {
                      selectMonth = 'June';
                    } else if (val.month == 7) {
                      selectMonth = 'July';
                    } else if (val.month == 8) {
                      selectMonth = 'August';
                    } else if (val.month == 9) {
                      selectMonth = 'September';
                    } else if (val.month == 10) {
                      selectMonth = 'October';
                    } else if (val.month == 11) {
                      selectMonth = 'November';
                    } else if (val.month == 12) {
                      selectMonth = 'December';
                    }

                    selectDate = '${val.day}, $selectMonth, ${val.year}';
                  }
                });
              },
            ),
          );
        });
  }

  androidTimepicker() async{
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      builder: (BuildContext context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.blueGrey,
                // header background color
                onPrimary: Colors.white,
                // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.blueGrey, // button text color
                ),
              ),
            ),
            child: child!);
      },
      initialTime: initialTime,
    );
    DateTime initialsecond = DateTime.now();

    setState(() {
      if (pickedTime != null) {
        if (pickedTime.hour > 12) {
          selectHour = '${pickedTime.hour - 12}';
        }

        selectTime =
        '${selectHour}:${pickedTime.minute}:${initialsecond.second} ${initialTime.period.name}';
      }
    });
  }

  iosTimepicker() async {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            height: 250,
            width: double.infinity,
            child: CupertinoDatePicker(
              initialDateTime: initialDate,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (val) {
                setState(() {
                  if (val != null) {
                    if (val.month == 1) {
                      selectMonth = 'January';
                    } else if (val.month == 2) {
                      selectMonth = 'February';
                    } else if (val.month == 3) {
                      selectMonth = 'March';
                    } else if (val.month == 4) {
                      selectMonth = 'April';
                    } else if (val.month == 5) {
                      selectMonth = 'May';
                    } else if (val.month == 6) {
                      selectMonth = 'June';
                    } else if (val.month == 7) {
                      selectMonth = 'July';
                    } else if (val.month == 8) {
                      selectMonth = 'August';
                    } else if (val.month == 9) {
                      selectMonth = 'September';
                    } else if (val.month == 10) {
                      selectMonth = 'October';
                    } else if (val.month == 11) {
                      selectMonth = 'November';
                    } else if (val.month == 12) {
                      selectMonth = 'December';
                    }

                    selectDate = '${val.day}, $selectMonth, ${val.year}';
                  }
                });
              },
            ),
          );
        });
  }
}
