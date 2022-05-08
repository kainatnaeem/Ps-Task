import 'package:flutter/material.dart';

class CustomBar extends StatefulWidget  implements PreferredSizeWidget{
   final Widget title;
  Size get preferredSize => const Size.fromHeight(50);
       
         
  const CustomBar({ Key? key, required this.title, }) : super(key: key);

  @override
  _CustomBarState createState() => _CustomBarState();
}

class _CustomBarState extends State<CustomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:widget.title,
       centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.red,
               Colors.black54,
            
                ],
              ),
            ),
          ),

        )    );
    
  }
}