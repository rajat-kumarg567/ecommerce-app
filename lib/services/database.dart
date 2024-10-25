import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  //get Collection of orders
  final CollectionReference orders=
  FirebaseFirestore.instance.collection('orders');

  //save order to database
Future<void> saveOrdeToDatabase(String receipt) async{
  await orders.add({
    'date':DateTime.now(),
    'order':receipt,
  });
}
}