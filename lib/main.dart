import 'package:auen/router/router.dart';
import 'package:auen/screens/home_screen.dart';
import 'package:auen/screens/login_screen.dart';
import 'package:auen/style/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'bloc/navigation_cubit.dart';
import 'core/error_handler.dart';

String? loggedInEmail;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorHandler.init();
  const storage = FlutterSecureStorage();
  loggedInEmail = await storage.read(key: 'email');

  runApp(MultiProvider(
    providers: [
      BlocProvider(
        create: (context) => NavigationCubit(),
        child: HomeScreen(),
      )
    ],
    child: const MyApp(),
  ));
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
      home: const LoginScreen(),
      builder: EasyLoading.init(),
      initialRoute: loggedInEmail == null ? AppRouter.login : AppRouter.home,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
