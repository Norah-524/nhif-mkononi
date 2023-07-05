// import 'package:flutter/material.dart';

// class VisitList extends StatefulWidget {
//   const VisitList({super.key});

//   @override
//   State<VisitList> createState() => _VisitListState();
// }

// class _VisitListState extends State<VisitList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('wertgh'),
//       ),
//       body:ExpansionPanel(headerBuilder: headerBuilder, body: body)
//       //  ListTile(
//       //   title: Text('Health Centre Visit'),
//       // ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MyExpandedPanel extends StatefulWidget {
  @override
  _MyExpandedPanelState createState() => _MyExpandedPanelState();
}

class _MyExpandedPanelState extends State<MyExpandedPanel> {
  List<Item> _items = generateItems(3);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _items.map<Widget>((Item item) {
        return ExpansionPanelList(
          elevation: 1,
          expandedHeaderPadding: EdgeInsets.all(0),
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              item.isExpanded = !isExpanded;
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.headerValue),
                );
              },
              body: ListTile(
                title: Text(item.expandedValue),
              ),
              isExpanded: item.isExpanded,
            ),
          ],
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
