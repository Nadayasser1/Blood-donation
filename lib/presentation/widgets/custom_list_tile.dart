
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomListTile extends StatelessWidget{
  const CustomListTile({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return  const ListTile(
      title: Text("Raslan hospital need A-",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold),),
      leading: Icon(MdiIcons.hospitalBuilding,
        size: 40,
        color: Colors.black,),
      subtitle: Text("If you have time you can help"),
      
      
    );
  }
  
  
}