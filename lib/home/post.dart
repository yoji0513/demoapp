import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  Post(DocumentSnapshot doc) {
    this.documentReference = doc.reference;

    this.title = doc.data()['title'];

    final Timestamp timestamp = doc.data()['createdAt'];
    this.createdAt = timestamp.toDate();
  }

  String title;
  DateTime createdAt;
  DocumentReference documentReference;
}