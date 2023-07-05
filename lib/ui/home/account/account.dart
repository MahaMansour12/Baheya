import 'package:flutter/material.dart';
import 'package:untitled2/ui/home/home.dart';

import '../../../remot/Api_petion_information/API_PatientInformation.dart';
import '../../../remot/Api_petion_information/PationInformation.dart';
import '../../../shared/sharedPeferences.dart';
import '../../widgets/formData.dart';

class Account extends StatelessWidget {
  static const String routName='Account';


  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:FutureBuilder<PatientInformation>(

        future:Information.InformationPatient(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            return
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
//
                          Stack(
                            children: [
                              Card(
                                elevation: 10,
                                child: Container(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Colors.grey),
                                      color: const Color(0x51f8aca2),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 100,
                                child: Image(
                                  image: AssetImage(
                                    'asstes/images/avatar.png',
                                  ),
                                  width: MediaQuery.of(context).size.width * 0.4,
// height: MediaQuery.of(context).size.height * 0.4,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          const Center(
                              child: Text('Personal Account',
                                  style: TextStyle(color: Colors.black, fontSize: 18))),
                          const SizedBox(height: 20),
                          formData(
                            userIcon: Icons.account_circle,
                            textData: snapshot.data?.name??'',
                          ),
                          SizedBox(height: 20),
                          formData(
                            userIcon: Icons.email,
                            textData: snapshot.data?.email??'',
                          ),
                          SizedBox(height: 20),
                          formData(
                            userIcon: Icons.perm_identity,
                            textData:snapshot.data?.medicalNumber?? '',
                          ),
                          SizedBox(height: 20),
                          formData(
                            userIcon: Icons.phone,
                            textData:snapshot.data?.phone??'' ,
                          ),
                          SizedBox(height: 22,),
                          Text('Stage : ${snapshot.data?.chosenStage??''}',
                              style: TextStyle(color: Colors.black, fontSize: 20),
                              textAlign: TextAlign.start),
                          SizedBox(height: 20),

                          Text('Most breast cancers are found in women who are 50 years old or older,\n'
                              ' but breast cancer also affects younger women. While breast cancer diagnosis  '
                              'and treatment are difficult for women of any age, young survivors may find it '
                              'overwhelming.',style: TextStyle(color: Colors.black, fontSize: 18,height: 2))
                        ]),
                  ));


          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else  {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }


}
