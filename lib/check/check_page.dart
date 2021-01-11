import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_demoapp/check/check_model.dart';
import 'package:twitter_demoapp/login/login_page.dart';
import 'package:twitter_demoapp/signup/signup_page.dart';

void main() => runApp(CheckPage());

class CheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      title: 'Twitter',
      home: ChangeNotifierProvider<CheckModel>(
        create: (_) => CheckModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Twitter'),
          ),
          body: Consumer<CheckModel>(builder: (context, model, child) {
            return Center(
              child: Column(
                children: [
                  RaisedButton(
                    child: Text('新規登録'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text('ログイン'),
                    onPressed: () {
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