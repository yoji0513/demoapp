import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twitter_demoapp/home/post.dart';

class HomeModel extends ChangeNotifier {
  List<Post> postList = [];
  String newPostText = '';
  String newPostImage = '';

  Future getTodoList() async {
    final snapshot =
    await FirebaseFirestore.instance.collection('postList').get();
    final docs = snapshot.docs;
    final postList = docs.map((doc) => Post(doc)).toList();
    this.postList = postList;
    notifyListeners();
  }

  void getTodoListRealtime() {
    final snapshots =
      FirebaseFirestore.instance.collection('postList').snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Post(doc)).toList();
      todoList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      this.postList = todoList;
      notifyListeners();
    });
  }

  Future add() async {
    final collection = FirebaseFirestore.instance.collection('postList');
    await collection.add({
      'title': newPostText,
      'image': newPostImage,
      'createdAt': Timestamp.now(),
    });
  }

  void reload() {
    notifyListeners();
  }
}