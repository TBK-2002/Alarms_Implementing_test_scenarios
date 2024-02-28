import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ieee_playground/widgets/clock_tile.dart';

int? selectedhour, selectedMinute;

class AddAlarmWidget extends StatefulWidget {
  final handler;

  AddAlarmWidget({super.key, required this.handler});

  @override
  State<AddAlarmWidget> createState() => _AddAlarmWidgetState();
}

class _AddAlarmWidgetState extends State<AddAlarmWidget> {
  bool currentVal = false;
  int _myVal = 0;
  int hour =
      DateTime.now().hour > 12 ? DateTime.now().hour - 12 : DateTime.now().hour;
  int minute = DateTime.now().minute;
  int AMPM = DateTime.now().hour > 12 ? 1 : 0;
  TextEditingController _labelController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    selectedhour = hour;
    selectedMinute = minute;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        centerTitle: true,
        title: const Text('Add Alarm'),
        leading: TextButton(
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.orange),
          ),
          onPressed: () {
            navigator.pop();
          },
        ),
        actions: [
          TextButton(
              onPressed: () {
                String sHour = hour.toString();
                String sMinute = minute.toString();
                sHour.length == 1 ? sHour = '0$sHour' : sHour;
                sMinute.length == 1 ? sMinute = '0$sMinute' : sMinute;
                // setState(() {
                //   String sHour = hour.toString();
                //   String sMinute = minute.toString();
                //   sHour.length == 1 ? sHour = '0$sHour' : sHour;
                //   sMinute.length == 1 ? sMinute = '0$sMinute' : sMinute;
                //   // clocks.add(ClockTile(clock: '$sHour:$sMinute'));
                // });
                widget.handler(ClockTile(clock: '$sHour:$sMinute'));
                navigator.pop();
                //navigator.pushNamed('/alarm_screen');
              },
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.orange),
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            /// TODO: here we should add the time picker.
            Container(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                          initialItem: DateTime.now().hour - 1),
                      looping: true,
                      useMagnifier: true,
                      itemExtent: 32.0,
                      onSelectedItemChanged: (int selected) {
                        setState((() {
                          hour = selected + 1;
                          selectedhour = hour;
                        }));
                      },
                      children: List<Widget>.generate(12, (index) {
                        return Center(
                          child: Text('${index + 1}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20)),
                        );
                      }),
                    ),
                  ),
                  Expanded(
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                          initialItem: DateTime.now().minute - 1),
                      looping: true,
                      useMagnifier: true,
                      itemExtent: 32.0,
                      onSelectedItemChanged: (int selected) {
                        setState((() {
                          minute = selected + 1;
                          selectedMinute = minute;
                        }));
                      },
                      children: List<Widget>.generate(60, (index) {
                        return Center(
                          child: Text('${index + 1}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20)),
                        );
                      }),
                    ),
                  ),
                  Expanded(
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                          initialItem: DateTime.now().hour > 12 ? 1 : 0),
                      useMagnifier: true,
                      itemExtent: 32.0,
                      onSelectedItemChanged: (int selected) {
                        setState((() {
                          AMPM = selected;
                        }));
                      },
                      children: [
                        Center(
                          child: Text('AM',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        Center(
                          child: Text('PM',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: CupertinoColors.darkBackgroundGray,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Repeat',
                          style:
                              TextStyle(color: Colors.grey[200], fontSize: 16),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: DropdownButton(
                              dropdownColor: CupertinoColors.darkBackgroundGray,
                              value: _myVal,
                              items: [
                                DropdownMenuItem(
                                  value: 0,
                                  child: const Text('Never',
                                      style: TextStyle(color: Colors.grey)),
                                  onTap: () {},
                                ),
                                DropdownMenuItem(
                                  value: 1,
                                  child: const Text('Every Saturday',
                                      style: TextStyle(color: Colors.grey)),
                                  onTap: () {},
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: const Text('Every Saturday',
                                      style: TextStyle(color: Colors.grey)),
                                  onTap: () {},
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: const Text('Every Saturday',
                                      style: TextStyle(color: Colors.grey)),
                                  onTap: () {},
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: const Text('Every Sunday',
                                      style: TextStyle(color: Colors.grey)),
                                  onTap: () {},
                                ),
                                DropdownMenuItem(
                                  value: 5,
                                  child: const Text('Every Monday',
                                      style: TextStyle(color: Colors.grey)),
                                  onTap: () {},
                                ),
                                DropdownMenuItem(
                                  value: 6,
                                  child: const Text('Every Tuesday',
                                      style: TextStyle(color: Colors.grey)),
                                  onTap: () {},
                                ),
                                DropdownMenuItem(
                                  value: 7,
                                  child: const Text('Every Wednesday',
                                      style: TextStyle(color: Colors.grey)),
                                  onTap: () {},
                                ),
                                DropdownMenuItem(
                                  value: 8,
                                  child: const Text('Every Thursday',
                                      style: TextStyle(color: Colors.grey)),
                                  onTap: () {},
                                ),
                                DropdownMenuItem(
                                  value: 9,
                                  child: const Text('Every Friday',
                                      style: TextStyle(color: Colors.grey)),
                                  onTap: () {},
                                ),
                              ],
                              onChanged: (val) {
                                setState(() {
                                  _myVal = val as int;
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: CupertinoColors.darkBackgroundGray,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Label',
                          style:
                              TextStyle(color: Colors.grey[200], fontSize: 16),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            controller: _labelController,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              hintText: 'Add label',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: CupertinoColors.darkBackgroundGray,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Snooze',
                          style:
                              TextStyle(color: Colors.grey[200], fontSize: 16),
                        ),
                        SizedBox(
                          // width: MediaQuery.of(context).size.width * 0.4,
                          child: CupertinoSwitch(
                            trackColor: Colors.grey,
                            activeColor: Colors.green,
                            onChanged: (value) {
                              /// TODO: here we should send notification to the user
                              /// when the time is same as the time he set.
                              setState(() {
                                currentVal = value;
                              });
                            },
                            value: currentVal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
