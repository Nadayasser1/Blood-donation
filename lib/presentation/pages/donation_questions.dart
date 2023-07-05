// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/domain/use_cases/send_questions_use_case.dart';
import 'package:graduation/presentation/pages/donation_form.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_alert_dialog.dart';
import '../controller/send_questions_cubit.dart';
import '../widgets/question_form.dart';
import 'bottom_appbar.dart';


class DonationQuestions extends StatelessWidget {
   DonationQuestions({super.key});

  String _question1="";
  String _question2="";
  String _question3="";
  String _question4="";
  String _question5="";
  String _question6="";
  String _question7="";
   String _question8="";


   @override
  Widget build(BuildContext context) {
     return BlocConsumer<SendQuestionsCubit, SendQuestionsState>(
      listener: (context, state) {
        if(state is SendQuestionsSuccessState){
          // print("ggggggggggggggggggg");
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Donate Now"),
            leading: IconButton(
                onPressed: () {
                  Get.to(() => const BottomNavbar());
                },
                icon: const Icon(Icons.arrow_circle_left_outlined)),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery
                        .of(context)
                        .padding
                        .vertical * 0.1),
                    children: [
                      QuestionForm(
                        question: '1. Are you under 18 years old?',
                        onSelected: (value, index, isSelected) {
                          if (value == "No") {
                            _question1 = "No";
                          }
                          else {
                            _question1 = "Yes";
                          }
                        },
                      ),
                      const Divider(thickness: 1,),
                      QuestionForm(
                        question: '2. Are you taking any antibiotics?',
                        onSelected: (value, index, isSelected) {
                          if (value == "No") {
                            _question2 = "No";
                          }
                          else {
                            _question2 = "Yes";
                          }
                        },
                      ),
                      const Divider(thickness: 1,),
                      QuestionForm(
                        question: '3. Are you having any fever during \n the past 3 weeks?',
                        onSelected: (value, index, isSelected) {
                          if (value == "No") {
                            _question3 = "No";
                          }
                          else {
                            _question3 = "Yes";
                          }
                        },
                      ),
                      const Divider(thickness: 1,),
                      QuestionForm(
                        question: '4. For the past 72 hours,have you \n taken anymedication?',
                        onSelected: (value, index, isSelected) {
                          if (value == "No") {
                            _question4 = "No";
                          }
                          else {
                            _question4 = "Yes";
                          }
                        },
                      ),
                      const Divider(thickness: 1,),
                      QuestionForm(
                        question: '5. Have you ever received insulin/ \n diabetic medication?',
                        onSelected: (value, index, isSelected) {
                          if (value == "No") {
                            _question5 = "No";
                          }
                          else {
                            _question5 = "Yes";
                          }
                        },
                      ),
                      const Divider(thickness: 1,),
                      QuestionForm(
                        question: '6. Do you have any chronic \n diseases?',
                        onSelected: (value, index, isSelected) {
                          if (value == "No") {
                            _question6 = "No";
                          }
                          else {
                            _question6 = "Yes";
                          }
                        },
                      ),
                      const Divider(thickness: 1,),
                      QuestionForm(
                        question: '7. Have you donated blood during \n the past 3 months?',
                        onSelected: (value, index, isSelected) {
                          if (value == "No") {
                            _question7 = "No";
                          }
                          else {
                            _question7 = "Yes";
                          }
                        },
                      ),
                      const Divider(thickness: 1,),
                      QuestionForm(
                        question: '8. Are you pregnant or breast \nfeeding? (for females only)',
                        onSelected: (value, index, isSelected) {
                          if (value == "No") {
                            _question8 = "No";
                          }
                          else {
                            _question8 = "Yes";
                          }
                        },
                      ),
                      Center(
                        child: ConditionalBuilder(
                          condition: state is! SendQuestionsLoadingState ,
                          builder: ((context) =>ElevatedButton(
                              style:  const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      kSecColor)),
                              onPressed: () {
                                if(state is SendQuestionsSuccessState){
                                  BlocProvider.of<SendQuestionsCubit>(context).sendQuestions(SendQuestionsParameters(
                                      q1: _question1,
                                      q2: _question2,
                                      q3: _question3,
                                      q4: _question4,
                                      q5: _question5,
                                      q6: _question6,
                                      q7: _question7,
                                      q8: _question8));
                                  Get.to(()=> DonationForm());
                                }
                                else if(state is SendQuestionsErrorState) {
                                   showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return  CustomAlertDialog(
                                          title: "Unfortunately, You can't donate blood",
                                          content: state.error,

                                        );
                                      });
                                }
                              },
                              child: const Text("Submit"))),
                          fallback: (context)=>const CircularProgressIndicator() ,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

