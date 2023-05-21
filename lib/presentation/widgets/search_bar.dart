import 'package:flutter/material.dart';

class SearchBar extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: (){}, icon: const Icon(Icons.close))]
   ;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back))
    ;
  }

  @override
  Widget buildResults(BuildContext context) {
    return  null!;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text("محتوى البحث")
    ;
  }

}