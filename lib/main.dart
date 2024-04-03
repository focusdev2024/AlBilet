import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_library/pages/otp/presentation/otp.dart';
import 'package:online_library/pages/library_main_page/presentation/library_main_page.dart';
import 'package:online_library/pages/read_and_buy_page/presentation/read_and_buy_page.dart';
import 'package:online_library/pages/sing_up_page/presentation/singup_page.dart';
import 'package:online_library/pages/welcome_page/presentation/welcome_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:online_library/widgets/about_action/aboutaction_widget.dart';
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
      title: "Al Bilet",
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/alBiletMain',
      getPages: [
        GetPage(name: '/welcome', page: () => const WelcomePage()),
        GetPage(name: '/singIn', page: () => const LogInPage()),
        GetPage(name: '/singUp', page: () => const SingUpPage()),
        GetPage(name: '/alBiletMain', page: () => const AlBiletMainPage()),
        GetPage(
          name: '/readAndBuyPage',
          page: () => const ReadAndBuyPage(),
        ),
        GetPage(
            name: '/alBiletMain/mainDetails', page: () => MainDatailsWidget()),
        GetPage(name: '/getTokenPage', page: () => const GetTokenPage()),
        GetPage(name: '/aboutAction', page: () => const AboutActionPage())
      ],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(builder: (context) {
          return const Text('Default Route');
        });
      },
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: AppColors.mainBlue),
            labelStyle: TextStyle(color: AppColors.mainBlue),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.mainBlue),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: AppColors.mainBlue)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: AppColors.mainBlue)),
          ),
          scaffoldBackgroundColor: AppColors.mainWhite,
          primaryColorLight: AppColors.mainBlue,
          primaryColorDark: AppColors.mainWhite,
          textTheme: GoogleFonts.kanitTextTheme(
            Theme.of(context).textTheme,
          ).apply(
              bodyColor: AppColors.mainBlue,
              displayColor: AppColors.mainWhite,
              decorationColor: AppColors.mainBlue),
          // textTheme: TextTheme(
          //   titleLarge: TextStyle(color: AppColors.mainBlue),
          //   titleMedium: TextStyle(color: AppColors.mainBlue),
          //   titleSmall: TextStyle(color: AppColors.mainBlue),
          //   displayLarge: TextStyle(fontFamily: ),
          // ),
          shadowColor: Colors.grey.withOpacity(0.2),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.mainBlue,
            iconTheme: IconThemeData(
              color: AppColors.mainWhite,
            ),
            elevation: 2.0,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.mainBlue,
            selectedItemColor: AppColors.mainYellow,
            unselectedItemColor: AppColors.mainYellow,
          ),
          tabBarTheme: TabBarTheme(
            labelColor: AppColors.mainBlue,
            unselectedLabelColor: AppColors.mainWhite,
          )),

      // home: WelcomePage(),
    );
  }
}
