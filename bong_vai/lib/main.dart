import 'package:bong_vai/view_models/user_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/MainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserListViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MainScreen(),
      ),
    );
  }
}
