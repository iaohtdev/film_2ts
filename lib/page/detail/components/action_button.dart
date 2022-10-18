
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,required this.icon,
  }) : super(key: key);
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color:Color(0xff292b37),
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.5),
          //     blurRadius: 4,
          //     offset: Offset(2,0),
          //     spreadRadius: 1,
          //   ),
          // ]
          ),
      child: Icon(icon,color: Colors.white,size: 30,),
    );
  }
}
