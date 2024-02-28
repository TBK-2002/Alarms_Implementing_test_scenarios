import 'package:flutter/material.dart';
import 'package:ieee_playground/screens/alarm_screen.dart';
import 'package:ieee_playground/widgets/add_alarm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme:
              const AppBarTheme(color: Color.fromARGB(255, 46, 45, 45))),
      routes: {AlarmScreen.routeName: (ctx) => const AlarmScreen()},
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _idx = 0;

  void addClock(newClock) {
    setState(() {
      clocks.add(newClock);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.amber,
        currentIndex: _idx,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            _idx = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.circle_notifications_outlined),
              label: 'World Clock',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'alarm',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'StopWatch',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_rounded),
              backgroundColor: Colors.transparent,
              label: 'Timer'),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Alarm'),
        elevation: 10,
        shadowColor: Colors.blueGrey,
        leading: TextButton(
          onPressed: () {},
          child: const Text(
            'Edit',
            style: TextStyle(color: Colors.orange, fontSize: 20),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet<dynamic>(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.94,
                          child: AddAlarmWidget(
                            handler: addClock,
                          ));
                    });
              },
              icon: const Icon(
                size: 30,
                Icons.add,
                color: Colors.orange,
              )),
        ],
      ),
      body: AlarmScreen(),
    );
  }
}
