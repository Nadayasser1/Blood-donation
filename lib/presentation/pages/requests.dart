import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/domain/entities/get_request_data.dart';
import 'package:graduation/presentation/controller/get_requests_cubit.dart';
import 'package:graduation/presentation/widgets/appBar.dart';
import 'package:graduation/presentation/widgets/user_info.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_progress_indecator.dart';
import '../../domain/use_cases/get_request_use_case.dart';
import '../widgets/background.dart';
import 'bottom_appbar.dart';

class YourRequests extends StatelessWidget {
  const YourRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final AppPreferences appPreferences = sl<AppPreferences>();
    final String id = appPreferences.getToken();
    print(id);
    BlocProvider.of<GetRequestsCubit>(context)
        .getRequests((GetRequestParameters(id: id)));

    return BlocConsumer<GetRequestsCubit, GetRequestsState>(
      listener: (context, state) {
        if (state is GetRequestSuccessState) {}
        else if (state is GetRequestErrorState) {
          // ignore: avoid_print
          print(state.error);
        }
      },
      builder: (context, state) {
        if (state is GetRequestLoadingState) {
          return Background(
            child: Scaffold(
                appBar:pageAppBar("Your Requests"),
                body: const Center(child: CustomProgressIndecator()),),
          );
        } else if (state is GetRequestSuccessState){
          return Background(
            child: Scaffold(
              appBar: pageAppBar("Your requests")
             ,
              body:
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child:  ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.vertical * 0.1),
                        itemBuilder: (BuildContext context, int index)=>buildItem(state.getRequestData.requestData[index],context),
                        separatorBuilder: (BuildContext context, int index)=>const Divider(
                          thickness: 1,
                        ),
                        itemCount: state.getRequestData.requestData.length,
                      ),
              ),
            ),
          );
        }else{
          return Background(
            child: Scaffold(
              appBar: pageAppBar("Your Requests") ,
              body:
              Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
            ));
        }
      },
    );
  }
}

Widget buildItem(GetRequestsData data, context) {
  return Container(
    decoration:  BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.circular(5)
    ) ,
    width: double.maxFinite,
    height: MediaQuery.of(context).size.height * 0.32,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserInfo(
          margin: const EdgeInsets.all(10),
          label: "Trans ID:",
          text: data.transId.toString(),
        ),
        UserInfo(
          margin: const EdgeInsets.all(10),
          label: "Branch name:",
          text: data.branchName,
        ),
        UserInfo(
          margin: const EdgeInsets.all(10),
          label: "Patient name:",
          text: data.patientName,
        ),
        UserInfo(
          margin: const EdgeInsets.all(10),
          label: "Phone:",
          text: data.phoneNumber,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            UserInfo(
              margin: const EdgeInsets.all(10),
              label: "Blood type:",
              text: data.bloodType,
            ),
            UserInfo(
                margin: const EdgeInsets.all(10),
                label: "Units:",
                text: " ${data.unitNumber}"),
          ],
        ),
        StatusInfo(
          statusLabel: "Status:",
          state: data.accepted,
        )
      ],
    ),
  );
}
