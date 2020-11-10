import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/detailScreen/detailScreen.dart';
import 'package:udemy_clone/services/dataController.dart';

class CourseTemplate extends StatelessWidget {
  final String courseName;
  const CourseTemplate({
    Key key,
    this.courseName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      child: GetBuilder<Datacontroller>(
        init: Datacontroller(),
        builder: (value) {
          return FutureBuilder(
            future: value.getData(courseName),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return MaterialButton(
                      splashColor: Colors.red,
                      onPressed: () {
                        Get.to(DetailScreen(), arguments: snapshot.data[index]);
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 110,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      snapshot.data[index].data()['image'],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 200),
                                child: Text(
                                  snapshot.data[index].data()['title'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 4),
                              child: Container(
                                child: Text(
                                  snapshot.data[index].data()['author'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey.shade400,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 4),
                              child: Row(
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
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 3, top: 3),
                                    child: Text(
                                      snapshot.data[index].data()['rating'],
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 3, top: 3),
                                    child: Text(
                                      '(${snapshot.data[index].data()['enrolled']})',
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 13.0, top: 4),
                              child: Row(
                                children: [
                                  Text(
                                    '₹${snapshot.data[index].data()['price']}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    '₹${snapshot.data[index].data()['notPrice']}',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.white70,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 11, top: 4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Container(
                                  color: Colors.yellow[200],
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'Bestseller',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
            },
          );
        },
      ),
    );
  }
}
