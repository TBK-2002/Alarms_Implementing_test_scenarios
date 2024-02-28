import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ieee_playground/widgets/clock_tile.dart';

bool flag = false;

List<ClockTile> clocks = [
  ClockTile(clock: '00:00'),
  ClockTile(clock: '12:42'),
  ClockTile(clock: '11:32'),
  ClockTile(clock: '01:32'),
  ClockTile(clock: '01:02'),
];

class AlarmScreen extends StatefulWidget {
  static const routeName = '/alarm_screen';
  const AlarmScreen({super.key});
  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}


class _AlarmScreenState extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
    if (flag) {
      setState(() {});
    }
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      height: mediaQuery.size.height,
      child: (
        clocks.isNotEmpty ? 
        ListView.builder(
        itemBuilder: (context, index) {
          return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                  color: Colors.red, child: const Icon(CupertinoIcons.delete)),
              onDismissed: (direction) {
                setState(() {
                  clocks.removeAt(index);
                });
              },
              child: clocks[index]);
        },
        itemCount: clocks.length,
      ) 
      : 
      const Center(
        child: Text(
          'There are no alarms set',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1.0)
          ),
        ),
      )),
    );
  }
}
