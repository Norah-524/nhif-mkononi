import 'package:flutter/material.dart';
import 'package:nhif_app/modules/bills.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  BillsTable billsTable = BillsTable();

  List<DataRow> dataRows = <DataRow>[
    DataRow(
      cells: <DataCell>[
        DataCell(Text('1')),
        DataCell(Text('996798972345')),
        DataCell(Text('50,400')),
        DataCell(Text('Paid')),
        DataCell(Text('12/8/2021')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('99446234554')),
        DataCell(Text('50,400')),
        DataCell(Text('Paid')),
        DataCell(Text('15/10/2022')),
      ],
    ),
   
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Request for control number',
                style: TextStyle(fontSize: 15.0)),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    dataRows.add(
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('3')),
                          DataCell(Text('9988123427')),
                          DataCell(Text('50,400')),
                          DataCell(Text('Pending')),
                          DataCell(Text('6/7/2023')),
                        ],
                      ),
                    );
                  });
                  final snackBar = SnackBar(
                      //backgroundColor: Colors.black,
                      content: const Text('''Generated control number'''),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          dataRows.removeLast();
                        },
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Icon(
                  Icons.add,
                  color: Colors.indigo,
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.indigo.shade50),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.indigo)))),
              ),
            ),
            DataTable(
              columns: const [
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
              rows: dataRows,
            ),
          ],
        ),
      ),
    );
  }
}
