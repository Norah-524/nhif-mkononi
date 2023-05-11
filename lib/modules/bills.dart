import 'package:flutter/material.dart';

class BillsTable extends StatefulWidget {
  const BillsTable({super.key});

  @override
  State<BillsTable> createState() => _BillsTableState();
}

class _BillsTableState extends State<BillsTable> {
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
              DataCell(Text('4667989723456')),
              DataCell(Text('50,400')),
              DataCell(Text('Paid')),
              DataCell(Text('12/3/2019')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2')),
              DataCell(Text('994462345543')),
              DataCell(Text('50,400')),
              DataCell(Text('Paid')),
              DataCell(Text('12/4/2020')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('3')),
              DataCell(Text('9988123427')),
              DataCell(Text('50,400')),
              DataCell(Text('Pending')),
              DataCell(Text('24/6/2021')),
            ],
          ),
        ],
      ),
    );
  }
}
