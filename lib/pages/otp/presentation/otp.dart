import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:online_library/widgets/style_button_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class GetTokenPage extends StatefulWidget {
  const GetTokenPage({super.key});

  @override
  State<GetTokenPage> createState() => _GetTokenPageState();
}

class _GetTokenPageState extends State<GetTokenPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(28.0),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: PinputExample(),
        ),
      ),
    );
  }
}

/// This is the basic usage of Pinput
/// For more examples check out the demo directory
class PinputExample extends StatefulWidget {
  const PinputExample({super.key});

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.mainBlue),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/images/al_bilet002.png')),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.enterPinPut,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(width: 10),
              TimerCountdown(
                enableDescriptions: false,
                format: CountDownTimerFormat.secondsOnly,
                endTime: DateTime.now().add(
                  const Duration(
                    seconds: 60,
                  ),
                ),
                onEnd: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              validator: (value) {
                return value == '2222' ? null : 'Girizen zanyňyz nädogry';
              },
              // onClipboardFound: (value) {
              //   debugPrint('onClipboardFound: $value');
              //   pinController.setText(value);
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: AppColors.mainBlue,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.mainBlue),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: AppColors.mainWhite,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: AppColors.mainBlue),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          StyleButtonWidget(
              buttonName: 'Tassyklamak',
              onTap: () {
                focusNode.unfocus();
                formKey.currentState!.validate();
                if (pinController.text == '2222') {
                  Get.toNamed('/alBiletMain');
                }
              },
              buttonColor: AppColors.mainBlue,
              buttonBorderColor: AppColors.mainBlue,
              buttonTextColor: AppColors.mainWhite)
        ],
      ),
    );
  }
}
