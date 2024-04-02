import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:online_library/tools/class/actionList.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainDatailsWidget extends StatefulWidget {
  MainDatailsWidget({super.key});

  @override
  State<MainDatailsWidget> createState() => _MainDatailsWidgetState();
}

class _MainDatailsWidgetState extends State<MainDatailsWidget> {
  final actions = [
    actionList(
        actionId: 1,
        imageName:
            'assets/images/conserts/1e58c5745f56cbb93a37dfe9ceb52917.webp',
        title:
            'Arkadag şäherinde Halkara zenanlar güni mynasybetli konsertler geçiriler',
        location:
            'Arkadag şäherinde Aman Gulmammedowyň adyny göterýän Döwlet drama teatry',
        time: '15:22 01.03.2024'),
    actionList(
      actionId: 1,
      imageName: 'assets/images/conserts/9ccf20131de046f245e45cd8e40a7304.webp',
      title: 'Oskar filmlerinden aýdym-saz Aşgabatda ýerine ýetiriler',
      location: 'Magtymguly adyndaky milli aýdym-saz we drama teatry',
      time: '13:46 26.01.2024',
    ),
    actionList(
      actionId: 1,
      imageName: 'assets/images/conserts/ee7c4071fd96138e7306da1ff6ac1fe3.webp',
      title: '“Şemiň simfoniýasy” atly konsert',
      location: 'Magtymguly adyndaky milli aýdym-saz we drama teatry',
      time: '16:30 23.01.2024',
    ),
    actionList(
      actionId: 1,
      imageName: 'assets/images/conserts/00afd5c8bbf3128203b1ea963b89e9a2.webp',
      title: '"Kamera aýdym-saz agşamy"',
      location: 'Magtymguly adyndaky milli aýdym-saz we drama teatry',
      time: '16:28 23.01.2024',
    ),
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
    actionList(
      actionId: 3,
      imageName: 'assets/images/sirks/8e63b5adb5fedeee43402fd3c2ed4eaa.webp',
      title: 'Гастроли московского цирка «Carnelly»',
      location: 'пр. Махтумкули, 134 A. Государственный Цирк Туркменистана',
      time: '08:38 05.03.2018',
    ),
    actionList(
      actionId: 3,
      imageName: 'assets/images/sirks/a2fcc59cce6b97d5ca8f5346920ef015.webp',
      title: 'Гастроли российских цирков в городе Балканабат',
      location: 'Туркменская белая юрта',
      time: '13:46 05.09.2023',
    ),
    actionList(
      actionId: 3,
      imageName: 'assets/images/sirks/63034ee0c1be24332c1b634c705d97f5.webp',
      title: 'Государственный цирк имени «Гёроглы» приглашает на показ',
      location: 'Государственный цирк имени "Гёроглы" города Аркадаг',
      time: '17:53 29.03.2024',
    ),
    actionList(
      actionId: 3,
      imageName: 'assets/images/sirks/b859cf7f2d754ca00cd702413183a4e6.webp',
      title: 'Большой Московский цирк в Ашхабаде',
      location: ' Государственного цирка Туркменистана',
      time: '16:10 30.11.2022',
    ),
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
    actionList(
      actionId: 5,
      imageName: 'assets/images/sports/80300a17c9c84cf4a4a89014b5bb2590.webp',
      title: 'Türkmenistan — Eýran oýnuna petekler satylyp başlandy',
      location: '«Aşgabat» köpugurly stadiony',
      time: '20:00 26.04.2024',
    ),
    actionList(
      actionId: 5,
      imageName: 'assets/images/sports/Hokkey.webp',
      title: 'Aşgabatda hokkeý boýunça halkara ýaryş geçiriler',
      location: 'Спортивный комплекс ледовых видов спорта',
      time: '02.03.2024',
    ),
    actionList(
      actionId: 6,
      imageName: 'assets/images/others/ae2f516f7e68e678a09d90e196d0608f.webp',
      title: '«Ашхабадское танго»',
      location: 'В Культурном центре «Шапак» (район 3 парка).',
      time: '19:19 06.05.2019',
    ),
  ];

  List<String> items = [
    'All',
    'Konsert',
    'Teatr',
    'Sirk',
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
            childCount: actions.length,
            (BuildContext context, int index) {
              final action = actions[index];
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
                                  action.imageName,
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
                                  action.title,
                                  style: Theme.of(context).textTheme.labelLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  action.location,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  action.time,
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
