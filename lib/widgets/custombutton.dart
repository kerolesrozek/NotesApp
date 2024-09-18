import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,  this.isloading=false, required this.ButtonName,
  });
  final void Function()? onTap;
  final bool isloading ;
 final String ButtonName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        width: MediaQuery.of(context).size.width,
        child: isloading == true
            ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                
              ))
            : Center(
                child: Text(
                ButtonName,
                style: TextStyle(color: Colors.black, fontSize: 25),
              )),
        decoration: BoxDecoration(
          color: Colors.cyanAccent,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
