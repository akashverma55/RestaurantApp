import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app/Data/wishlist_order_data.dart';
import 'package:restaurant_app/Features/Home/models/restaurant_data_models.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitialState()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
  }

  Future<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) async{
  	emit(WishlistLoadingState());
    await Future.delayed(Duration(seconds: 5));
    emit(
      WishlistLoadedState(
        wishlistItem: WishlistOrderData.wishlistRestaurantList.map((item){
      return RestaurantDataModels(
        dishname: List<String>.from(item.dishname),
            imageurl: List<String>.from(item.imageurl),
            price: List<String>.from(item.price),
            description: List<String>.from(item.description),
            name: item.name,
            rating: item.rating,
            time: item.time,
            distance: item.distance,
            special: List<String>.from(item.special),
            offer: item.offer,
      );
    }).toList()));
  }
}
