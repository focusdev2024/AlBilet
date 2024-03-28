import 'package:flutter/material.dart';

class PleaseSingInPage extends StatelessWidget {
  const PleaseSingInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Bu aýratynlyga girmek üçin \n ilki agza bolmagyňyzy haýyş edýäris.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
