import 'package:flutter/material.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';

import 'package:online_library/widgets/style_button_widget.dart';

class ActionDescriptionPage extends StatefulWidget {
  const ActionDescriptionPage({super.key});

  @override
  State<ActionDescriptionPage> createState() => _ActionDescriptionPageState();
}

class _ActionDescriptionPageState extends State<ActionDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(physics: const BouncingScrollPhysics(), children: [
      Center(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 230,
              child: Image.asset(
                'assets/images/aboutAction/medium-64a285609bcb9.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: Column(
                children: [
                  SizedBox(
                    child: Text(
                        'Приглашаем на захватывающее представление в Государственном цирке имени «Гёроглы»! Откройте для себя мир волшебства и удивительных номеров, которые заставят ваше сердце биться быстрее. Насладитесь выступлениями лучших артистов и животных, испытайте непередаваемые эмоции и ощутите атмосферу удивления и веселья. Присоединяйтесь к нам в этом удивительном путешествии!'),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 300,
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Uzaklygy: '),
                                Text('Ýyly: '),
                                Text('Mazmuny: '),
                                Text('Ýaşy: '),
                                Text('Režissiýor: '),
                                Text('Baş rollar: '),
                              ],
                            ),
                            SizedBox(width: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('02:56'),
                                Text('2022'),
                                Text('Action,Crime,Drama'),
                                Text('16+'),
                                Text('Matt Reeves'),
                                Text(
                                    'Robert Pattinson, Zoe Kravits, Jefrey Wright'),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: StyleButtonWidget(
            buttonName: 'Wagtlar saýlaň',
            onTap: () {
              final TabController controller = DefaultTabController.of(context);
              controller.animateTo(1);
            },
            buttonColor: AppColors.mainBlue,
            buttonBorderColor: AppColors.mainBlue,
            buttonTextColor: AppColors.mainWhite),
      )
    ]);
  }
}
