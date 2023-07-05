// import 'package:flutter/material.dart';
//
// import 'book a service.dart';
//
//
// class support extends StatefulWidget {
//   static const String routeName='support';
//
//   @override
//   State<support> createState() => _supportState();
// }
//
// class _supportState extends State<support> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      // appBar: AppBar(title: Center(child: Text('Services')),),
//       body: SingleChildScrollView(
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               buildCard(
//                   title: 'Eradication Of Illiteracy', image: AssetImage('asstes/images/1.jpeg')),
//               buildCard(
//                   title: 'Mental Health Support Sessions', image: AssetImage('asstes/images/2.jpeg')),
//               buildCard(
//                   title: 'Individual Support', image: AssetImage('asstes/images/3.jpeg')),
//               buildCard(
//                   title: 'Parties/Birthdays', image: AssetImage('asstes/images/4.jpeg')),
//               buildCard(
//                   title: 'gifts', image: AssetImage('asstes/images/5.jpeg')),
//               buildCard(
//                   title: 'trips', image: AssetImage('asstes/images/6.jpeg')),
//               buildCard(
//                   title: 'Vocational Training Workshop', image: AssetImage('asstes/images/8.jpeg')),
//
//             ],
//           ),
//       ),
//         floatingActionButton: ElevatedButton(
//           onPressed: () {
//             Navigator.pushReplacementNamed(context, BookAService.routeName);
//
//           },
//           child: Text('Book a service',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold)),
//            style: ElevatedButton.styleFrom(
//           primary: Color(0xfaf8aca2), // background
//           onPrimary: Colors.white,
//              fixedSize: Size(130, 80),
//              // foreground
//         ),
//         ),
//
//     );
//   }
// }
//
// buildCard({required String title, required AssetImage image}) {
//   return Card(
//     child: Column(
//       children: [
//
//            Image(
//             image: image,
//             fit: BoxFit.cover,
//           ),
//
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             title,
//             style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }
