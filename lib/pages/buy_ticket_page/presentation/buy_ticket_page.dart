import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:online_library/pages/chose_bank_cart_page/presentation/chose_bank_card_page.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';
import 'package:online_library/widgets/style_button_widget.dart';

class BuyTicketPage extends StatefulWidget {
  const BuyTicketPage({super.key});

  @override
  State<BuyTicketPage> createState() => _BuyTicketPageState();
}

class _BuyTicketPageState extends State<BuyTicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(
          'Satyn almak',
          style: TextStyle(color: AppColors.mainWhite),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Государственный цирк имени «Гёроглы» приглашает на показ',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _TextWidgetBold(text: 'Salgy: '),
                            _TextWidgetBold(text: 'Wagt: '),
                            _TextWidgetBold(text: 'Bölek: '),
                            _TextWidgetBold(text: 'Oturgyç: '),
                          ],
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _TextWidgetBold(
                                  text:
                                      'Государственный цирк имени "Гёроглы" города Аркадаг'),
                              _TextWidgetBold(text: '15:00 29.03.2024'),
                              _TextWidgetBold(text: '\'A\''),
                              _TextWidgetBold(text: 'Setir: 10, Hatar: 4'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.mainGrey,
                  ),
                  const SizedBox(
                    height: 90,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _TextWidgetBold(text: '1 X Ulu: '),
                            _TextWidgetBold(text: '1 X Kiçi: '),
                            _TextWidgetBold(text: 'Jemi: '),
                          ],
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _TextWidgetBold(text: '30 TMT'),
                              _TextWidgetBold(text: '20 TMT'),
                              _TextWidgetBold(text: '50 TMT'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Column(
                children: [
                  _BankCardsContainer(
                    imageUrl: 'assets/images/bank_carts/unnamed.png',
                    bankCardName: 'Senagat bank',
                  ),
                  _BankCardsContainer(
                    imageUrl: 'assets/images/bank_carts/halk_bank.jpg',
                    bankCardName: 'Halk bank',
                  ),
                  _BankCardsContainer(
                    imageUrl: 'assets/images/bank_carts/tysgal_other.jpg',
                    bankCardName: 'Rysgal we beýleki banklar',
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StyleButtonWidget(
                    buttonName: 'Dowam etmek',
                    onTap: () {
                      Get.snackbar('karty', 'sayla');
                    },
                    buttonColor: AppColors.mainBlue,
                    buttonBorderColor: AppColors.mainBlue,
                    buttonTextColor: AppColors.mainWhite,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextWidgetBold extends StatelessWidget {
  const _TextWidgetBold({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _BankCardsContainer extends StatefulWidget {
  const _BankCardsContainer({
    required this.imageUrl,
    required this.bankCardName,
    super.key,
  });

  final String imageUrl;
  final String bankCardName;

  @override
  State<_BankCardsContainer> createState() => _BankCardsContainerState();
}

class _BankCardsContainerState extends State<_BankCardsContainer> {
  Color _containerColor = AppColors.mainWhite;

  void _changeColor() {
    setState(() {
      _containerColor = _containerColor == AppColors.mainWhite
          ? AppColors.mainYellow
          : AppColors.mainWhite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: _containerColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: AppColors.mainGrey100,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(widget.imageUrl),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.bankCardName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
