import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Data/restaurant_food.dart';
import 'package:restaurant_app/Features/Home/UI/Widget/restaurant_card_details.dart';
import 'package:restaurant_app/Features/Home/bloc/home_bloc.dart';
import 'package:restaurant_app/Features/Profile/profile.dart';
import 'package:restaurant_app/Features/restaurant_food/UI/restaurant_food_detail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> images = RestaurantFoodData.images;
  final List<Map<String, dynamic>> category =
      RestaurantFoodData.horizontalItems;
  final List<Map<String, dynamic>> restaurantsDetails =
      RestaurantFoodData.restaurantDetails;
  final HomeBloc homebloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeAction,
      buildWhen: (previous, current) => current is! HomeAction,
      listener: (context, state) {
        if (state is HomeToProfile) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
        } else if (state is HomeToRestaurant) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantFoodCard(
                restaurantDetails: restaurantsDetails[state.index],
              ),
            ),
          );
        }
        else if(state is HomeToWishlist){

        }
        else if(state is HomeToCart){
          
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.black,
                elevation: 3,
                pinned: false,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      SizedBox.expand(
                        child: CarouselSlider(
                          items: images
                              .map(
                                (image) => Image.network(
                                  image,
                                  fit: BoxFit.fill,
                                  height: 300,
                                  width: double.infinity,
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            viewportFraction: 1,
                            enlargeCenterPage: false,
                            height: double.infinity,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: 15,
                        right: 15,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(.9),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Hello, Akash!",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "What Craves You Today!",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  homebloc.add(HomeToWishlistButtonClicked());
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.bookmark,
                                    color: Colors.blueAccent,
                                    size: 24,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  homebloc.add(HomeToProfileButtonClicked());
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    "A",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 2,
                pinned: true,
                titleSpacing: 0,
                title: const SearchBar(),
                toolbarHeight: 80,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(150),
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        final item = category[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: Column(
                              children: [
                                Image.network(
                                  item["image"],
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  item["name"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: item["name"] == "See All"
                                        ? Colors.blueAccent
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Restaurants Near You",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((
                  BuildContext context,
                  int index,
                ) {
                  return GestureDetector(
                    onTap: () {
                      homebloc.add(HomeToRestaurantButtonClicked(index: index));
                    },
                    child: RestaurantCard(
                      restaurantsDetails: restaurantsDetails[index],
                    ),
                  );
                }, childCount: restaurantsDetails.length),
              ),
            ],
          ),
        );
      },
    );
  }
}

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({super.key, required this.restaurantsDetails});

  final Map<String, dynamic> restaurantsDetails;

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
                    items: widget.restaurantsDetails["imageurl"].map<Widget>((
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
                        "${widget.restaurantsDetails["dishname"][_currentImageIndex]} - Rs. ${widget.restaurantsDetails["price"][_currentImageIndex]}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      onPressed: () {},
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

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.grey[200],
      padding: const EdgeInsets.only(right: 10.0, left: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search....",
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.blueAccent,
                  size: 30,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[500],
              minimumSize: Size(100, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Icon(
              Icons.filter_list_rounded,
              color: Colors.white,
              size: 20,
            ),
            label: const Text(
              "Filter",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
