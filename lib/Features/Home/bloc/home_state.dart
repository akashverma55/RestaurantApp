part of 'home_bloc.dart';

@immutable
abstract class HomeState {}  //It gives the state of your app

abstract class HomeAction extends HomeState {} //It gives the action to be performed by your app

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<RestaurantDataModels> restaurants;
  final List<HorizonatalItemModels> horizontalItems;
  HomeLoaded({required this.restaurants, required this.horizontalItems});
}

class HomeError extends HomeState {}

class HomeToProfile extends HomeAction {}

class HomeToRestaurant extends HomeAction {
  final RestaurantDataModels restaurantDetails;
  HomeToRestaurant({required this.restaurantDetails});
}

class HomeToCart extends HomeAction{}

class HomeToWishlist extends HomeAction{}

class HomeProductWishlistState extends HomeAction{}
class HomeProductWishlistedState extends HomeAction{}