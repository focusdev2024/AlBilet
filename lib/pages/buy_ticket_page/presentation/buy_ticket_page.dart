import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';

class BuyTicketPage extends StatefulWidget {
  const BuyTicketPage({super.key});

  @override
  State<BuyTicketPage> createState() => _BuyTicketPageState();
}

class _BuyTicketPageState extends State<BuyTicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(
          'Satyn almak',
          style: TextStyle(color: AppColors.mainWhite),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                children: [
                  Text(
                    'Государственный цирк имени «Гёроглы» приглашает на показ',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Salgy: '),
                            Text('Wagt: '),
                            Text('Bölek: '),
                            Text('Oturgyç: '),
                          ],
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Государственный цирк имени "Гёроглы" города Аркадаг',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('15:00 29.03.2024'),
                              Text('\'A\''),
                              Text('Setir: 10, Hatar: 4'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.mainGrey,
                  ),
                  const SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('1 X Ulu: '),
                            Text('1 X Kiçi: '),
                            Text('Jemi: '),
                          ],
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '30 TMT',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('20 TMT'),
                              Text('50 TMT'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: AppColors.mainBlue,
                      borderRadius: BorderRadius.circular(50)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
