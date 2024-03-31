import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_library/pages/library_main_page/presentation/library_main_page.dart';
import 'package:online_library/pages/sing_up_page/presentation/singup_page.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:online_library/widgets/style_button_widget.dart';

import '../../../widgets/password_text_field.dart';
import '../../../widgets/phone_number_text_field.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final phoneNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhite,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/images/al_bilet002.png')),
              const SizedBox(height: 30),
              PhoneNumberTextField(
                phoneNumberController: phoneNameController,
              ),
              const SizedBox(height: 10),
              PasswordTextField(passwordController: passwordController),
              const SizedBox(height: 30),
              StyleButtonWidget(
                buttonColor: AppColors.mainBlue,
                buttonBorderColor: Colors.white,
                buttonTextColor: Colors.white,
                buttonName: AppLocalizations.of(context)!.logIn,
                onTap: () {
                  if (phoneNameController.text == "65 656565" &&
                      passwordController.text == "123") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AlBiletMainPage()));
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.dontHaveAccaunt),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SingUpPage()));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.singUp,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
