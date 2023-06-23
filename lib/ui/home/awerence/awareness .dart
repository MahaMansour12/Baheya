import 'package:flutter/material.dart';
import 'package:untitled2/ui/widgets/customIamge.dart';
import 'package:video_player/video_player.dart';
import 'package:untitled2/ui/editingAccount/editAccount.dart';
import 'package:untitled2/ui/otherStage/otherStage.dart';
import '../../../model/Mat.dart';
import '../../../remot/network/materail.dart';
import '../../sign_in.dart';
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

  //late VideoPlayerController Controller;

  // @override
  // void initState() {
  //   super.initState();
  //   Controller =
  //       VideoPlayerController.network('https://example.com/path/to/video.mp4')
  //         ..initialize().then((_) {
  //           // Once the video has been loaded, play it automatically
  //           Controller.play();
  //           setState(() {}); // update the widget
  //         });
  // }
  // late List<Material>material;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, Sign_IN.routeName);
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
                Navigator.pushReplacementNamed(context, editAccount.routName);
              },
              child:
                  Icon(Icons.settings_outlined, color: Colors.black, size: 25)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Hello Amira',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.start,
              ),
              Text(
                'We hope you become better soon',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 15,
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
              Text(
                'Stage II',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.center,
              ),
              Row(
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
                  homeStage(
                    image: 'asstes/images/TNM.png',
                    name: "TNM Stage",
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
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.image, size: 30),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Images',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                ],
              ),
              FutureBuilder<List<dynamic>>(
                future: fetchMaterials('ImageMaterials'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {

                    return Container(
                      height: 160,
                      width: 130, // set a fixed height for the ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          var item = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                                child: MouseRegion(
                                    onEnter: (event) {
                                      setState(() {
                                        _isHovered = true;
                                        Container(height: 200,width: 200,
                                        child: Column(children: [
                                        Text(item['title']),
                                        Text(item['description']),
                                        Text(item['surgery']),
                                        ],));


                                      });
                                    },
                                    onExit: (event) {
                                      setState(() {
                                        _isHovered = false;
                                      });
                                    },
                                    child: InkWell(
                                      onTap: () {
                                        // handle tap action
                                      },
                                      child: Opacity(
                                          opacity: _isHovered ? 0.5 : 1.0,

                                      child: customImage(
                                              imagee:item['imageUrl'])))
                                    ))
                          );
                        },
                        itemCount:snapshot.data?.length,
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
                  Icon(Icons.article_outlined, size: 30),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Artical',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                ],
              ),
              FutureBuilder<List<dynamic>>(
                future: fetchMaterials('ArticleMaterials'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {

                    return Container(
                      height: 160,
                      width: 130, // set a fixed height for the ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          var item = snapshot.data![index];
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                  child: MouseRegion(
                                      onEnter: (event) {
                                        
                                        setState(() {
                                          Container(height: 200,width: 200,
                                          child: Column(children: [
                                            Text(item['title']),
                                            Text(item['description']),
                                            Text(item['surgery']),
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
                                            // handle tap action
                                          },
                                          child: Opacity(
                                              opacity: _isHovered ? 0.5 : 1.0,

                                              child: customArtical(artical:item['title'])))
                                  ))
                          );
                        },
                        itemCount:snapshot.data?.length,
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
                  Icon(Icons.play_arrow_outlined, size: 30),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Videos',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                ],
              ),
              Container(
                height: 160,
                width: 130, // set a fixed height for the ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    // build your list items here using data from the API
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
                              child: InkWell(
                                onTap: () {
                                  // handle tap action
                                },
                                child: Opacity(
                                    opacity: _isHovered ? 0.5 : 1.0,
                                    child: customArtical(
                                      artical: 'Videos',
                                    )),
                              ))),
                    );
                  },
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
