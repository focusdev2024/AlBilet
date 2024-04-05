import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:online_library/widgets/about_action/action_description_widget.dart';
import 'package:online_library/widgets/about_action/action_time_description_widget.dart';

class AboutActionPage extends StatefulWidget {
  const AboutActionPage({super.key});

  @override
  State<AboutActionPage> createState() => _AboutActionPageState();
}

class _AboutActionPageState extends State<AboutActionPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Giňişleýin',
                  style: TextStyle(color: AppColors.mainWhite),
                ),
              ),
              Tab(
                child: Text(
                  'Wagtlar',
                  style: TextStyle(color: AppColors.mainWhite),
                ),
              ),
            ],
          ),
          title: Text(
            'Государственный цирк имени «Гёроглы» приглашает на показ',
            style: TextStyle(color: AppColors.mainWhite),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: const TabBarView(
          children: [
            ActionDescriptionPage(),
            ActionTimeDescriptionPage(),
          ],
        ),
      ),
    );
  }
}
