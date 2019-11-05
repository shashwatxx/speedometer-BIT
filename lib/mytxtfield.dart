import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onChanged;
  final String hinttext;
  final Function onEditingcomplete;
  final keyboardType;
  MyTextField(
      {this.icon,
      this.label,
      this.onChanged,
      this.hinttext,
      this.onEditingcomplete,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        onEditingComplete: () {},
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hinttext,
          hintMaxLines: 2,
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade500),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.lightBlueAccent.shade100,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey.shade100,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: Icon(
            icon,
          ),
        ),
      ),
    );
  }
}
