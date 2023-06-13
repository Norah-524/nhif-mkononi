import 'package:flutter/material.dart';

class VisitList extends StatefulWidget {
  const VisitList({super.key});

  @override
  State<VisitList> createState() => _VisitListState();
}

class _VisitListState extends State<VisitList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wertgh'),
      ),
      body: ListTile(
        title: Text('Health Centre Visit'),
      ),
    );
  }
}
