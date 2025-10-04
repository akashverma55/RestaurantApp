class RestaurantDataModels {
  final List<String> dishname;
  final List<String> imageurl;
  final List<String> price;
  final List<String> description;
  final String name;
  final String rating;
  final String time;
  final String distance;
  final List<String> special;
  final String offer;

  RestaurantDataModels({
    required this.dishname,
    required this.imageurl,
    required this.price,
    required this.description,
    required this.name,
    required this.rating,
    required this.time,
    required this.distance,
    required this.special,
    required this.offer});
}

class HorizonatalItemModels{
  final String name;
  final String image;
  HorizonatalItemModels({required this.name,required this.image});
}