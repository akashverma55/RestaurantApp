import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/Features/Home/UI/Widget/restaurant_card_details.dart';
import 'package:restaurant_app/Features/Home/bloc/home_bloc.dart';
import 'package:restaurant_app/Features/Home/models/restaurant_data_models.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({super.key, required this.restaurantsDetails, required this.homebloc});

  final RestaurantDataModels restaurantsDetails;
  final HomeBloc homebloc;

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(4, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: SizedBox(
              height: 230,
              child: Stack(
                children: [
                  CarouselSlider(
                    items: widget.restaurantsDetails.imageurl.map<Widget>((
                      image,
                    ) {
                      return Image.network(
                        image,
                        fit: BoxFit.cover,
                        height: 230,
                        width: double.infinity,
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      viewportFraction: 1,
                      enlargeCenterPage: false,
                      height: 230,
                      onPageChanged: (index, reason) => setState(() {
                        _currentImageIndex = index;
                      }),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "${widget.restaurantsDetails.dishname[_currentImageIndex]} - Rs. ${widget.restaurantsDetails.price[_currentImageIndex]}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      onPressed: () {
                        widget.homebloc.add(HomeProductWishlistButtonClicked(restaurantDataToWishlist:widget.restaurantsDetails));
                      },
                      icon: Icon(Icons.bookmark_add_outlined),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          RestaurantCardDetails(restaurantDetails: widget.restaurantsDetails),
        ],
      ),
    );
  }
}