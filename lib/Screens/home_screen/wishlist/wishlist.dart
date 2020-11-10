import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/home_screen/featured/courseHeading.dart';
import 'package:udemy_clone/Screens/home_screen/wishlist/browseCategoryTile.dart';
import 'package:udemy_clone/Screens/shoppingCart/cart.dart';
import 'package:udemy_clone/services/dataController.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Wishlist',
          style: TextStyle(
              fontWeight: FontWeight.w300, color: Colors.white, fontSize: 30),
        ),
        actions: [
          IconButton(
            icon: Icon(EvaIcons.shoppingCartOutline, size: 30),
            onPressed: () {
              Get.to(ShoppingCart());
            },
          )
        ],
      ),
      body: GetBuilder<Datacontroller>(
          init: Datacontroller(),
          builder: (value) {
            return FutureBuilder(
                future: value.getData('Wishlist'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 12, bottom: 15),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                snapshot.data[index]
                                                    .data()['image'],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            constraints:
                                                BoxConstraints(maxWidth: 230),
                                            child: Text(
                                              snapshot.data[index]
                                                  .data()['title'],
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            constraints:
                                                BoxConstraints(maxWidth: 270),
                                            child: Text(
                                              snapshot.data[index]
                                                  .data()['author'],
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow[700],
                                                size: 20,
                                              ),
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow[700],
                                                size: 20,
                                              ),
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow[700],
                                                size: 20,
                                              ),
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow[700],
                                                size: 20,
                                              ),
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow[700],
                                                size: 20,
                                              ),
                                              SizedBox(width: 5),
                                              Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: 270),
                                                child: Text(
                                                  snapshot.data[index]
                                                      .data()['rating'],
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: 270),
                                                child: Text(
                                                  '(${snapshot.data[index].data()['enrolled']})',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey.shade600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            children: [
                                              Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: 270),
                                                child: Text(
                                                  '₹${snapshot.data[index].data()['price']}',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: 270),
                                                child: Text(
                                                  '₹${snapshot.data[index].data()['notPrice']}',
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontSize: 12,
                                                    color: Colors.white70,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: Colors.grey.shade600,
                                  thickness: 0.5,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 310,
                              width: 400,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    child: Icon(EvaIcons.shakeOutline),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      'Want to save something for later',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Your wishlist will go here.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey.shade400,
                                          fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            CourseHeading(title: 'Browse Caterogies'),
                            BrowseCategoryTile(
                              title: 'Finance and Accounting',
                              icon: Icon(EvaIcons.browserOutline,
                                  color: Colors.grey.shade600),
                            ),
                            BrowseCategoryTile(
                              title: 'Development',
                              icon: Icon(EvaIcons.hardDriveOutline,
                                  color: Colors.grey.shade600),
                            ),
                            BrowseCategoryTile(
                              title: 'Business',
                              icon: Icon(EvaIcons.briefcaseOutline,
                                  color: Colors.grey.shade600),
                            ),
                            BrowseCategoryTile(
                              title: 'IT and Software',
                              icon: Icon(
                                  FontAwesomeIcons.creativeCommonsSamplingPlus,
                                  color: Colors.grey.shade600),
                            ),
                            BrowseCategoryTile(
                              title: 'Office Productivity',
                              icon: Icon(FontAwesomeIcons.briefcase,
                                  color: Colors.grey.shade600),
                            ),
                            BrowseCategoryTile(
                              title: 'Personal Development',
                              icon: Icon(EvaIcons.personAddOutline,
                                  color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                });
          }),
    );
  }
}
