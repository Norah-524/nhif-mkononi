import 'package:flutter/material.dart';

class BillsTable extends StatefulWidget {
  static var addRow;

  const BillsTable({super.key});

  @override
  State<BillsTable> createState() => _BillsTableState();
}

class _BillsTableState extends State<BillsTable> {
    List<DataRow> rows = [];

  void addRow() {
    setState(() {
      rows.add(
       DataRow(cells: <DataCell>[
       DataCell(Text('4')),
              DataCell(Text('9988123427')),
              DataCell(Text('50,400')),
              DataCell(Text('Pending')),
              DataCell(Text('24/6/2022')),
       ])
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                'SN',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Control number',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Amount',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Status',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Date paid',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('1')),
              DataCell(Text('996798972345')),
              DataCell(Text('50,400')),
              DataCell(Text('Paid')),
              DataCell(Text('12/3/2020')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2')),
              DataCell(Text('99446234554')),
              DataCell(Text('50,400')),
              DataCell(Text('Paid')),
              DataCell(Text('12/4/2021')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('3')),
              DataCell(Text('9988123427')),
              DataCell(Text('50,400')),
              DataCell(Text('Pending')),
              DataCell(Text('24/6/2022')),
            ],
          ),
        ],
      ),
    );
  }
}
