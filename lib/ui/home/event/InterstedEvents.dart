
import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:flutter/m';
import 'package:http/http.dart' as http;
import 'package:untitled2/ui/home/event/event.dart';

import '../../../model/EventModel.dart';
import '../../../model/InterstEvent.dart';
import '../../../remot/network/dio_helper.dart';
class InterestedEventsScreen extends StatefulWidget {
  final String eventId;

  InterestedEventsScreen({required this.eventId});

  @override
  _InterestedEventsScreenState createState() => _InterestedEventsScreenState();
}

class _InterestedEventsScreenState extends State<InterestedEventsScreen> {
  List<UpdatedEvent> _events = [];

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    String? token=await API.getToken();
    final response = await http.get(Uri.parse('https://baheya-app-kjsk.onrender.com/UpcomingEvents/${widget.eventId}',),headers:{'token':token??''} );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final events = data.map((json) => UpdatedEvent.fromJson(json)).toList();
      setState(() {
        _events = events;
      });
    }
  }
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  const Text('Interested Events',style: TextStyle(color: Colors.black,fontSize: 18)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context,event.routName);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black, size: 25)),
      ) ,
      body: _events.isNotEmpty
          ? ListView.builder(
        itemCount: _events.length,
        itemBuilder: (context, index) {
          final event = _events[index];

          return  Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color:Color(0xbdf79e93)),

                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(8),

                    child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.stretch,
                        children: [
                    Container(

                    child: MouseRegion(
                    onEnter: (event) {
              setState(() {
              _isHovered = true;
              });
              },
                    onExit: (event) {
                      setState(() {
                        _isHovered = false;
                      });
                    },
                    child: Opacity(
                      opacity: _isHovered
                          ? 0.5
                          : 1.0,
                      child: InkWell(
                        child: Image.network(
                            event.imageUrl ??
                                " ",
                            width: 260,
                            height: 300,
                            fit: BoxFit.cover),
                      ),
                    ))),
          SizedBox(
          height: 10,
          ),
          Text(
          'Title : ${event.title}',
          style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.blueGrey),
          ),
          SizedBox(
          height: 10,
          ),
          Text(
          'Description : ${event.description}',
          style: TextStyle(
          color: Colors.blueGrey,
          fontSize: 16,
          fontWeight:
          FontWeight.w400)),
          SizedBox(
          height: 10,
          ),
                          Text(
                              'Location : ${event.location}',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.w400)),
                          SizedBox(
                            height: 10,
          ),
                            Text(
                                'date : ${event.date}',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight.w400)),


    ]),
                  ),
    ));

        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}