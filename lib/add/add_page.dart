
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_demoapp/home/home_model.dart';

class AddPage extends StatelessWidget {
  final HomeModel model;
  AddPage(this.model);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>.value(
      value: model,
      child: Scaffold(
        appBar: AppBar(
          title: Text('新規追加'),
        ),
        body: Consumer<HomeModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: '投稿メッセージ'),
                  keyboardType: TextInputType.multiline,
                  onChanged: (text) {
                    model.newPostText = text;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  child: Text('upload'),
                  onPressed: (){},
                ),
                RaisedButton(
                  child: Text('追加する'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () async {
                    await model.add();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}