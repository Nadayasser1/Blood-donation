import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/domain/entities/get_request_data.dart';
import 'package:graduation/presentation/controller/get_requests_cubit.dart';
import 'package:graduation/presentation/widgets/user_info.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
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
                appBar: AppBar(
                  backgroundColor: appbarColor,
                  title: const Text("Your Requests"),
                  leading: IconButton(
                      onPressed: (){
                        Get.to(() => const BottomNavbar() );
                      },
                      icon:const Icon(Icons.arrow_circle_left_outlined)),
                  automaticallyImplyLeading:false,
                ),
                body: const Center(child: CustomProgressIndecator()),),
          );
        } else if (state is GetRequestSuccessState){
          return Background(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: appbarColor,
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
            ),
          );
        }else{
          return Background(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: appbarColor,
                title: const Text("Your Requests"),
                leading: IconButton(
                    onPressed: (){
                      Get.to(() => const BottomNavbar() );
                    },
                    icon:const Icon(Icons.arrow_circle_left_outlined)),
                automaticallyImplyLeading:false,
              ),
              body: const Center(child: Text("There is no requests..yet"))),
          );
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
    height: MediaQuery.of(context).size.height * 0.26,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
