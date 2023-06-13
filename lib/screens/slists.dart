import 'package:flutter/material.dart';
import '../modules/servicelist.dart';

class Members extends StatelessWidget {
  const Members({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NHIF Memberships'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: memberships.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  memberships[index].head,
                  textAlign: TextAlign.justify,
                ),
              );
            }),
      ),
    );
  }
}

class Benefit extends StatelessWidget {
  const Benefit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Benefit packages'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: Bpacks.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.arrow_forward_ios),
                title: Text(
                  Bpacks[index].head,
                  textAlign: TextAlign.justify,
                ),
              );
            }),
      ),
    );
  }
}

class Additional extends StatelessWidget {
  const Additional({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Additional Packages'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: Apacks.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  Apacks[index].head,
                  textAlign: TextAlign.justify,
                ),
              );
            }),
      ),
    );
  }
}
