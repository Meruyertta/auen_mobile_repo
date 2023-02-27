import 'package:auen/screens/home_screen.dart';
import 'package:auen/screens/login_screen.dart';
import 'package:auen/screens/profile_screen.dart';
import 'package:auen/screens/settings_screen.dart';
import 'package:auen/screens/registration_screen.dart';
import 'package:auen/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screens/main_screen.dart';

class AppRouter {
  static const main = '/main';
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const search = '/search';
  static const projects = '/projects';
  static const settings = '/settings';
  static const profile = '/profile';


  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case main:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case search:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case register:
        return MaterialPageRoute(
          builder: (context) => const RegistrationScreen(),
        );
      case settings:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        );
      case profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
