part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductWishlistButtonClicked extends HomeEvent {}
class HomeToProfileButtonClicked extends HomeEvent {}
class HomeToCartButtonClicked extends HomeEvent {}
class HomeToRestaurantButtonClicked extends HomeEvent {
  final int index;
  HomeToRestaurantButtonClicked({required this.index});
}
class HomeToWishlistButtonClicked extends HomeEvent {}