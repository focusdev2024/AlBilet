import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:online_library/pages/sing_in_page/presentation/login_page.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:online_library/widgets/phone_number_text_field.dart';
import 'package:online_library/widgets/style_button_widget.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final phoneNameController = TextEditingController();

  String? errorText = null;

  void auth() {
    final phoneNumber = phoneNameController.text;
    if (phoneNumber.length == 9) {
      Get.toNamed('/getTokenPage');
    } else {
      errorText = 'Siz nädogry nomyr girizdiňiz!';
    }
    setState(() {});
  }

  @override
  void dispose() {
    phoneNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Scaffold(
      backgroundColor: AppColors.mainWhite,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/al_bilet002.png'),
                ),
                const SizedBox(height: 20),
                PhoneNumberTextField(
                  phoneNumberController: phoneNameController,
                ),
                const SizedBox(height: 10),
                if (errorText != null)
                  Text(
                    errorText,
                    style: TextStyle(color: AppColors.mainError),
                  ),
                const SizedBox(
                  height: 30,
                ),
                StyleButtonWidget(
                  buttonColor: AppColors.mainBlue,
                  buttonBorderColor: Colors.white,
                  buttonTextColor: Colors.white,
                  buttonName: AppLocalizations.of(context)!.singUp,
                  onTap: () {
                    auth();
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.alreadyHaveAccaunt),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInPage()));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.logIn,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
