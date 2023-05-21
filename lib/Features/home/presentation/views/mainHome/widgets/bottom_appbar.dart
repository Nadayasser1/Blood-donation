import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Features/notification/presentation/views/notification_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../../core/widgets/constants.dart';
import '../../../../../profile/presentation/views/profile_view.dart';
import 'home_view_body.dart';


class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BoState();
}

class _BoState extends State<BottomNavbar> {
  final _bottomNavbarController=PersistentTabController();

  List<Widget> _buildScreens() {
    return [
      const ProfileView(),
      const HomeViewbody(),
      const NotificationView (),

    ];
  }


  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon:const Icon(CupertinoIcons.person_alt_circle_fill),
        title: ("Profile"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: iconColor,
      ),
      PersistentBottomNavBarItem(
        icon:const Icon(CupertinoIcons.house_fill,),
        title: ("Home"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: iconColor,
      ),
      PersistentBottomNavBarItem(
        icon:const Icon(CupertinoIcons.bell_circle_fill,),
        title: ("Notification"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: iconColor,
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  PersistentTabView(
        context,
        controller: _bottomNavbarController,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: kSecColor, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: kSecColor,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties:const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation:const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}