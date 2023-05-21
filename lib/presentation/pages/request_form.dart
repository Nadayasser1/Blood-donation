
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/request_form_body.dart';

class RequestForm extends StatelessWidget{
  const RequestForm({super.key});



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RequestFormBody(),
    );
  }


}