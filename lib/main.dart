import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation/core/bloc_observer/bloc_observer.dart';
import 'package:graduation/presentation/controller/login_cubit.dart';
import 'package:graduation/presentation/controller/register_cubit.dart';
import 'package:graduation/presentation/pages/sign_up.dart';
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
          create: (context) => sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<RegisterCubit>(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: kPrimaryColor),
        home: SignUpView(),

      ),
    );
  }

}
