import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/detailScreen/addToButton.dart';
import 'package:udemy_clone/Screens/detailScreen/deatailPageChips.dart';
import 'package:udemy_clone/Screens/shoppingCart/cart.dart';
import 'package:udemy_clone/Video/videoPlayer.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(icon: Icon(EvaIcons.share), onPressed: () {}),
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                Get.arguments['title'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  Get.arguments['description'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Row(
                      children: [
                        DetailPageChips(
                          icon: Icon(EvaIcons.star,
                              color: Colors.white, size: 15),
                          title: Get.arguments['rating'],
                        ),
                        SizedBox(width: 7),
                        DetailPageChips(
                          icon:
                              Icon(Icons.person, color: Colors.white, size: 15),
                          title: '${Get.arguments['enrolled']} enrolled',
                        ),
                        SizedBox(width: 7),
                        DetailPageChips(
                          icon: Icon(Icons.play_arrow_rounded,
                              color: Colors.white, size: 15),
                          title: '${Get.arguments['hoursWatched']} total hours',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        DetailPageChips(
                          hasIcon: false,
                          title: 'Created by ${Get.arguments['author']} ',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Row(
                      children: [
                        DetailPageChips(
                          hasIcon: false,
                          title: 'Updated ${Get.arguments['updated']} ',
                        ),
                        SizedBox(width: 7),
                        DetailPageChips(
                          hasIcon: false,
                          title: ' ${Get.arguments['language']} ',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(
                    Container(
                      child: VideoDisplay(
                        videoUrl: Get.arguments['video'],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 200,
                    width: 400,
                    child: Stack(
                      children: [
                        Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black38, BlendMode.darken),
                              image: NetworkImage(
                                Get.arguments['image'],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 100,
                          top: 50,
                          child: Icon(Icons.play_arrow,
                              color: Colors.white, size: 100),
                        ),
                        Positioned(
                          left: 60,
                          top: 150,
                          child: Text(
                            'Preview this course',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      "₹${Get.arguments['price']}",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "₹${Get.arguments['notPrice']}",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade300,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
              ),
              MaterialButton(
                splashColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 130),
                color: Colors.redAccent.shade200,
                onPressed: () {},
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  AddToButton(
                    title: "ADD TO CART",
                    onpressed: () async {
                      await FirebaseFirestore.instance
                          .collection('Addtocart')
                          .add({
                        'title': Get.arguments['title'],
                        'image': Get.arguments['image'],
                        'author': Get.arguments['author'],
                        'rating': Get.arguments['rating'],
                        'price': Get.arguments['price'],
                        'notPrice': Get.arguments['notPrice'],
                        'enrolled': Get.arguments['enrolled'],
                      }).whenComplete(() {
                        Get.snackbar('Congratulations!', 'Course added to cart',
                            colorText: Colors.black,
                            snackPosition: SnackPosition.BOTTOM);
                      });
                    },
                  ),
                  AddToButton(
                    title: "ADD TO WISHLIST",
                    onpressed: () async {
                      await FirebaseFirestore.instance
                          .collection('Wishlist')
                          .add({
                        'title': Get.arguments['title'],
                        'image': Get.arguments['image'],
                        'author': Get.arguments['author'],
                        'rating': Get.arguments['rating'],
                        'price': Get.arguments['price'],
                        'notPrice': Get.arguments['notPrice'],
                        'enrolled': Get.arguments['enrolled'],
                      }).whenComplete(() {
                        Get.snackbar(
                            'Congratulations!', 'Course added to Wishlist',
                            colorText: Colors.black,
                            snackPosition: SnackPosition.BOTTOM);
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
