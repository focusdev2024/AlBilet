import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainDatailsWidget extends StatefulWidget {
  MainDatailsWidget({super.key});

  @override
  State<MainDatailsWidget> createState() => _MainDatailsWidgetState();
}

class _MainDatailsWidgetState extends State<MainDatailsWidget> {
  List<String> items = [
    'All',
    'Konsert',
    'Teatr',
    'Kinoteatr',
    'Sport',
    'Başga',
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.abc,
    Icons.abc_rounded,
    Icons.ac_unit,
    Icons.access_alarm_rounded
  ];

  int current = 0;

  final _searchController = TextEditingController();

  final String assetImagePath = 'assets/images/';

  int activeIndex = 0;
  final urlImages = [
    'assets/images/carousel_images/1e58c5745f56cbb93a37dfe9ceb52917-8966022-300x200-2.webp',
    'assets/images/carousel_images/8b37407f36b05e7676afcffbc678db1a-8964110-300x200-2.webp',
    'assets/images/carousel_images/08e1ffdb12d445b09ac952aa3d5b46f8-8970187-330x220-2.webp',
    'assets/images/carousel_images/9ccf20131de046f245e45cd8e40a7304-8961514-300x200-2.webp',
    'assets/images/carousel_images/31e0e3e93116d3b5a1f230663b6b76eb.webp',
    'assets/images/carousel_images/80300a17c9c84cf4a4a89014b5bb2590-8968663-382x254-2.webp',
    'assets/images/carousel_images/d34802075e974819cf1e048922632762-8966953-300x200-2.webp',
    'assets/images/carousel_images/ee7c4071fd96138e7306da1ff6ac1fe3-8961226-300x200-2.webp',
  ];

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = calculateCrossAxisCount(context);
    return Container(
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      height: double.infinity,
      child: CustomScrollView(slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 80,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: current == index
                                        ? Colors.white70
                                        : Colors.white54,
                                    borderRadius: current == index
                                        ? BorderRadius.circular(15)
                                        : BorderRadius.circular(10),
                                    border: current == index
                                        ? Border.all(
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                            width: 2)
                                        : null),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: TextStyle(
                                        color: current == index
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                                visible: current == index,
                                child: Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          Theme.of(context).primaryColorLight),
                                ))
                          ],
                        );
                      }),
                ),
              ],
            ),
            minHeight: 66, // minHeight of the _SliverAppBarDelegate
            maxHeight: 66, // maxHeight of the _SliverAppBarDelegate
          ),
        ),
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
        //Search end
        //Carousel start
        SliverToBoxAdapter(
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: urlImages.length,
                options: CarouselOptions(
                    initialPage: 0,
                    height: 200.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    //enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    }),
                itemBuilder: (
                  context,
                  index,
                  realIndex,
                ) {
                  final urlImage = urlImages[index];
                  return _buildImage(urlImage, index);
                },
              ),
              const SizedBox(height: 10),
              _buildIndicator(),
            ],
          ),
        ),
        //Carousel end
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
            childCount: 20,
            (BuildContext context, int index) {
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                child: Image.asset(
                                  'assets/images/tagamly_sozler001.png',
                                  width: 300,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                right: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.mainGrey100,
                                      borderRadius: BorderRadius.circular(30)),
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
                        Text('Book Name',
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 5),
                        Text(
                          'Author Name',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                      ],
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

  Widget _buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: ExpandingDotsEffect(
          activeDotColor: AppColors.mainBlue,
          radius: 8,
          spacing: 10,
          dotHeight: 9,
          dotWidth: 9,
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
