import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:untitled2/ui/editingAccount/editAccount.dart';
import 'package:untitled2/ui/otherStage/otherStage.dart';
import '../../../artical.dart';
import '../../../dataclick.dart';

import 'package:untitled2/ui/home/tnm.dart';
import '../../../remot/network/materail.dart';
import '../../Notification (1).dart';
import '../../settings.dart';
import '../../sign_in.dart';
import '../../videos.dart';
import '../../widgets/customIamge.dart';
import '../../widgets/custom_artical.dart';
import '../../widgets/homeRowStage.dart';
import 'package:untitled2/ui/bio/bio.dart';

class awareness extends StatefulWidget {
  static const String routName = 'awareness';

  @override
  State<awareness> createState() => _awarenessState();
}

class _awarenessState extends State<awareness> {
  bool _isHovered = false;


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              SystemNavigator.pop();
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
      body:
      Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Hello ...',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.start,
              ),
              Text(
                'We hope you become better soon',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xfff8aca2)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.search, color: Color(0xfff8aca2)),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    )),
              ),

              Container(
                width: MediaQuery.of(context).size.width*0.7,
                height: MediaQuery.of(context).size.height*0.2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, bio.routeName);
                      },
                      child: homeStage(
                        image: 'asstes/images/Bio.png',
                        name: "BIO",
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, tnm.routName);
                      },
                      child: homeStage(
                        image: 'asstes/images/TNM.png',
                        name: "TNM Stage",
                      ),
                    ),
                    homeStage(
                      image: 'asstes/images/treat.png',
                      name: "Treatment",
                    ),
                    InkWell
                      (
                      onTap: (){
                           Navigator.pushReplacementNamed(context, otherStage.routeName);
                      },
                      child: homeStage(
                        image: 'asstes/images/other.png',
                        name: "Other Stages",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(Icons.image, size: 25),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Images',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ],
              ),
              FutureBuilder<dynamic>(
                future: ImageMaterialApi.getMaterials(endPoint: 'ImageMaterials'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final materials = snapshot.data!;
                    return Container(
                        height: 350,
                        width: 120, // set a fixed height for the ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          final material = materials[index];



                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
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
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ImageMaterialDetailScreen(material: material),
                                            ),
                                          );
                                        },
                                        child:MyImageWidget(imageUrl: material.url,
                                    ),
                                      )
                          )

                                    )
                                )
                          );
                        },
                        itemCount: materials.length,
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
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.article_outlined, size: 25),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Artical',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ],
              ),
              FutureBuilder<dynamic>(
                future: ImageMaterialApi.getMaterials( endPoint: 'ArticleMaterials'
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final materials = snapshot.data!;

                    return Container(
                      height: 220,
                      width: 120,  // set a fixed height for the ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          final material = materials[index];
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                  child: MouseRegion(
                                      onEnter: (event) {

                                        setState(() {
                                          Container(height: 140,
                                            width: 100,
                                          child: Column(children: [

                                          ],),

                                          );
                                          _isHovered = true;
                                        });
                                      },
                                      onExit: (event) {
                                        setState(() {
                                          _isHovered = false;
                                        });
                                      },
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ArticalMaterialDetailScreen(material: material),
                                              ),
                                            );
                                          },
                                          child: Opacity(
                                              opacity: _isHovered ? 0.5 : 1.0,

                                              child: customArtical(artical:'${material.title}'),
                                                  )))
                                  )
                          );
                        },
                        itemCount: materials.length,
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
              SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(Icons.play_arrow_outlined, size: 25),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Videos',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ],
              ),
          FutureBuilder<dynamic>(
            future: ImageMaterialApi.getMaterials( endPoint: 'VideoMaterials'
            ),
            builder: (context, snapshot) {

              if (snapshot.hasData) {

                final materials = snapshot.data!;

                return Container(
                  height: 220,
                  width: 100, // set a fixed height for the ListView
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      final material = materials[index];
                      return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                              child: MouseRegion(
                                  onEnter: (event) {

                                    setState(() {
                                      Container(height: 200,width: 200,
                                        child: Column(children: [

                                        ],),

                                      );
                                      _isHovered = true;
                                    });
                                  },
                                  onExit: (event) {
                                    setState(() {
                                      _isHovered = false;
                                    });
                                  },
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => VideoScreen(material: material),
                                          ),
                                        );
                                      },
                                      child: Opacity(
                                        opacity: _isHovered ? 0.5 : 1.0,

                                        child: customArtical(artical:'${material.title}'),
                                      )))
                          )
                      );
                    },
                    itemCount: materials.length,
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

            ],
          ),
        ),
      ),
    );
  }
}
