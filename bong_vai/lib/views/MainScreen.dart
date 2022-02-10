import 'package:bong_vai/models/user.dart';
import 'package:bong_vai/view_models/user_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

Stream<int> stream() {
  Duration delaytime = Duration(seconds: 1);
  Stream<int> stream = Stream<int>.periodic(delaytime, makeNumber);
  return stream;
}

void testGet() {
  Get.snackbar('title', 'message');
}

class MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserListViewModel>(context, listen: false).fetchUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: StreamBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Text('done');
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Text(
                          'waiting',
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        );
                      }
                      return Text(
                        snapshot.data.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      );
                    },
                    stream: null,
                  ),
                ),
                color: Colors.teal[600],
              ),
              SizedBox(
                height: 10,
              ),
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
    final userListOnProvider = Provider.of<UserListViewModel>(context);

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
                      "Contacts",
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Contacts",
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
            child: userListOnProvider.userList.length != 0
                ? ListView.builder(
                    itemCount: userListOnProvider.userList.length,
                    itemBuilder: (context, index) {
                      return listItem(userListOnProvider.userList[index]);
                    },
                  )
                : Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(),
                    ),
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

  Widget listItem(User user) {
    return Card(
      elevation: 1,
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: CircleAvatar(
                maxRadius: 20,
                backgroundColor: Colors.black,
                child: Image(
                    height: 100, image: NetworkImage(user.picture.medium)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name.last + " " + user.name.first),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      user.phone,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
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

int makeNumber(int computationCount) => (computationCount + 1);
