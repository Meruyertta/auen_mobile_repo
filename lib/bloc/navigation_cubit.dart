import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/nav_bar_items.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(0));

  int currentIndex=0;
  void changeBottomNavBar(int index){
    currentIndex=index;
    emit(NavigationState(currentIndex));
  }

  // void getNavBarItem(NavbarItem navbarItem) {
  //   switch (navbarItem) {
  //     case NavbarItem.home:
  //       emit(NavigationState(NavbarItem.home, 0));
  //       break;
  //     case NavbarItem.search:
  //       emit(NavigationState(NavbarItem.search, 1));
  //       break;
  //     case NavbarItem.library:
  //       emit(NavigationState(NavbarItem.library, 2));
  //       break;
  //     case NavbarItem.timer:
  //       emit(NavigationState(NavbarItem.timer, 3));
  //       break;
  //     case NavbarItem.message:
  //       emit(NavigationState(NavbarItem.message, 4));
  //       break;
  //     case NavbarItem.images:
  //       emit(NavigationState(NavbarItem.images, 5));
  //       break;
  //   }
  // }
}