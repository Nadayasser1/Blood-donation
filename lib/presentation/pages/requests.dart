import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/presentation/widgets/user_info.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_text.dart';
import '../widgets/top_bar.dart';
import 'bottom_appbar.dart';


class YourRequests extends StatelessWidget{

  const YourRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 70),
        child:Column(

          children: [
            CustomTopBar(
              title: "Request Form",
              icon: Icons.arrow_circle_right_outlined,
              onPressed: () {
                Get.to(() => const BottomNavbar());
              },
              iconColor: Colors.black38,
            ),
            const Divider(thickness: 2,),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.vertical * 0.1),
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height *0.3,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        const UserInfo(
                          label: "Branch name:",
                          text: "Ibn Sina Hospital",
                        ),
                        const UserInfo(
                          label: "Patient name:",
                          text: "Hesham mohsen",
                        ),
                        const UserInfo(
                          label: "Patient id:",
                          text: "12345678910",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize:MainAxisSize.max ,
                          children: [
                            const UserInfo(
                                label: "Blood type:",
                                text: "  B+",
                             ),
                            const UserInfo(
                                label: "Units:",
                                text: "  3    ",
                            ),
                          ],

                        ),
                        StatusText(
                          text: "Accepted",
                         color: Colors.green,)

                      ],
                    ),
                    ) ,
                  const Divider(thickness: 1,),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height *0.3,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        const UserInfo(
                          label: "Branch name:",
                          text: "Ibn Sina Hospital",
                        ),
                        const UserInfo(
                          label: "Patient name:",
                          text: "Hesham mohsen",
                        ),
                        const UserInfo(
                          label: "Patient id:",
                          text: "12345678910",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize:MainAxisSize.max ,
                          children: [
                            const UserInfo(
                              label: "Blood type:",
                              text: "  B+",
                            ),
                            const UserInfo(
                              label: "Units:",
                              text: "  3    ",
                            ),
                          ],

                        ),
                        const StatusText(
                          text: "Canceled",
                          color: Colors.red,)

                      ],
                    ),
                  ) ,
                  const Divider(thickness: 1,),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height *0.3,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        const UserInfo(
                          label: "Branch name:",
                          text: "Ibn Sina Hospital",
                        ),
                        const UserInfo(
                          label: "Patient name:",
                          text: "Hesham mohsen",
                        ),
                        const UserInfo(
                          label: "Patient id:",
                          text: "12345678910",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize:MainAxisSize.max ,
                          children: [
                            const UserInfo(
                              label: "Blood type:",
                              text: "  B+",
                            ),
                            const UserInfo(
                              label: "Units:",
                              text: "  3    ",
                            ),
                          ],

                        ),
                        StatusText(
                          text: "Accepted",
                          color: Colors.green,)

                      ],
                    ),
                  ) ,








                ],
              ),

            )
          ],
        ),
      ),
    );
  }


}