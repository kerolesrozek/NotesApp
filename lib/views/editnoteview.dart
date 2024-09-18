import 'package:flutter/material.dart';
import 'package:notesapp/widgets/customtextfield.dart';
import 'package:notesapp/widgets/editnoteform.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key,});
  static String id = 'editnoteview';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edite Note',
          style: TextStyle(fontSize: 26),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16)),
              child: IconButton(
                onPressed: () {

                },
                
                 icon:Icon(Icons.check_sharp ,  size: 30,)  ,
                
                ),
              ),
            ),
          
        ],
      ),
     
     
      body: EditNoteForm(),
    );
  }
}
