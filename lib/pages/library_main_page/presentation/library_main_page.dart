import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:online_library/pages/welcome_page/presentation/welcome_page.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:online_library/widgets/home_page_details/home_page_details_widget.dart';

class AlBiletMainPage extends StatefulWidget {
  const AlBiletMainPage({super.key});

  @override
  State<AlBiletMainPage> createState() => _AlBiletMainPageState();
}

class _AlBiletMainPageState extends State<AlBiletMainPage> {
  int _selectedPage = 0;

  void onSelectedPage(int index) {
    if (_selectedPage == index) return;
    setState(() {
      _selectedPage = index;
    });
  }

  //bool _isSearch = false;

  final List<String> items = [
    'assets/images/icons/icons8-turkmenistan-circular-24.png',
    'assets/images/icons/icons8-russian-federation-24.png',
    'assets/images/icons/icons8-usa-24.png',
  ];
  String selectedItem =
      'assets/images/icons/icons8-turkmenistan-circular-24.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
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
                const SizedBox(width: 10),
                const SizedBox(width: 5),
                DropdownButton<String>(
                  iconSize: 0,
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
                      child: Image.asset(value),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('welcome');
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.mainYellow)),
                  child: Text(
                    "Log in",
                    style: TextStyle(color: AppColors.mainWhite),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ]),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedPage,
          children: const [
            MainDatailsWidget(),
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                              'Bu aýratynlyga girmek üçin \n ilki agza bolmagyňyzy haýyş edýäris.',
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AlBiletMainPage()));
                                      },
                                      child: const Text('Ýap'),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const WelcomePage()));
                                      },
                                      child: const Text('Agza bol'),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        });
                  },
                ),
                GButton(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainYellow,
                  text: "Cart",
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                              'Bu aýratynlyga girmek üçin \n ilki agza bolmagyňyzy haýyş edýäris.',
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AlBiletMainPage()));
                                      },
                                      child: const Text('Ýap'),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const WelcomePage()));
                                      },
                                      child: const Text('Agza bol'),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        });
                  },
                ),
                GButton(
                  icon: Icons.person,
                  iconColor: AppColors.mainYellow,
                  text: "Profile",
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                              'Bu aýratynlyga girmek üçin \n ilki agza bolmagyňyzy haýyş edýäris.',
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AlBiletMainPage()));
                                      },
                                      child: const Text('Ýap'),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const WelcomePage()));
                                      },
                                      child: const Text('Agza bol'),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        });
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
