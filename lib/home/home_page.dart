import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_demoapp/add/add_page.dart';
import 'package:twitter_demoapp/home/home_model.dart';

void main() {
  runApp(MaterialApp(
    title: 'Twitter',
    home: HomePage(),
  ));
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (_) => HomeModel()..getTodoListRealtime(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Twitter'),
          actions: [
          ],
        ),
        body: Consumer<HomeModel>(builder: (context, model, child) {
          final postList = model.postList;
          return ListView(
            children: postList
                .map(
                  (post) => ListTile(
                title: Text(post.title),
              ),
            )
                .toList(),
          );
        }),
        floatingActionButton:
        Consumer<HomeModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPage(model),
                  fullscreenDialog: true,
                ),
              );
            },
            child: Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
