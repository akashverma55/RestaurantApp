part of 'food_bloc.dart';

@immutable
sealed class FoodState {}

abstract class FoodAction extends FoodState {}

final class FoodInitial extends FoodState {}

final class FoodMenuToOrder extends FoodAction {}
