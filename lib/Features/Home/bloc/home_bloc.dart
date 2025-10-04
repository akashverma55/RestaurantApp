import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:restaurant_app/Data/restaurant_food_data.dart';
import 'package:restaurant_app/Features/Home/models/restaurant_data_models.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeToWishlistButtonClicked>(homeToWishlistButtonClicked);
    on<HomeToProfileButtonClicked>(homeToProfileButtonClicked);
    on<HomeToCartButtonClicked>(homeToCartButtonClicked);
    on<HomeToRestaurantButtonClicked>(homeToRestaurantButtonClicked);
    on<HomeInitialEvent>(homeInitial);
    on<HomeProductWishlistButtonClicked>(homeProductWishlistButtonClicked);
  }

  void homeProductWishlistButtonClicked(
    HomeProductWishlistButtonClicked event,
    Emitter<HomeState> emit,
  ) {
    print("Home product wishlist button clicked!");
    emit(HomeProductWishlistState());
  }

  void homeToWishlistButtonClicked(
    HomeToWishlistButtonClicked event,
    Emitter<HomeState> emit,
  ) {
    print("Home to wishlist button clicked!");
    emit(HomeToWishlist());
  }

  void homeToProfileButtonClicked(
    HomeToProfileButtonClicked event,
    Emitter<HomeState> emit,
  ) {
    print("Home to profile button clicked!");
    emit(HomeToProfile());
  }

  void homeToCartButtonClicked(
    HomeToCartButtonClicked event,
    Emitter<HomeState> emit,
  ) {
    print("Home to cart button clicked!");
    emit(HomeToCart());
  }

  void homeToRestaurantButtonClicked(
    HomeToRestaurantButtonClicked event,
    Emitter<HomeState> emit,
  ) {
    print("Home to restaurant button clicked!");
    emit(HomeToRestaurant(restaurantDetails: event.restaurantDetails));
  }

  Future<void> homeInitial(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    await Future.delayed(const Duration(seconds: 5));
    emit(
      HomeLoaded(
        horizontalItems: RestaurantFoodData.horizontalItems.map((item) {
          return HorizonatalItemModels(
            name: item['name'],
            image: item['image'],
          );
        }).toList(),
        restaurants: RestaurantFoodData.restaurantDetails.map((detail) {
          return RestaurantDataModels(
            dishname: List<String>.from(detail['dishname']),
            imageurl: List<String>.from(detail['imageurl']),
            price: List<String>.from(detail['price']),
            description: List<String>.from(detail['description']),
            name: detail['name'],
            rating: detail['rating'],
            time: detail['time'],
            distance: detail['distance'],
            special: List<String>.from(detail['special']),
            offer: detail['offer'],
          );
        }).toList(),
      ),
    );
  }
}
