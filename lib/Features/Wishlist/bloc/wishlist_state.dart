part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}
abstract class WishlistActionState extends WishlistState {}

class WishlistInitialState extends WishlistState {}

class WishlistLoadedState extends WishlistState{
  final List<RestaurantDataModels> wishlistItem;
  WishlistLoadedState({required this.wishlistItem});
}

class WishlistLoadingState extends WishlistState{}

class WishlistErrorState extends WishlistState{}