import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial()) {
    on<OrderButtonClicked>(orderButtonClicked);
  }

  void orderButtonClicked(OrderButtonClicked event, Emitter<FoodState> emit ){
    print("Order Button Clicked from food menu page");
    emit(FoodMenuToOrder());
  }
}
