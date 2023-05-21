
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Features/home/presentation/views/requestForm/widgets/request_form_body.dart';

class RequestForm extends StatelessWidget{
  const RequestForm({super.key});



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RequestFormBody(),
    );
  }


}