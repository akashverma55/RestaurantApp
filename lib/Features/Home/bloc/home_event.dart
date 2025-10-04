part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}
class HomeProductWishlistButtonClicked extends HomeEvent {}
class HomeToProfileButtonClicked extends HomeEvent {}
class HomeToCartButtonClicked extends HomeEvent {}
class HomeToRestaurantButtonClicked extends HomeEvent {
  final RestaurantDataModels restaurantDetails;
  HomeToRestaurantButtonClicked({required this.restaurantDetails});
}
class HomeToWishlistButtonClicked extends HomeEvent {}