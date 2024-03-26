import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/pages/library_main_page/presentation/library_main_page.dart';
import 'package:online_library/pages/read_and_buy_page/presentation/read_and_buy_page.dart';
import 'package:online_library/pages/sing_up_page/presentation/sing_up_page.dart';
import 'package:online_library/pages/welcome_page/presentation/welcome_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:online_library/widgets/home_page_details/home_page_details_widget.dart';
import 'pages/sing_in_page/presentation/login_page.dart';

void main() {
  runApp(const OnlineLibrary());
}

class OnlineLibrary extends StatelessWidget {
  const OnlineLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Online Library",
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/libraryMain',
      getPages: [
        GetPage(name: '/welcome', page: () => const WelcomePage()),
        GetPage(name: '/singIn', page: () => const LogInPage()),
        GetPage(name: '/singUp', page: () => const SingUpPage()),
        GetPage(name: '/libraryMain', page: () => const LibraryMainPage()),
        GetPage(
          name: '/readAndBuyPage',
          page: () => const ReadAndBuyPage(),
        ),
        GetPage(
            name: '/libraryMain/mainDetails', page: () => MainDatailsWidget()),
      ],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(builder: (context) {
          return const Text('Default Route');
        });
      },
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          primaryColorLight: AppColors.mainBlue,
          primaryColorDark: AppColors.white,
          textTheme: TextTheme(
              titleLarge: TextStyle(color: AppColors.mainBlue),
              titleMedium: TextStyle(color: AppColors.mainBlue)),
          shadowColor: Colors.grey.withOpacity(0.2),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.mainBlue,
            iconTheme: IconThemeData(
              color: AppColors.white,
            ),
            elevation: 2.0,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.mainBlue,
            selectedItemColor: AppColors.mainYellow,
            unselectedItemColor: AppColors.mainYellow,
          )),

      // home: WelcomePage(),
    );
  }
}
