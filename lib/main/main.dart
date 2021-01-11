import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_demoapp/login/login_page.dart';
import 'package:twitter_demoapp/main/main_model.dart';
import 'package:twitter_demoapp/signup/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'デモアプリ',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('デモアププリ'),
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Center(
              child: Column(
                children: [
                  RaisedButton(
                    child: Text('新規登録'),
                    onPressed: () {
                      // ここでなにか
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text('ログイン'),
                    onPressed: () {
                      // ここでなにか
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}