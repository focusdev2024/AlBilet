import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:online_library/widgets/favorites_list/favorites_list_widget.dart';
import 'package:online_library/widgets/home_page_details/home_page_details_widget.dart';
import 'package:online_library/widgets/left_nav_bar.dart';

class LibraryMainPage extends StatefulWidget {
  const LibraryMainPage({super.key});

  @override
  State<LibraryMainPage> createState() => _LibraryMainPageState();
}

class _LibraryMainPageState extends State<LibraryMainPage> {
  int _selectedPage = 0;

  void onSelectedPage(int index) {
    if (_selectedPage == index) return;
    setState(() {
      _selectedPage = index;
    });
  }

  bool _isSearch = false;

  final List<String> items = ['TM', 'RU', 'EN'];
  String selectedItem = 'TM';
  final List<String> places = ['Aşgabat', 'Türkmenistan', 'EN'];
  String selectedPlace = 'Aşgabat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const LeftNavBarWidget(),
      appBar: AppBar(
          elevation: 2,
          // title: _isSearch
          //     ? _buildSearchField()
          //     : Text(
          //         AppLocalizations.of(context)!.tagamlySozler,
          //       ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/al_bilet001.png',
                )),
          ),
          centerTitle: true,
          actions: [
            Row(
              children: [
                Icon(
                  Icons.language,
                  color: AppColors.mainYellow,
                ),
                const SizedBox(width: 5),
                DropdownButton<String>(
                  iconDisabledColor: AppColors.mainYellow,
                  value: selectedItem,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      selectedItem = newValue;
                      // Call setState to update the UI
                    }
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: AppColors.mainYellow),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('welcome');
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(color: AppColors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.mainYellow)),
                ),
                const SizedBox(width: 10),
                // IconButton(
                //   icon: Icon(_isSearch ? Icons.close : Icons.search),
                //   onPressed: () {
                //     setState(() {
                //       _isSearch = !_isSearch;
                //     });
                //   },
                // ),],)
              ],
            ),
          ]),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedPage,
          children: [
            MainDatailsWidget(),
            FavoritesListWidget(),
            const Text('3'),
            const Text('4'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              tabBorderRadius: 25,
              tabShadow: [
                BoxShadow(color: Theme.of(context).shadowColor, blurRadius: 1)
              ], // tab button shadow
              curve: Curves.decelerate, // tab animation curves
              duration:
                  const Duration(milliseconds: 400), // tab animation duration
              gap: 6, // the tab button gap between icon and text

              activeColor: Theme.of(context)
                  .bottomNavigationBarTheme
                  .selectedItemColor, // selected icon and text color
              iconSize: 24, // tab button icon size
              // selected tab background color
              padding: const EdgeInsets.all(15),
              selectedIndex: _selectedPage,
              onTabChange: onSelectedPage,
              tabs: [
                GButton(
                  icon: Icons.home,
                  iconColor: AppColors.mainYellow,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.favorite_border,
                  iconColor: AppColors.mainYellow,
                  text: "Favorites",
                ),
                GButton(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainYellow,
                  text: "Cart",
                ),
                GButton(
                  icon: Icons.person,
                  iconColor: AppColors.mainYellow,
                  text: "Profile",
                ),
              ]),
        ),
      ),
    );
  }
}

Widget _buildSearchField() {
  return TextField(
    decoration: const InputDecoration(
      hintText: 'Search...',
      border: InputBorder.none,
    ),
    autofocus: true,
    onChanged: (value) {
      // Perform search operation here
    },
  );
}
