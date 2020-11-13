import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/detailScreen/detailScreen.dart';
import 'package:udemy_clone/services/dataController.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExecuted = false;

  @override
  Widget build(BuildContext context) {
    Widget searchData() {
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(DetailScreen(),
                  transition: Transition.downToUp,
                  arguments: snapshotData.docs[index]);
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(snapshotData.docs[index].data()['image']),
              ),
              title: Text(
                snapshotData.docs[index].data()['title'],
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              subtitle: Text(
                snapshotData.docs[index].data()['author'],
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(08),
          ),
          child: GetBuilder<Datacontroller>(
            init: Datacontroller(),
            builder: (val) {
              return TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.red,
                controller: searchController,
                onEditingComplete: () {
                  val
                      .queryData(searchController.text)
                      .then((value) => snapshotData = value);
                  setState(() {
                    isExecuted = true;
                  });
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                  border: InputBorder.none,
                  hintText: 'Search Courses',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) {
          if (snapshotData == null) {
            return Container(
              child: Center(
                child: Text(
                  'Search All Courses',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
            );
          }
          if (snapshotData != null) {
            return searchData();
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
