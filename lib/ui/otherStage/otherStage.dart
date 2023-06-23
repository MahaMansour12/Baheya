import 'package:flutter/material.dart';
import 'package:untitled2/ui/home/home.dart';

import '../../remot/network/materail.dart';
import '../widgets/stageContainer.dart';

class otherStage extends StatelessWidget {
  static const String routeName = 'otherStag';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
        onTap: () {
                   Navigator.pushReplacementNamed(context,home_screen.routName);
    },
    child: const Icon(Icons.arrow_back_ios_new_outlined,
    color: Colors.black, size: 25)),
      ) ,
      body: SingleChildScrollView(
        child: Column(children: [
          FutureBuilder(
            builder:(context, snapshot) =>  StageConteniar(artical:snapshot.data??'HormonaltherapyMaterial'),
          future: fetchMaterials('HormonaltherapyMaterial')),
          FutureBuilder(
              builder:(context, snapshot) =>  StageConteniar(artical:snapshot.data??'TargetedtherapyMaterial'),
              future: fetchMaterials('TargetedtherapyMaterial')),
          FutureBuilder(
              builder:(context, snapshot) =>  StageConteniar(artical:snapshot.data??'RadiotherapyMaterial',),
              future: fetchMaterials('RadiotherapyMaterial')),
          FutureBuilder(
              builder:(context, snapshot) =>  StageConteniar(artical:snapshot.data??'ChemotherapyMaterial'),
              future: fetchMaterials('ChemotherapyMaterial')),
          FutureBuilder(
              builder:(context, snapshot) =>  StageConteniar(artical:snapshot.data??'SurgeryMaterial'),
              future: fetchMaterials('SurgeryMaterial')),









        ],),
      ),
    );
  }
}
