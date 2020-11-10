import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/home_screen/featured/courseHeading.dart';
import 'package:udemy_clone/Screens/home_screen/featured/courseTemplate.dart';
import 'package:udemy_clone/Screens/shoppingCart/cart.dart';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(EvaIcons.shoppingCartOutline, size: 30),
            onPressed: () {
              Get.to(ShoppingCart());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/sale1.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.repeated,
                      colors: [
                        Colors.black,
                        Colors.yellow,
                      ],
                    ),
                  ),
                  height: 80,
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Courses now on sale',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '1 Day left',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              CourseHeading(title: 'Featured'),
              CourseTemplate(courseName: 'Featured'),
              CourseHeading(title: 'Top Courses in Design'),
              CourseTemplate(courseName: 'Design'),
              CourseHeading(title: 'Devepoler Courses'),
              CourseTemplate(courseName: 'Development'),
              CourseHeading(title: 'Top rated'),
              CourseTemplate(courseName: 'Top'),
            ],
          ),
        ),
      ),
    );
  }
}
