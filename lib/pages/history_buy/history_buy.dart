import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryBuy extends StatefulWidget {
  const HistoryBuy({Key? key}) : super(key: key);

  @override
  State<HistoryBuy> createState() => _HistoryBuyState();
}

class _HistoryBuyState extends State<HistoryBuy> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('idorder');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Column(
          children: [
            Text("Mã đơn hàng: 0001"),
          ],
        ),
      ),
    );
  }
}
