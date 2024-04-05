import 'package:flutter/material.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:online_library/widgets/about_action/tables_widget.dart';

class ActionTimeDescriptionPage extends StatefulWidget {
  const ActionTimeDescriptionPage({super.key});

  @override
  State<ActionTimeDescriptionPage> createState() =>
      _ActionTimeDescriptionPageState();
}

class _ActionTimeDescriptionPageState extends State<ActionTimeDescriptionPage> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  final List<String> items = [
    '15:00',
    '17:00',
    '19:00',
  ];
  String selectedItem = '15:00';

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}-${now.month}-${now.year}';
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.calendar_month),
                      Text('$formattedDate'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.swap_vert_rounded),
                      DropdownButton<String>(
                        icon: Icon(Icons.swap_vert_rounded),
                        iconSize: 2,
                        iconDisabledColor: AppColors.mainYellow,
                        value: selectedItem,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            selectedItem = newValue;
                          }
                        },
                        items:
                            items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 15),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SwitchExample(),
                      Text('Diňe uly'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: AppColors.mainBlue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(width: 5),
                  const Text('Boş'),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.mainBlue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: AppColors.mainYellow,
                        size: 14.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text('Satylan'),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: AppColors.mainYellow,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(width: 5),
                  const Text('Saýlanan'),
                ],
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text('Sahna'),
                  const SizedBox(height: 4),
                  Container(
                    width: 300,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.mainBlue,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.mainYellow, // Shadow color
                          spreadRadius: 0, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: Offset(0, 3), // Offset
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 500,
            width: double.infinity,
            child: TablesWidget(),
          )
        ],
      ),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light0 = true;
  bool light1 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
          thumbIcon: thumbIcon,
          value: light1,
          onChanged: (bool value) {
            setState(() {
              light1 = value;
            });
          },
        ),
      ],
    );
  }
}

// DataTable(
//             columns: const <DataColumn>[
//               DataColumn(label: Text('Wagt')),
//               DataColumn(label: Text('Çagalar')),
//               DataColumn(label: Text('Ulular')),
//               DataColumn(label: Text('VIP')),
//             ],
//             rows: const <DataRow>[
//               DataRow(
//                 cells: [
//                   DataCell(Text('15:00')),
//                   DataCell(Text('15 TMT')),
//                   DataCell(Text('20 TMT')),
//                   DataCell(Text('50 TMT')),
//                 ],
//               ),
//               DataRow(
//                 cells: <DataCell>[
//                   DataCell(Text('17:00')),
//                   DataCell(Text('15 TMT')),
//                   DataCell(Text('20 TMT')),
//                   DataCell(Text('50 TMT')),
//                 ],
//               ),
//               DataRow(
//                 cells: <DataCell>[
//                   DataCell(Text('19:00')),
//                   DataCell(Text('15 TMT')),
//                   DataCell(Text('20 TMT')),
//                   DataCell(Text('50 TMT')),
//                 ],
//               ),
//             ],
//           ),

// Table(
//             border: TableBorder.all(),
//             children: <TableRow>[
//               TableRow(
//                 children: <Widget>[
//                   Container(
//                     child: Center(child: Text('Wagt')),
//                   ),
//                   Container(
//                     child: Center(child: Text('Çagalar')),
//                   ),
//                   Container(
//                     child: Center(child: Text('Ulular')),
//                   ),
//                   Container(
//                     child: Center(child: Text('VIP')),
//                   ),
//                 ],
//               ),
//               TableRow(
//                 children: <Widget>[
//                   Container(
//                     height: 70,
//                     child: Center(child: Text('15:00')),
//                   ),
//                   Container(
//                     height: 30,
//                     child: Center(child: Text('20 TMT')),
//                   ),
//                   Container(
//                     height: 30,
//                     child: Center(child: Text('30 TMT')),
//                   ),
//                   Container(
//                     height: 30,
//                     child: Center(child: Text('50 TMT')),
//                   )
//                 ],
//               ),
//               TableRow(
//                 children: <Widget>[
//                   Container(
//                     height: 30,
//                     child: Center(child: Text('17:00')),
//                   ),
//                   Container(
//                     height: 30,
//                     child: Center(child: Text('20 TMT')),
//                   ),
//                   Container(
//                     height: 30,
//                     child: Center(child: Text('30 TMT')),
//                   ),
//                   Container(
//                     height: 30,
//                     child: Center(child: Text('50 TMT')),
//                   )
//                 ],
//               ),
//               TableRow(
//                 children: <Widget>[
//                   Container(
//                     height: 30,
//                     child: Center(child: Text('19:00')),
//                   ),
//                   Container(
//                     height: 30,
//                     child: Center(child: Text('20 TMT')),
//                   ),
//                   Container(
//                     height: 30,
//                     child: Center(child: Text('30 TMT')),
//                   ),
//                   Container(
//                     height: 30,
//                     child: Center(child: Text('50 TMT')),
//                   )
//                 ],
//               ),
//             ],
//           )
