part of 'food_bloc.dart';

@immutable
sealed class FoodEvent {}

class OrderButtonClicked extends FoodEvent{}