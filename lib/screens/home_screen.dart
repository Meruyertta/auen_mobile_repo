import 'package:auen/screens/feed_screen.dart';
import 'package:auen/screens/library_screen.dart';
import 'package:auen/screens/login_screen.dart';
import 'package:auen/screens/main_screen.dart';
import 'package:auen/screens/notifications_screen.dart';
import 'package:auen/screens/settings_screen.dart';
import 'package:auen/screens/registration_screen.dart';
import 'package:auen/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../bloc/constants/nav_bar_items.dart';
import '../bloc/navigation_cubit.dart';
import '../style/colors/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NavigationCubit _navigationCubit;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationCubit = BlocProvider.of<NavigationCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            selectedItemColor: Colors.white,
            backgroundColor: Colors.black,
            currentIndex: state.index,
            selectedIconTheme: IconThemeData(color: Colors.white),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                  color: Colors.white,
                ),
                label: 'Feed',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.library_books_sharp,
                    color: Colors.white,
                  ),
                  label: 'Library'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  label: 'Notifications'),
            ],
            onTap: (index) => _navigationCubit.changeBottomNavBar(index),
          );
        },
      ),
      // body: Center(child: Text("Screen")),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.index == 0) {
          return MainScreen();
        } else if (state.index == 1) {
          return FeedScreen();
        } else if (state.index == 2) {
          return SearchScreen();
        } else if (state.index == 3) {
          return LibraryScreen();
        } else if (state.index == 4) {
          return NotificationScreen();
        }

        return SizedBox();
      }),
    );
  }
}
