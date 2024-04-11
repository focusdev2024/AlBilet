import 'package:flutter/material.dart';

class ChoseBankCardPage extends StatelessWidget {
  const ChoseBankCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Karty'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(
                        'assets/images/bank_carts/8b022dd5c7cdabff9ebae02bb6d78bac'),
                  ),
                  const Expanded(
                      child: Column(
                    children: [
                      Text('kart name'),
                    ],
                  ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
