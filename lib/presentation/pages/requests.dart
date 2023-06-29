import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/core/functions/toast_message.dart';
import 'package:graduation/domain/entities/get_request_data.dart';
import 'package:graduation/presentation/controller/get_requests_cubit.dart';
import 'package:graduation/presentation/widgets/user_info.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../../domain/use_cases/get_request_use_case.dart';
import '../widgets/top_bar.dart';
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
        if (state is GetRequestSuccessState) {
        } else if (state is GetRequestErrorState) {
          print(state.error);
          Toastmessage(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is GetRequestLoadingState) {
          return Scaffold(appBar:AppBar(),body: const Center(child: CircularProgressIndicator())); 
        } else if (state is GetRequestSuccessState){
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  CustomTopBar(
                    title: "Request Form",
                    icon: Icons.arrow_circle_right_outlined,
                    onPressed: () {
                      Get.to(() => const BottomNavbar());
                    },
                    iconColor: Colors.black38,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                          vertical:
                          MediaQuery.of(context).padding.vertical * 0.1),
                      itemBuilder: (BuildContext context, int index)=>buildItem(state.getRequestData.requestData[index],context),
                      separatorBuilder: (BuildContext context, int index)=>const Divider(
                        thickness: 1,
                      ),
                      itemCount: state.getRequestData.requestData.length,

                    ),
                  )
                ],
              ),
            ),
          );
        }else{
          return Scaffold(appBar:AppBar(),body: const Center(child: Text("There is no requests..yet")));
        }
      },
    );
  }
}

Widget buildItem(GetRequestsData data, context) {
  return Container(
    margin: const EdgeInsets.all(5),
    width: double.maxFinite,
    height: MediaQuery.of(context).size.height * 0.25,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserInfo(
          label: "Branch name:",
          text: data.branchName,
        ),
        UserInfo(
          label: "Patient name:",
          text: data.patientName,
        ),
        UserInfo(
          label: "Phone:",
          text: data.phoneNumber,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            UserInfo(
              label: "Blood type:",
              text: data.bloodType,
            ),
            UserInfo(label: "Units:", text: " ${data.unitNumber}"),
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

// children: [
// Container(
// margin: const EdgeInsets.all(5),
// width: double.maxFinite,
// height: MediaQuery.of(context).size.height * 0.25,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// UserInfo(
// label: "Branch name:",
// text: state.getRequestData.requestData[0]
// .branchName),
// UserInfo(
// label: "Patient name:",
// text: state.getRequestData.requestData[1]
// .patientName),
// UserInfo(
// label: "Phone:",
// text: state.getRequestData.requestData[2]
// .phoneNumber),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// mainAxisSize: MainAxisSize.max,
// children: [
// UserInfo(
// label: "Blood type:",
// text: state.getRequestData.requestData[4]
// .bloodType),
// UserInfo(
// label: "Units:",
// text: state.getRequestData.requestData[3]
// .unitNumber
//     .toString()),
// ],
// ),
// StatusInfo(
// statusLabel: "Status:",
// statusText: state
//     .getRequestData.requestData[5].accepted,
// statusColor: Colors.green,
// )
// ],
// ),
// ),
// const Divider(
// thickness: 1,
// ),
// Container(
// margin: const EdgeInsets.all(5),
// width: double.maxFinite,
// height: MediaQuery.of(context).size.height * 0.22,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const UserInfo(
// label: "Branch name:",
// text: "Ibn Sina Hospital",
// ),
// const UserInfo(
// label: "Patient name:",
// text: "Hesham mohsen",
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// mainAxisSize: MainAxisSize.max,
// children: const [
// UserInfo(
// label: "Blood type:",
// text: "  B+",
// ),
// UserInfo(
// label: "Units:",
// text: "  3    ",
// ),
// ],
// ),
// const StatusInfo(
// statusLabel: "Status:",
// statusText: "Canceled",
// statusColor: Colors.red,
// )
// ],
// ),
// ),
// const Divider(
// thickness: 1,
// ),
// ],