// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/presentation/widgets/appBar.dart';
import 'package:graduation/presentation/widgets/background.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/widgets/custom_progress_indecator.dart';
import '../../domain/entities/branches.dart';
import '../controller/get_branches_cubit.dart';
import '../widgets/hospital_information.dart';
import 'bottom_appbar.dart';


class HospitalsView extends StatelessWidget {
  const HospitalsView({super.key,});


  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetBranchesCubit>(context).getBranches((const NoParameters()));
    return BlocConsumer<GetBranchesCubit, GetBranchesState>(
      listener: (context, state) {
        if(state is GetBranchesErrorState){
          print(state.error);
        }
      },
      builder: (context, state) {
        if(state is GetBranchesSuccessState) {
          return Background(
            child: Scaffold(
              appBar: pageAppBar("Hospitals"),
              body: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child:
                ListView.separated(
                    itemBuilder: (context, index) =>
                        hospitalsItem(state.addRequestMessage.branches[index], context,stokes[index]),
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(thickness: 1,);
                    },
                    itemCount: state.addRequestMessage.branches.length),
              ),
            ),
          );
        }
        else {
            return Background(
              child: Scaffold(
                appBar: pageAppBar("Hospitals"),
                body: const Center(child: CustomProgressIndecator()),

              ),
            );
        }
        },
    );
  }
}


Widget hospitalsItem(Branches branches,context,String stoke){

  return HospitalInformation(
    branchName: branches.branchName,
    state: '$stoke is at healthy level.donation are still accepted',
    phone: branches.branchPhone,
    city: branches.branchCity,
    address:
    RichText(
      text: TextSpan(
        text: 'Location',
        style: const TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _launchURL(Uri url) async {
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            }
            _launchURL(Uri.parse(branches.branchAddress));
          },
      ),
    ),
  );

}

List<String> stokes =[
  "A+",
  "O-",
  "AB+",
  "A-",
  "O+",
  "AB-"
];