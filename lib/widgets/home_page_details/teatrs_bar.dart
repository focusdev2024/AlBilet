import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/tools/class/actionList.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';

class TeatrsBar extends StatefulWidget {
  const TeatrsBar({super.key});

  @override
  State<TeatrsBar> createState() => _TeatrsBarState();
}

class _TeatrsBarState extends State<TeatrsBar> {
  final actions = [
    actionList(
      actionId: 2,
      imageName: 'assets/images/teatrs/31e0e3e93116d3b5a1f230663b6b76eb.webp',
      title: '"Dünýäniň görki zenanlar" sahnasy',
      location: 'Magtymguly adyndaky milli aýdym-saz we drama teatry',
      time: '12:40 09.03.2024',
    ),
    actionList(
      actionId: 2,
      imageName: 'assets/images/teatrs/8b8bb9dbe5a4b81aab4026e7947aa5e8.webp',
      title: ' "Saňa ýalan maňa çyn" atly sahna oýny',
      location: 'Mollanepes adyndaky talyplar teatry',
      time: '10:47 01.05.2023',
    ),
    actionList(
      actionId: 2,
      imageName: 'assets/images/teatrs/0e1d8153148f0e841d2c81e2062ec1db.webp',
      title: '«Gelinler»',
      location:
          'Türkmenistanyň Beýik Saparmyrat Türkmenbaşy adyndaky baş drama teatry',
      time: '19:00 12.12.2023',
    ),
    actionList(
      actionId: 2,
      imageName: 'assets/images/teatrs/57ff016b48547cc0262fa0c4e0bca961.webp',
      title: '«Колобок»',
      location: 'A.S.Puşkin adyndaky döwlet rus drama teatrynda',
      time: '12:00 08.12.2023',
    ),
  ];
  final _searchController = TextEditingController();
  var _filteredAction = <actionList>[];

  void _searchActions() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredAction = actions.where((actionList book) {
        return book.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredAction = actions;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredAction = actions;

    _searchController.addListener(() {
      _searchActions();
    });
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = calculateCrossAxisCount(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomScrollView(slivers: [
        //Search start
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset('assets/images/icons/search001.png'),
                  ),
                ),
                labelText: "Search",
                filled: true,
                fillColor: AppColors.mainWhite,
              ),
            ),
          ),
        ),
        //Main body start
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'Golaýda',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, // Number of columns
            mainAxisSpacing: 10.0, // Spacing between rows
            crossAxisSpacing: 10.0, // Spacing between columns
            childAspectRatio: 0.65, // Aspect ratio of each cell
          ),
          delegate: SliverChildBuilderDelegate(
            childCount: _filteredAction.length,
            (BuildContext context, int index) {
              final actions = _filteredAction[index];
              {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/aboutAction');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                child: Image.asset(
                                  actions.imageName,
                                  width: 300,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.mainGrey100,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite,
                                        color: AppColors.mainYellow,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  actions.title,
                                  style: Theme.of(context).textTheme.labelLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  actions.location,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  actions.time,
                                  style: Theme.of(context).textTheme.labelSmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
        // Main body end
      ]),
    );
  }
}

int calculateCrossAxisCount(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  int crossAxisCount =
      (screenWidth / 150).floor(); // Assuming each item has a width of 150
  return crossAxisCount;
}

// ignore: unused_element
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
