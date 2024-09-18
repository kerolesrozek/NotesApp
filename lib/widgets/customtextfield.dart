
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    super.key,
    required this.hint,
    required this.padding,
    this.onSaved
  });
  String hint;
  EdgeInsetsGeometry padding;
  void Function(String?)? onSaved;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
  onSaved: onSaved,
      validator: (value) {
        if(value?.isEmpty??true){
          return 'Field is required';
        }
       
      },
      cursorColor: Colors.cyanAccent,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyanAccent
          )
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.cyanAccent),
        contentPadding:padding,
      ),
    );
  }
}
