import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/addnotecubit/addnotecubit.dart';
import 'package:notesapp/widgets/colorwidget.dart';

class ColorsListView extends StatefulWidget {
   ColorsListView({
    super.key,
  });
int currentindex=0;
  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  List<Color>colorslist=[
Colors.orange,
Colors.red,
Colors.lightGreen,
Colors.blue,
Colors.green,
Colors.deepOrange,
  ];
  
  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      height: 65,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colorslist.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                widget.currentindex=index;
                setState(() {
                  
                });
                BlocProvider.of<Addnotecubit>(context).color=colorslist[index];
              },
              child:ColorWidget(
                color: colorslist[index],
                isactive:widget.currentindex==index)
            );
          }),
    );
  }
}
