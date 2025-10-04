import 'package:flutter/material.dart';
import 'package:restaurant_app/Features/Home/models/restaurant_data_models.dart';

class RestaurantFoodCard extends StatelessWidget {
  const RestaurantFoodCard({super.key, required this.restaurantDetails});
  final RestaurantDataModels restaurantDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.fastfood),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    restaurantDetails.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Text(
                        restaurantDetails.rating,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.star, size: 15, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.timer_sharp),
                Text(
                  " ${restaurantDetails.time} | ${restaurantDetails.distance} km",
                ),
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...restaurantDetails.special.map((special) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
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
                  }).toList(),
                ],
              ),
            ),
            Divider(),
            Row(
              children: [
                Icon(Icons.discount, color: Colors.blueAccent),
                SizedBox(width: 5),
                Text(
                  restaurantDetails.offer,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            Divider(),
            Text(
              "Recommended for you",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: restaurantDetails.imageurl.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(restaurantDetails.dishname[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),),
                              Text("₹${restaurantDetails.price[index]}",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                              SizedBox(height: 10),
                              Text(restaurantDetails.description[index],style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black.withOpacity(.7)
                              ),maxLines: 3,overflow: TextOverflow.ellipsis,),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_outline)),
                                  SizedBox(width: 5),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.share_sharp)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: 210,
                              width: 180,
                            ),
                            Positioned(
                              child: Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network(restaurantDetails.imageurl[index],fit: BoxFit.cover,))
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: FractionallySizedBox(
                                  widthFactor: 0.7,
                                  child: GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      height: 50,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.red[50],
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: Colors.red,width: 2),
                                      ),
                                      child: Center(
                                        child: Text("ADD",style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            )
          ],
        ),
      ),
    );
    
  }
}
