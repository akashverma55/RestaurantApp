part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}
class HomeProductWishlistButtonClicked extends HomeEvent {
  final RestaurantDataModels restaurantDataToWishlist;
  HomeProductWishlistButtonClicked({required this.restaurantDataToWishlist});
}
class HomeToProfileButtonClicked extends HomeEvent {}
class HomeToCartButtonClicked extends HomeEvent {}
class HomeToRestaurantButtonClicked extends HomeEvent {
  final RestaurantDataModels restaurantDetails;
  HomeToRestaurantButtonClicked({required this.restaurantDetails});
}
class HomeToWishlistButtonClicked extends HomeEvent {}