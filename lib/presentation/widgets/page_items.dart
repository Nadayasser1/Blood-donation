
import 'package:flutter/material.dart';

class PageItems extends StatelessWidget{
  const PageItems({super.key, this.title, this.image});
  final String? title;
  final String? image;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 160,),
        SizedBox(
          height: 200,
            child: Image.asset(image!)),
        Text(title!,
          style:const TextStyle(
              color: Colors.black54,
              fontSize: 20),)
      ],
    );
  }
  
  
}