import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/ui/home/support/support.dart';

class BookAService extends StatefulWidget {
  static const String routeName = 'BookAService';

  @override
  State<BookAService> createState() => _BookAServiceState();
}

class _BookAServiceState extends State<BookAService> {
  TextEditingController name = TextEditingController();
  TextEditingController medicalNumber = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController adminAccessCode = TextEditingController();
  String selectedValue = "gifts";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("eradication of illiteracy"), value: "eradication of illiteracy"),
      DropdownMenuItem(child: Text("mental health support sessions"), value: "mental health support sessions"),
      DropdownMenuItem(child: Text("individual support"), value: "individual support"),
      DropdownMenuItem(child: Text("parties/birthdays"), value: "parties/birthdays"),
      DropdownMenuItem(child: Text("gifts"), value: "gifts"),
      DropdownMenuItem(child: Text("trips"), value: "trips"),
      DropdownMenuItem(child: Text("vocational training workshops"), value: "vocational training workshops"),
    ];
    return menuItems;
  }

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      final endpoint = Uri.parse('https://baheya-app-kjsk.onrender.com/ApplyOnService');
      final data = {
        "name": name.text,
        "medical_Number": medicalNumber.text,
        "chosenService": selectedValue,
        "adminAccessCode": adminAccessCode.text
      };
      final response = await http.post(endpoint, body: data);
      if (response.statusCode == 200) {
        final responseData = response.body;
        // Process the response data here
        if (responseData == '{"message": "Your Application Is Submitted Successfully"}') {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Success'),
                content: Text('Your application has been submitted successfully.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else if (responseData == '{"message": "Invalid admin access code"}') {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Invalid admin access code. Please try again.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Handle API error here
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to submit your application. Please try again later.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book a Service', style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, support.routName);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black, size: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        color: Color(0x51f8aca2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        color: Color(0x51f8aca2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: medicalNumber,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Medical Number',
                        ),
                        validator: (pass) {
                          if (pass?.trim() == '') {
                            return 'Please enter Medical Number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffFEF1F0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text('choose services', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                              SizedBox(width: 10,),
                              DropdownButton(
                                dropdownColor: Color(0xffFEF1F0),
                                value: selectedValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                  });
                                },
                                items: dropdownItems,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        color: Color(0x51f8aca2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: adminAccessCode,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Admin Access Code',
                        ),
                        validator: (pass) {
                          if (pass?.trim() == '') {
                            return 'Please enter Admin Access Code';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: submitForm,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          color: Color(0xfff8aca2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'book',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}