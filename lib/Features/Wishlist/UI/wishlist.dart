import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Features/Wishlist/bloc/wishlist_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BookMarked Restaurants'), centerTitle: true),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        bloc: wishlistBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WishlistLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WishlistLoadedState) {
            final wishlistItems = state.wishlistItem;
            return Padding(
              padding: EdgeInsets.all(15),
              child: ListView.separated(
                itemCount: wishlistItems.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Column(
                      children: [
                        SizedBox(height: 10),
                        Divider(color: Colors.black,),
                        SizedBox(height: 10),
                      ],
                    ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                          color: Colors.black.withOpacity(.1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                wishlistItems[index].name,
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
                                    wishlistItems[index].rating,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.white,
                                  ),
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
                              " ${wishlistItems[index].time} | ${wishlistItems[index].distance} km",
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ...wishlistItems[index].special.map((special) {
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
                              wishlistItems[index].offer,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (State is WishlistErrorState) {
            return Center(child: Text("Failed to load bookmarked restaurant"));
          } else {
            return Center(child: Text("No Bookmarked Restaurant"));
          }
        },
      ),
    );
  }
}
