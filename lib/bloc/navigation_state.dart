part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  final int index;

  NavigationState(this.index);

  @override
  List<Object> get props => [this.index];
}
