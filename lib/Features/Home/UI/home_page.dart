import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:restaurant_app/Data/restaurant_food.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> images = RestaurantFoodData.images;
  List<Map<String, dynamic>> category = RestaurantFoodData.horizontalItems;
  List<Map<String,dynamic>> restaurantsDetails = RestaurantFoodData.restaurantDetails;

  @override
  Widget build(BuildContext context) {
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
                        autoPlayInterval: Duration(seconds: 2),
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
                          const CircleAvatar(child: Icon(Icons.notifications)),
                          const SizedBox(width: 10),
                          const CircleAvatar(child: Text("A")),
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
              preferredSize: const Size.fromHeight(
                150,
              ), // Height must be set here
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: category.map((item) {
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
                  }).toList(),
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
                onTap: (){},
                child: Container(
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
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Image.network(
                              "https://th.bing.com/th/id/OIP.x_6jJlk3tTjcgwv7FvxEygHaE7?w=297&h=198&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                              height: 230,
                              width: double.infinity,
                              fit: BoxFit.cover,
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
                                child: Text("Veg Biryani - Rs. 200", style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              child: IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_add_outlined), color: Colors.white)
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text(restaurantsDetails[index]["name"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24), overflow: TextOverflow.ellipsis,)),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(restaurantsDetails[index]["rating"], style: TextStyle(color: Colors.white,fontSize: 16),),
                                      SizedBox(width: 5),
                                      Icon(Icons.star, size: 15,color: Colors.white,)
                                    ],
                                  )
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.timer_sharp),
                                Text(" ${restaurantsDetails[index]["time"]} | ${restaurantsDetails[index]["distance"]} km"),
                              ],
                            ),
                            SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [...restaurantsDetails[index]["special"].map((special){
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color:Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.check, color: Colors.green),
                                          Text(special),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList()]
                              ),
                            ),
                            Divider(indent: 5,endIndent: 5),
                            Row(
                              children: [
                                Icon(Icons.discount, color: Colors.blueAccent),
                                SizedBox(width: 5),
                                Text(restaurantsDetails[index]["offer"],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }, childCount: restaurantsDetails.length),
          ),
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
                borderRadius: BorderRadiusGeometry.circular(10),
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
