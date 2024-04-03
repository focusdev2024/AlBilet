import 'package:flutter/material.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:online_library/widgets/home_page_details/all_action_bar.dart';
import 'package:online_library/widgets/home_page_details/cinemas_bar.dart';
import 'package:online_library/widgets/home_page_details/consert_bar.dart';
import 'package:online_library/widgets/home_page_details/others_bar.dart';
import 'package:online_library/widgets/home_page_details/sirks_bar.dart';
import 'package:online_library/widgets/home_page_details/sports_bar.dart';
import 'package:online_library/widgets/home_page_details/teatrs_bar.dart';

class MainDatailsWidget extends StatefulWidget {
  const MainDatailsWidget({super.key});

  @override
  State<MainDatailsWidget> createState() => _MainDatailsWidgetState();
}

class _MainDatailsWidgetState extends State<MainDatailsWidget> {
  List<String> actionNames = [
    'All',
    'Konsert',
    'Teatr',
    'Sirk',
    'Kinoteatr',
    'Sport',
    'Başga',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: actionNames.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: TabBar(
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  color: AppColors.mainWhite,
                ),
                tabs: actionNames
                    .map((String name) => Tab(
                          child: SizedBox(
                            width: 100,
                            child: Center(
                              child: Text(
                                name,
                              ),
                            ),
                          ),
                        ))
                    .toList()),
          ),
        ),
        body: TabBarView(children: [
          AllActionsBar(),
          ConsertsBar(),
          TeatrsBar(),
          SirksBar(),
          CinemasBar(),
          SportsBar(),
          OthersBar(),
        ]),
      ),
    );
  }
}
