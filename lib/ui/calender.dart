import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled2/ui/settings.dart';

class Calendar extends StatefulWidget {
  static const String routeName = 'calendar';
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
 DateTime today=DateTime.now();
 void _onDaySelected(DateTime day, DateTime focusedDay){
   setState(() {
     today=day;
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, Settings.routeName);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black, size: 25)),
        actions: [
          Icon(Icons.dark_mode_outlined, color: Colors.black, size: 25),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications_none_rounded, color: Colors.black, size: 25),
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, Settings.routeName);
              },
              child:
              Icon(Icons.settings_outlined, color: Colors.black, size: 25)),
          SizedBox(
            width: 10,
          ),
        ],
      ),

      body: Content(),
    );
  }


Widget Content() {
    return Column(
      children: [
        Text('pick your medicine and your session date and time',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Container(
          child: TableCalendar(
            locale: 'en_US',
            rowHeight: 43,
            headerStyle: HeaderStyle(formatButtonVisible: false,titleCentered: true),
            availableGestures: AvailableGestures.all,

            focusedDay: today,
            lastDay: DateTime.utc(2070),
            firstDay: DateTime.utc(2020),
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day)=>isSameDay(day,today),
          ),
        ),
      ],
    );

}}
