
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../core/utils/constants.dart';
import '../widgets/question_form.dart';
import '../widgets/top_bar.dart';
import 'bottom_appbar.dart';



class DonationForm extends StatelessWidget {
  const DonationForm({super.key});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTopBar(
              title: "Donation Form",
              icon: Icons.arrow_circle_right_outlined,
              onPressed: () {
                Get.to(() => const BottomNavbar());
              },
              iconColor: Colors.black38,),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.vertical * 0.1),
                children:  [
                  const QuestionForm(
                    question: '1. Are you taking any antibiotics?',
                  ),
                  const Divider(thickness: 1,),
                  const QuestionForm(
                    question: '2. Are you having any fever during \n the past 3 weeks?',
                  ),
                  const Divider(thickness: 1,),
                  const QuestionForm(
                    question: '3. For the past 72 hours,have you \n taken anymedication?',
                  ),
                  const Divider(thickness: 1,),
                  const QuestionForm(
                    question: '4. Have you ever received insulin/ \n diabetic medication?',
                  ),
                  const Divider(thickness: 1,),
                  const QuestionForm(
                    question: '5. Do you have any chronic \n diseases?',
                  ),
                  const Divider(thickness: 1,),
                  const QuestionForm(
                    question: '6. Have you donated blood during \n the past 3 months?',
                  ),
                  const Divider(thickness: 1,),
                  const QuestionForm(
                    question: '7. Are you pregnant or breast \nfeeding? (for females only)',
                  ),
                  Center(
                    child: ElevatedButton(
                        style:  const ButtonStyle(backgroundColor: MaterialStatePropertyAll(kSecColor)),
                        onPressed: (){
                          Get.to(() => const DonationForm());
                        },
                        child:const Text("Submit") ),
                  ),



                ],
              ),
            ),
          ],
        ),

      ),
    );
  }

}

