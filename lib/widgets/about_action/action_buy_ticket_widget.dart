// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:online_library/widgets/about_action/tables_widget.dart';
import 'package:online_library/widgets/style_button_widget.dart';

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
    return ListView(physics: const BouncingScrollPhysics(), children: [
      Center(
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
                          icon: const Icon(Icons.swap_vert_rounded),
                          iconSize: 2,
                          iconDisabledColor: AppColors.mainYellow,
                          value: selectedItem,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              selectedItem = newValue;
                            }
                          },
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 15),
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
                            offset: const Offset(0, 3), // Offset
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
              height: 400,
              width: double.infinity,
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(10.0),
                minScale: 0.1,
                maxScale: 1.6,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('1'),
                        Text('2'),
                        Text('3'),
                        Text('4'),
                        Text('5'),
                        Text('6'),
                        Text('7'),
                        Text('8'),
                        Text('9'),
                        Text('10'),
                        Text('11'),
                        Text('12'),
                        Text('13'),
                      ],
                    ),
                    Column(
                      children: [
                        TablesWidget(),
                        TablesWidget(),
                        TablesWidget(),
                        TablesWidget(),
                        TablesWidget(),
                        TablesWidget(),
                        TablesWidget(),
                        TablesWidget(),
                        TablesWidget(),
                        TablesWidget(),
                        TablesWidget(),
                        TablesWidget(),
                        TablesWidget(),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: StyleButtonWidget(
            buttonName: 'Bilet almak',
            onTap: () {
              Get.toNamed('/buyTicketPage');
            },
            buttonColor: AppColors.mainBlue,
            buttonBorderColor: AppColors.mainBlue,
            buttonTextColor: AppColors.mainWhite),
      )
    ]);
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
