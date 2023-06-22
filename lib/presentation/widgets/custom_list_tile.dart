import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomListTile extends StatelessWidget{
  const CustomListTile({super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
     this.trailing});

  final String title;
  final Widget? icon;
  final String subtitle;
  final Widget? trailing;

  
  
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: MediaQuery.of(context).size.width *1,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text(title,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold),),
        subtitle: Text(subtitle),
        leading: icon,
        trailing: trailing,


      ),
    );
  }
  
  
}