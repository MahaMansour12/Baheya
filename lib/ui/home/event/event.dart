import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled2/model/Intersted.dart';
import 'package:untitled2/ui/home/event/InterstedEvents.dart';
import 'package:untitled2/ui/home/home.dart';

import '../../../dataclick.dart';
import '../../../model/InterstEvent.dart';
import '../../../model/Intersted.dart';
import '../../../model/Intersted.dart';
import '../../../model/Intersted.dart';
import '../../../remot/network/event _API.dart';
import '../../../remot/network/materail.dart';
import '../../../shared/sharedPeferences.dart';
import '../../Notification (1).dart';
import '../../customButton.dart';
import '../../settings.dart';
import '../../widgets/customIamge.dart';
import 'package:http/http.dart' as http;

class event extends StatefulWidget {
  static const String routName = 'event';

  @override
  State<event> createState() => _eventState();
}

class _eventState extends State<event> {
  String id = '';

  bool _isHovered = false;
  bool _isClick = false;

  @override
  void _navigateToInterestedEvents(String eventId) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => InterestedEventsScreen(eventId: eventId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
              onTap: () {
               Navigator.pushReplacementNamed(context, home_screen.routName);
              },
              child: const Icon(Icons.arrow_back_ios_new_outlined,
                  color: Colors.black, size: 25)),
          actions: [
            Icon(Icons.dark_mode_outlined, color: Colors.black, size: 25),
            SizedBox(
              width: 10,
            ),
            InkWell(
                onTap: (){
                  Navigator.pushReplacementNamed(context,Notifications.routeName);
                },
                child: Icon(Icons.notifications_none_rounded, color: Colors.black, size: 25)),
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
        body: Padding(
            padding: const EdgeInsets.all(8),
              child: Column(children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        height: 40,
                        width: 170,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xfff8aca2)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          'Comping Events',
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        _navigateToInterestedEvents(id);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 40,
                          width: 170,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0xfff8aca2)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text('Interested Events',
                              textAlign: TextAlign.center)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'Discover Baheya Events Near You',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
               Flexible(
                  child: FutureBuilder<dynamic>(
                    future:
                        ImageMaterialApi.getMaterials(endPoint: 'UpcomingEvents'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final materials = snapshot.data!;
                        return ListView.builder(
                          itemCount: materials.length,
                          itemBuilder: (BuildContext context, int index) {
                            final material = materials[index];

                            return Padding(
                                padding: const EdgeInsets.all(12),
                                child: Center(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Color(0xbdf79e93)),
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
                                                  opacity: _isHovered ? 0.5 : 1.0,
                                                  child: InkWell(
                                                    child: Image.network(
                                                        material.imageUrl ?? " ",
                                                        width: 260,
                                                        height: 300,
                                                        fit: BoxFit.cover),
                                                  ),
                                                ))),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Title : ${material.title}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blueGrey),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            'Description : ${material.description}',
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              height: 50,
                                              width: 240,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.grey),
                                                  color: _isClick
                                                      ? Color(0xffF79E93)
                                                      : Colors.white38,
                                                  borderRadius:
                                                      BorderRadius.circular(20)),
                                              child: Text(
                                                'Are you interested',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                id = material.id;
                                                print(material.id);
                                              });
                                            }),
                                      ]),
                                )));
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('${snapshot.error}'),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                )
              ]),
            ));
  }
}
