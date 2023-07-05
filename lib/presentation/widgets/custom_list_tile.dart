import 'package:flutter/material.dart';

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
              fontSize: 18,
              fontWeight: FontWeight.bold),),
        subtitle: Text(subtitle),
        leading: icon,
        trailing: trailing,


      ),
    );
  }
  
  
}