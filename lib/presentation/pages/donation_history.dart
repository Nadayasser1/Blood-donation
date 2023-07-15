import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/domain/entities/donations.dart';
import 'package:graduation/domain/use_cases/get_donation_use_case.dart';
import 'package:graduation/presentation/controller/get_donations_cubit.dart';
import 'package:graduation/presentation/widgets/user_info.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_progress_indecator.dart';
import '../widgets/appBar.dart';
import '../widgets/background.dart';
import '../widgets/user_cards.dart';


class YourDonations extends StatelessWidget {
  const YourDonations({super.key});

  @override
  Widget build(BuildContext context) {
    final AppPreferences appPreferences = sl<AppPreferences>();
    final String id = appPreferences.getToken();
    BlocProvider.of<GetDonationsCubit>(context)
        .getDonations((GetDonationsParameters(id: id)));

    return BlocConsumer<GetDonationsCubit, GetDonationsState>(
      listener: (context, state) {
        if(state is GetDonationsErrorState){
          print(state.error);
        }
      },
      builder: (context, state) {
        if(state is GetDonationsLoadingState){
          return Background(
            child: Scaffold(
              appBar: pageAppBar("Your Donations"),
              body:  const Center(child: CustomProgressIndecator()),

            ),
          );
        }
        else if(state is GetDonationsSuccessState) {
          print(state.addRequestMessage);
          return Background(
            child: Scaffold(
              appBar: pageAppBar("Your Donations"),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Cards(
                            cardIcon: MdiIcons.bloodBag,
                            text: "Live saved",
                            date: state.addRequestMessage.count.toString()),
                        Cards(
                            cardIcon: Icons.bloodtype,
                            text: "Blood type",
                            date: state.addRequestMessage.bloodType??"_"),
                        Cards(
                            cardIcon: Icons.calendar_month_outlined,
                            text: "Last Donation",
                            date: state.addRequestMessage.lastDonation??"_"),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Click to get your report",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        IconButton(
                            onPressed: () {
                              // ignore: no_leading_underscores_for_local_identifiers
                              _launchURL(Uri url) async {
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }
                              _launchURL(Uri.parse('https://app.box.com/s/equq3hf4tqlaz86j4gjje78t14hhyjok'));
                            },
                            icon: const Icon(
                              Icons.download_for_offline,
                              color: kSecColor,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.65,
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            getDonationItem(
                                state.addRequestMessage.donations[index],
                                context),
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                        itemCount: state.addRequestMessage.donations.length,

                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else{
          return Background(
            child: Scaffold(
                appBar: pageAppBar("Your Donations"),
                body:
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start ,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  const [
                          Cards(
                              cardIcon: MdiIcons.bloodBag,
                              text: "Live saved",
                              date: "0"),
                          Cards(
                              cardIcon: Icons.bloodtype,
                              text: "Blood type",
                              date: "_"),
                          Cards(
                              cardIcon: Icons.calendar_month_outlined,
                              text: "Last Donation",
                              date: "_"),

                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height *0.25,),
                      Center(
                        child:
                        Column(
                          children: [
                            SizedBox.square(
                                dimension: MediaQuery.of(context).size.height *0.12,
                                child: Image.asset(AssetsData.noReq)),
                            SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                            const Text("There is no Requests yet ..",
                                style: TextStyle(
                                    color: kSecColor,
                                    fontWeight: FontWeight.bold)),
                          ],

                        ),
                      ),

                    ],
                  ),
                ),
            ),
          );
        }
      },
    );
  }
}



Widget getDonationItem(Donations donations, context) {
  final AppPreferences appPreferences = sl<AppPreferences>();
  final String id = appPreferences.getToken();
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(5)),
    width: double.maxFinite,
    height: MediaQuery
        .of(context)
        .size
        .height * 0.25,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children:  [
        UserInfo(
          margin: const EdgeInsets.all(10),
          label: "Donor Name:",
          text: donations.donorName,
        ),
        UserInfo(
          margin: const EdgeInsets.all(10),
          label: "Birth Date:",
          text: donations.birthData,
        ),
        UserInfo(
          margin: const EdgeInsets.all(10),
          label: "Phone:",
          text: donations.phone,
        ),
        UserInfo(
          margin: const EdgeInsets.all(10),
          label: "Branch Name:",
          text: donations.branchName,
        ),
        UserInfo(
          margin: const EdgeInsets.all(10),
          label: "Donation Date:",
          text: donations.donationDate,
        ),

      ],
    ),
  );
}