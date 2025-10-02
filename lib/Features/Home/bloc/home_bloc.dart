import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeToWishlistButtonClicked>(homeToWishlistButtonClicked);
    on<HomeToProfileButtonClicked>(homeToProfileButtonClicked);
    on<HomeToCartButtonClicked>(homeToCartButtonClicked);
    on<HomeToRestaurantButtonClicked>(homeToRestaurantButtonClicked);
  }
  
  void homeToWishlistButtonClicked(HomeToWishlistButtonClicked event, Emitter<HomeState> emit) {
    print("Home to wishlist button clicked!");
    emit(HomeToWishlist());
  }
  void homeToProfileButtonClicked(HomeToProfileButtonClicked event, Emitter<HomeState> emit) {
    print("Home to profile button clicked!");
    emit(HomeToProfile());
  }
  void homeToCartButtonClicked(HomeToCartButtonClicked event, Emitter<HomeState> emit){
    print("Home to cart button clicked!");
    emit(HomeToCart());
  }
  void homeToRestaurantButtonClicked(HomeToRestaurantButtonClicked event, Emitter<HomeState> emit){
    print("Home to restaurant button clicked!");
    emit(HomeToRestaurant(index: event.index));
  }
}
