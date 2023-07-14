import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/domain/use_cases/get_notifications_use_case.dart';
import 'package:graduation/presentation/controller/get_notifications_cubit.dart';
import 'package:graduation/presentation/widgets/appBar.dart';
import 'package:graduation/presentation/widgets/background.dart';
import 'package:graduation/presentation/widgets/dot_indecator.dart';
import '../../core/services/services_locator.dart';
import '../../core/services/shared_preferences.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_progress_indecator.dart';
import '../../domain/entities/notifications_data.dart';
import '../widgets/custom_list_tile.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppPreferences appPreferences=sl<AppPreferences>();
    final String id= appPreferences.getToken();
    BlocProvider.of<GetNotificationsCubit>(context).getNotifications(GetNotificationsParameters(id: id));
    return BlocConsumer<GetNotificationsCubit, GetNotificationsState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if( state is GetNotificationsLoadingState){
          return Background(
            child: Scaffold(
              appBar: customAppBar("Notifications"),
              body: const Center(child: CustomProgressIndecator(),),
            ),
          );
        }
        else if( state is GetNotificationsSuccessState) {
          return Background(
          child: Scaffold(
            appBar: customAppBar("Notification"),
            bottomNavigationBar: const BottomAppBar(),
            body: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int  i) => 
                    notificationItems(state.notifications.notifications[i],context),
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(thickness: 0,);
                    },
                    itemCount: (state.notifications.notifications.length))
            ),
          ),
        );
        }
        else {
          return Background(
            child: Scaffold(
              appBar: customAppBar("Notifications"),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox.square(
                      dimension: MediaQuery.of(context).size.height *0.15,
                        child: Image.asset(AssetsData.noNotifocations)),
                    const Text("No notifications yet ..",
                        style: TextStyle(
                            color: kSecColor,
                            fontWeight: FontWeight.bold)),
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

Widget notificationItems (NotificationsData notifications , covariant){
  return  Container(
    padding: const EdgeInsets.only(left: 10),
    decoration: const BoxDecoration(
        color: Color(0x47B1B1B1),
        borderRadius: BorderRadius.all(Radius.circular(
            10))
    ),
    child: CustomListTile(
      title: notifications.notifyTitle,
      subtitle: notifications.notifyBody,
      icon: const CircleAvatar(
        maxRadius: 20,
        child: CircleAvatar(
          backgroundImage: AssetImage(AssetsData.logoo),
        ),

      ),
    ),
  );

}