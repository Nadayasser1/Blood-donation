import 'package:flutter/material.dart';
import 'home_cards.dart';

class HomeViewbody extends StatelessWidget {
  const HomeViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(top: 40),
                width:double.maxFinite,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                    color:Color.fromARGB(20, 0, 0, 0)),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:  [
                   const Text("Search",style: TextStyle(color: Colors.black12,fontSize: 20,)),
                   IconButton(onPressed:(){}, icon: const Icon(Icons.search,size: 30,))
                 ],
              ),),
              const HomeCards()
            ],
    ),
        ),);


  }
}
