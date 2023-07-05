import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/domain/entities/get_request_data.dart';
import 'package:graduation/presentation/controller/get_requests_cubit.dart';
import 'package:graduation/presentation/widgets/user_info.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../../domain/use_cases/get_request_use_case.dart';
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
          // ignore: avoid_print
          print(state.error);
        }
      },
      builder: (context, state) {
        if (state is GetRequestLoadingState) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Your Requests"),
                leading: IconButton(
                    onPressed: (){
                      Get.to(() => const BottomNavbar() );
                    },
                    icon:const Icon(Icons.arrow_circle_left_outlined)),
                automaticallyImplyLeading:false,
              ),
              body: const Center(child: CircularProgressIndicator()),);
        } else if (state is GetRequestSuccessState){
          return Scaffold(
            appBar: AppBar(
              title: const Text("Your Requests"),
              leading: IconButton(
                  onPressed: (){
                    Get.to(() => const BottomNavbar() );
                  },
                  icon:const Icon(Icons.arrow_circle_left_outlined)),
              automaticallyImplyLeading:false,
            ),
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
          );
        }else{
          return Scaffold(
            appBar: AppBar(
              title: const Text("Your Requests"),
              leading: IconButton(
                  onPressed: (){
                    Get.to(() => const BottomNavbar() );
                  },
                  icon:const Icon(Icons.arrow_circle_left_outlined)),
              automaticallyImplyLeading:false,
            ),
            body: const Center(child: Text("There is no requests..yet")));
        }
      },
    );
  }
}

Widget buildItem(GetRequestsData data, context) {
  return Container(
    decoration:  BoxDecoration(
      // color: Color(0x22B1B1B1),
      borderRadius: BorderRadius.circular(5)
    ) ,
    width: double.maxFinite,
    height: MediaQuery.of(context).size.height * 0.26,
    margin: EdgeInsets.only(top: 10),
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
