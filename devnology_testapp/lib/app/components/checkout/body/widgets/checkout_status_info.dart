import 'package:flutter/material.dart';

import '../../../../config/app_fonts.dart';

class CheckoutStatusInfo extends StatelessWidget {
  const CheckoutStatusInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 48,
      margin: const EdgeInsets.only(bottom: 80),
      child: Text(
        'Your order was placed successfully. For more details, check All My Orders page under Profile tab,',
        style: AppFonts.checkoutLabel,
        textAlign: TextAlign.center,
      ),
    );
  }
}
