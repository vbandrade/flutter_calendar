import 'dart:math';
import 'package:date_interval_navigator/date_interval_navigator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Calendar',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Calendar demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CalendarEvent> events = <CalendarEvent>[];

  Random random = new Random();

  @override
  void initState() {
    super.initState();
  }

  Widget buildItem(BuildContext context, CalendarEvent e) {
    return Card(
      child: ListTile(
        title: Text("Event ${e.date}"),
        subtitle: Text("Yay for events"),
        leading: const Icon(Icons.gamepad),
      ),
    );
  }

  List<CalendarEvent> getEvents(DateTime start, DateTime end) {
    final int diff = end.difference(start).inDays;

    List<CalendarEvent> events = <CalendarEvent>[];

    for (int i = 0; i < diff; i++) {
      DateTime date = start.add(Duration(days: i));
      events.add(CalendarEvent(
        index: i,
        date: date,
      ));
    }

    return events;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CalendarWidget(
        initialDate: DateTime.now(),
        buildItem: buildItem,
        getEvents: getEvents,
        monthHeaderBuilder: monthHeaderBuilder,
        bannerHeader: AssetImage("assets/images/calendarheader.png"),
      ),
    );
  }

  Widget monthHeaderBuilder(BuildContext context, int year, int month) {
    DateTime start = new DateTime(year, month, 1);
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage("assets/images/calendarbanner.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      margin: EdgeInsets.only(top: 20.0),
      constraints: BoxConstraints(minHeight: 100.0, maxHeight: 100.0),
      child: Text(
        MaterialLocalizations.of(context).formatMonthYear(start),
        style: Theme.of(context).textTheme.title.copyWith(
              color: Colors.white,
              fontSize: 30.0,
            ),
      ),
    );
  }
}
