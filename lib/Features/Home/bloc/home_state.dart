part of 'home_bloc.dart';

@immutable
abstract class HomeState {}  //From where you what change

abstract class HomeAction extends HomeState {} //To where you want change

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {}

class HomeError extends HomeState {}

class HomeToProfile extends HomeAction {}

class HomeToRestaurant extends HomeAction {
  final int index;
  HomeToRestaurant({required this.index});
}

class HomeToCart extends HomeAction{}

class HomeToWishlist extends HomeAction{}