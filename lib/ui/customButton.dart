import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size .width*0.5,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Color(0xffF79E93), // Set button color to green
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10.0), // Add some spacing between icon and text
              Text(
                text,
                style: TextStyle(color: Colors.black,fontSize: 16),
              ), // Add text to button
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  @override
  String textButtom;
  Function? OnClic;
  CustomButton2(this.textButtom, {this.OnClic});
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 52,
          width: 225,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(width: 1.5, color: Color(0xffFEF1F0)),
            color: Color(0xff2),
          ),
          child: Center(
            child: Text(
              textButtom,
              style: const TextStyle(
                color: Color(0xff1A1C1E),
                fontSize: 16,
                fontFamily: 'Inter',
              ),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
class CustomButton3 extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

   CustomButton3(this.icon, this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Color(0xffFEF1F0), // Set button color to green
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black), // Add icon to button
          SizedBox(width: 10.0), // Add some spacing between icon and text
          Text(
            text,
            style: TextStyle(color: Colors.black),
          ), // Add text to button
        ],
      ),
    );
  }
}
