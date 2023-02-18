import 'package:auen/screens/home_screen.dart';
import 'package:auen/screens/login_screen.dart';
import 'package:auen/screens/main_screen.dart';
import 'package:auen/screens/notifications_screen.dart';
import 'package:auen/screens/profile_screen.dart';
import 'package:auen/style/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


import 'bloc/navigation_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
   MultiProvider(
     providers: [
       BlocProvider(
         create: (context) => NavigationCubit(),
         child: HomeScreen(),
       )
     ],
    child: MyApp(),
   )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.accentColorDarkPink,
      title: 'Auen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen()
    );
  }
}


