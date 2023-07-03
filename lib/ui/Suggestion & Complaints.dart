import 'package:flutter/material.dart';
import 'package:untitled2/ui/settings.dart';
import 'package:untitled2/ui/widgets/customButton.dart';
import 'package:http/http.dart' as http;
class SuggestionAndComplaints extends StatefulWidget {
  static const String routeName = 'SuggestionAndComplaints';

  @override
  State<SuggestionAndComplaints> createState() => _SuggestionAndComplaintsState();
}

class _SuggestionAndComplaintsState extends State<SuggestionAndComplaints> {
  TextEditingController Name = TextEditingController();

  TextEditingController Content = TextEditingController();

  String selectedValue = "complaint";

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("suggestion"),value: "suggestion"),
      DropdownMenuItem(child: Text("complaint"),value: "complaint"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, Settings.routeName);
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
                Navigator.pushReplacementNamed(context, Settings.routeName);
              },
              child:
              Icon(Icons.settings_outlined, color: Colors.black, size: 25)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
Text('Suggestion & Complaints', style: TextStyle(
  fontWeight: FontWeight.bold
),),
            SizedBox(height: 33,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffFEF1F0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(Icons.person_pin, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller:Name,
                        decoration: InputDecoration(
                          hintText: "Name (Optional)",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            )         ,
          SizedBox(height: 20,),
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Color(0xffFEF1F0),
  ),
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child:   Row(
      children: [
        SizedBox(width: 10,),
        Text('Suggestion or Complaints', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 20,),
        DropdownButton(
          dropdownColor: Color(0xffFEF1F0),
            value: selectedValue,
            onChanged: (String? newValue){
              setState(() {
                selectedValue = newValue!;
              });
            },
            items: dropdownItems
        )
      ],
    ),
  ),
),
          SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffFEF1F0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 322,
                        width: 214,
                        child: TextField(
 controller: Content,
                          maxLength: 1000,
                          maxLines: 50,
                          decoration: InputDecoration(
                            hintText: "Messege",
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(height: 10,),
          CustomButton('Submit',()async {
    // Get the values from the text fields
    String name = Name.text;
    String content = Content.text;

    // Make the API call
    var response = await http.post(
    Uri.parse('https://baheya-app-kjsk.onrender.com/feedback'),
    body: {
    'name': name,
    'content': content,
    'type': selectedValue,
    },
    );

    // Show a message based on the response
    if (response.statusCode == 200) {
    showDialog(
    context: context,
    builder: (_) => AlertDialog(
    title: Text('Success'),
    content: Text('Your feedback has been submitted.'),
    ),
    );
    } else {
    showDialog(
    context: context,
    builder: (_) => AlertDialog(
    title: Text('Error'),
    content: Text('There was an error submitting your feedback.'),
    ),
    );
    }

}
),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, color: Color(0xffe7ccc8),
              ),
              Text(" Call us on "),
              TextButton(onPressed: (){}, child: Text('16602',style: TextStyle(color: Color(0xffe7ccc8),
              ),))
            ],
          )],
        ),
      ),

    );
  }
}
