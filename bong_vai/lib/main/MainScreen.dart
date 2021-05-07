import 'dart:ui';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            children: [
              listbody(),
              SizedBox(
                height: 10,
              ),
              listbody(),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(
            onPressed: () {},
            color: Colors.grey[800],
          ),
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(32)),
                margin: EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  backgroundImage: NetworkImage("https://picsum.photos/200"),
                ),
              ),
              Expanded(
                flex: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bông vải",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Sâu hại và Bệnh cây",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 30,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Tất cả cây trồng",
                    style: TextStyle(
                        color: Colors.teal[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget listbody() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          // phần trên - list cây trồng
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Có thể xuất hiện trong",
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Giai đoạn cây trồng",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: Image(
                  height: 60,
                  image: NetworkImage("https://picsum.photos/200"),
                ),
              ),
            ],
          ),
          // list cây trồng
          SizedBox(
            height: 10,
          ),
          Container(
            height: 500,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return listItem();
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            width: 200,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "Hiển thị thêm",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(15),
                ),
                foregroundColor: MaterialStateProperty.all(Colors.green[900]),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem() {
    return Card(
      elevation: 1,
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: Image(
                height: 100,
                width: 200,
                image: NetworkImage("https://picsum.photos/500"),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nấm"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Bệnh thối rễ Bông vải",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.chevron_right_outlined),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
