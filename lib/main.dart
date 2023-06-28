import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/core/bloc_observer/bloc_observer.dart';
import 'package:graduation/presentation/controller/add_request_cubit.dart';
import 'package:graduation/presentation/controller/get_requests_cubit.dart';
import 'package:graduation/presentation/controller/login_cubit.dart';
import 'package:graduation/presentation/controller/profile_cubit.dart';
import 'package:graduation/presentation/controller/register_cubit.dart';
import 'package:graduation/presentation/pages/splash_view.dart';
import 'core/services/services_locator.dart';
import 'core/utils/constants.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ServicesLocator().init();
  runApp(const DonationApp());
}

class DonationApp extends StatelessWidget {
  const DonationApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => sl<LoginCubit>(),),
        BlocProvider(
          create: (context) => sl<RegisterCubit>(),),
        BlocProvider(
            create: (context) => sl<ProfileCubit>()),
        BlocProvider(
            create: (context) => sl<AddRequestCubit>()),
        BlocProvider(
            create: (context) => sl<GetRequestsCubit>() )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light()
            .copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: kPrimaryColor,
              elevation: 0,


            )),
        home:    const SplashView(),

      ),
    );
  }

}
