import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockTile extends StatefulWidget {
  final clock;
  const ClockTile({super.key, required this.clock});

  @override
  State<ClockTile> createState() => _ClockTileState();
}

class _ClockTileState extends State<ClockTile> {
  bool currentVal = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.clock.toString(),
            style: const TextStyle(fontSize: 70, color: Colors.grey),
          ),
          subtitle: const Text(
            'Alarm',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          trailing: SizedBox(
            height: 40,
            width: 60,
            child: FittedBox(
              fit: BoxFit.fill,
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
          ),
        ),
        const Divider(
          color: Colors.grey,
          height: 3,
        )
      ],
    );
  }
}
