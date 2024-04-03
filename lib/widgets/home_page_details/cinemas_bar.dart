import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/tools/class/actionList.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';

class CinemasBar extends StatefulWidget {
  const CinemasBar({super.key});

  @override
  State<CinemasBar> createState() => _CinemasBarState();
}

class _CinemasBarState extends State<CinemasBar> {
  final actions = [
    actionList(
      actionId: 4,
      imageName: 'assets/images/cinemas/d38531a8e9351601888a822711a4a5ab.webp',
      title: 'Şükür güni” filmi',
      location: '“Türkmenistan” kinokonsert zaly',
      time: '10:30 03.02.2024',
    ),
    actionList(
      actionId: 4,
      imageName: 'assets/images/cinemas/354784d578b47db185a3b6e2f64e4147.webp',
      title: 'Проклятие Аннабель',
      location: '"Türkmenistan" kinokonsert merkezi',
      time: '14:19 01.04.2024',
    ),
    actionList(
      actionId: 4,
      imageName: 'assets/images/cinemas/e5196dc7f9977a535495573bdcc6a1ff.webp',
      title: 'Дудочник',
      location: 'Киноконцертный зал «Туркменистан»',
      time: '13:18 21.02.2024',
    ),
    actionList(
      actionId: 4,
      imageName: 'assets/images/cinemas/ef87a22d7a7f3ced9300a75cb30dd51b.webp',
      title: 'По щучьему велению',
      location: 'Киноконцертный зал «Ватан»',
      time: '17:1211.12.2023',
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

  Widget _buildImage(String urlImage, int index) => Container(
        //margin: const EdgeInsets.symmetric(horizontal: 1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      );
}

int calculateCrossAxisCount(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  int crossAxisCount =
      (screenWidth / 150).floor(); // Assuming each item has a width of 150
  return crossAxisCount;
}

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
