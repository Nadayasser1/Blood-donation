import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/presentation/widgets/user_info.dart';
import '../../core/utils/constants.dart';
import '../widgets/top_bar.dart';
import '../widgets/user_cards.dart';
import 'bottom_appbar.dart';


class YourDonations extends StatelessWidget{
  const YourDonations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Donations"),
        leading: IconButton(
            onPressed: (){
              Get.to(() => const BottomNavbar() );
            },
            icon:const Icon(Icons.arrow_circle_left_outlined)),
        automaticallyImplyLeading:false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const ProfileCards(),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.02,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.65,
              child: ListView.separated(
                itemBuilder:(context,i) =>
                 Container(
                  decoration:  BoxDecoration(
                      color: const Color(0x22B1B1B1),
                      borderRadius: BorderRadius.circular(5)) ,
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                     UserInfo(
                       label: "Donor Name:",
                       text: "Nada yaser",
                     ),
                      UserInfo(
                        label: "Birth Date:",
                        text: "11/9/2000",
                      ),
                      UserInfo(
                        label: "Phone:",
                        text: "01234567890",
                      ),
                      UserInfo(
                        label: "Branch Name:",
                        text: "Central Blood Bank",
                      ),
                      UserInfo(
                        label: "Donation Date:",
                        text: "7/5/2023",
                      ),

                    ],
                  ),
                ),
                separatorBuilder: (BuildContext context, int index){
                  return const Divider();
                },
                itemCount: 10,

              ),
            )


          ],
        ),

      ),
    );
  }
}



