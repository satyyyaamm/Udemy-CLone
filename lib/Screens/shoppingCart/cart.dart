import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/services/dataController.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Cart',
          style: TextStyle(
              fontWeight: FontWeight.w300, color: Colors.white, fontSize: 30),
        ),
      ),
      body: GetBuilder<Datacontroller>(
        init: Datacontroller(),
        builder: (value) {
          return FutureBuilder(
              future: value.getData('Addtocart'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                              constraints:
                                                  BoxConstraints(maxWidth: 270),
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
                                              constraints:
                                                  BoxConstraints(maxWidth: 270),
                                              child: Text(
                                                '(${snapshot.data[index].data()['enrolled']})',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                                icon: Icon(Icons.delete),
                                                onPressed: () {},
                                                color: Colors.grey)
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          children: [
                                            Container(
                                              constraints:
                                                  BoxConstraints(maxWidth: 270),
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
                                              constraints:
                                                  BoxConstraints(maxWidth: 270),
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
                }
              });
        },
      ),
    );
  }
}
