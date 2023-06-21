import 'package:flutter/material.dart';
import 'package:untitled2/ui/home/home.dart';
import 'package:untitled2/ui/widgets/formData.dart';

class UserData extends StatelessWidget {
  static const String routName = 'userData';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Profile',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, home_screen.routName);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black, size: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
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
              textData: 'Amira Ahmed',
            ),
            SizedBox(height: 20),
            formData(
              userIcon: Icons.email,
              textData: 'Amira Ahmed@gmail.com',
            ),
            SizedBox(height: 20),
            formData(
              userIcon: Icons.perm_identity,
              textData: '873259',
            ),
            SizedBox(height: 20),
            formData(
              userIcon: Icons.phone,
              textData: '0103299485',
            ),
            SizedBox(height: 22,),
            Text('Stage II',
                style: TextStyle(color: Colors.black, fontSize: 20),
                textAlign: TextAlign.start),
            Text('Most breast cancers are found in women who are 50 years old or older,\n'
                ' but breast cancer also affects younger women. While breast cancer diagnosis  '
                'and treatment are difficult for women of any age, young survivors may find it '
                'overwhelming.',style: TextStyle(color: Colors.black, fontSize: 18,height: 2))
          ],
        ),
      ),
    );
  }
}
