import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled2/ui/home/home.dart';
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
        centerTitle: true,
        title:  Text('Calender',style: TextStyle(color: Colors.black,fontSize: 18)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context,home_screen.routName);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black, size: 25)),
      ) ,


      body: Content(),
    );
  }


Widget Content() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 40,),
          Text('pick your medicine and your session\n date and time',
              style: TextStyle( fontSize: 21),textAlign: TextAlign.center,),
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
      ),
    );

}}
