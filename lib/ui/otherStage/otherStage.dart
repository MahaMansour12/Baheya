import 'package:flutter/material.dart';
import 'package:untitled2/ui/home/home.dart';

import '../../dataclick.dart';
import '../../remot/network/materail.dart';
import '../widgets/customIamge.dart';
import '../widgets/stageContainer.dart';

class otherStage extends StatefulWidget {
  static const String routeName = 'otherStag';

  @override
  State<otherStage> createState() => _otherStageState();
}

class _otherStageState extends State<otherStage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Other Stage',),
       centerTitle: true,
       // backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
        onTap: () {
                   Navigator.pushReplacementNamed(context,home_screen.routName);
    },
    child: const Icon(Icons.arrow_back_ios_new_outlined,
    color: Colors.black, size: 25)),
      ) ,
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Divider(
                height: 4,
                thickness: 2,
                color: Color(0x51f8aca2),
              ),
              Text(
                'Surgery',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ), SizedBox(height: 10,),
          Divider(
            height: 4,
            thickness: 2,
            color: Color(0x51f8aca2),
          ),

              FutureBuilder<dynamic>(
                future: ImageMaterialApi.getMaterials(endPoint: 'SurgeryMaterial'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final materials = snapshot.data!;
                    return Container(
                      height: 200,
                      width:double.infinity,
             // set a fixed height for the ListView
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
                                            child:MyImageWidget(imageUrl: material.url??'',
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
        Divider(
          height: 4,
          thickness: 2,
          color: Color(0x51f8aca2),
        ),SizedBox(height: 10,),
              Text(
                'Chemo Therapy',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ), SizedBox(height: 10,),

              Divider(
        height: 4,
        thickness: 2,
        color: Color(0x51f8aca2),
      ),


              FutureBuilder<dynamic>(
                future: ImageMaterialApi.getMaterials(endPoint: 'ChemotherapyMaterial'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final materials = snapshot.data!;
                    return Container(
                      height: 200,
                      width:double.infinity,
               // set a fixed height for the ListView
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
                                            child:MyImageWidget(imageUrl: material.url??'',
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

              Divider(
                height: 4,
                thickness: 2,
                color: Color(0x51f8aca2),
              ),SizedBox(height: 10,),
              Text(
                'Targeted Therapy',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),

              ),SizedBox(height: 10,),
              Divider(
                height: 4,
                thickness: 2,
                color: Color(0x51f8aca2),
              ),

              FutureBuilder<dynamic>(
                future: ImageMaterialApi.getMaterials(endPoint: 'TargetedtherapyMaterial'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final materials = snapshot.data!;
                    return Container(
                      height: 200,
                      width:double.infinity,
                      // set a fixed height for the ListView
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
                                            child:MyImageWidget(imageUrl: material.url??'',
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
              Divider(
                height: 4,
                thickness: 2,
                color: Color(0x51f8aca2),
              ), SizedBox(height: 10,),
              Text(
                'Hormonal Therapy',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),

              ),SizedBox(height: 10,),
               Divider(
                height: 4,
                thickness: 2,
                color: Color(0x51f8aca2),
              ),

              FutureBuilder<dynamic>(
                future: ImageMaterialApi.getMaterials(endPoint: 'HormonaltherapyMaterial'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final materials = snapshot.data!;
                    return Container(
                      height: 200,
                      width:double.infinity,
                      // set a fixed height for the ListView
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
                                            child:MyImageWidget(imageUrl: material.url??'',
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
              Divider(
                height: 4,
                thickness: 2,
                color: Color(0x51f8aca2),
              ),SizedBox(height: 10,),
              Text(
                'Radio Therapy',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),

              ),SizedBox(height: 10,),
              Divider(
                height: 4,
                thickness: 2,
                color: Color(0x51f8aca2),
              ),

              FutureBuilder<dynamic>(
                future: ImageMaterialApi.getMaterials(endPoint: 'RadiotherapyMaterial'),
                builder: (context, snapshot) {
                  if (snapshot.hasData
                  ) {
                    final materials = snapshot.data!;
                    return Container(
                      height: 200,
                      width:double.infinity,
                     // set a fixed height for the ListView
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
                                            child:MyImageWidget(imageUrl: material.url??'',
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

            ],
          ),
        ),
      ),
    );
  }
}
