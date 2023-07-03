import 'package:flutter/material.dart';

import '../../../dataclick.dart';
import '../../../remot/network/event _API.dart';
import '../../../remot/network/materail.dart';
import '../../widgets/customIamge.dart';

class event extends StatefulWidget {
  static const String routName='event';

  @override
  State<event> createState() => _eventState();
}

class _eventState extends State<event> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Events'),centerTitle: true,),
     body: FutureBuilder<dynamic>(
        future: ImageMaterialApi.getMaterials(endPoint: 'UpcomingEvents'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final materials = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10,),
                  const Text('UPComing Event',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),textAlign: TextAlign.start,),

                  SizedBox(height: 10,),

                  Container(
                    height: 300,
                    width: double.infinity, // set a fixed height for the
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        color: const Color(0x51f8aca2),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final material = materials[index];



                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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

                                              child:InkWell(



                                                  child: Image.network(material.imageUrl?? " ",width: 250,height: 200,fit:BoxFit.fill,),
                                                ),
                                              )
                                          )

                                      ),
                                  SizedBox(height: 10,),
                                   Row(children: [Text('Title: ${material.title}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),SizedBox(width: 55,),Text('Description:${material.description}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400))],),
                                  SizedBox(height: 10,),
                                  Row(children: [Text('Location:${material.location}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),SizedBox(width: 40,),Text('Date:${material.date}'.substring(0, 21),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400))],)
                                ],
                              ),
                            )
                        );
                      },
                      itemCount: materials.length,
                    ),
                  ),
                ],
              ),
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
    );
  }
  }
