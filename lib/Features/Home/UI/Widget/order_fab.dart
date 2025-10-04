import 'package:flutter/material.dart';
import 'package:restaurant_app/Features/Home/bloc/home_bloc.dart';
import 'package:restaurant_app/Features/restaurant_food/bloc/food_bloc.dart';

class OrderFAB extends StatelessWidget {
  const OrderFAB({
    super.key,
    this.homebloc,
    this.foodbloc,
  });

  final HomeBloc? homebloc;
  final FoodBloc? foodbloc;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      foregroundColor: Colors.white,
      backgroundColor: Colors.blueAccent,
      elevation: 10,
      onPressed: () => homebloc!=null? homebloc!.add(HomeToCartButtonClicked()): foodbloc!.add(OrderButtonClicked()),
      icon: Icon(Icons.fastfood, size: 30),
      label: Text("Order", style: TextStyle(fontSize: 24)),
    );
  }
}