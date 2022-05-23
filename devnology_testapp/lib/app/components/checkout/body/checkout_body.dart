import 'package:devnology_testapp/app/components/checkout/body/widgets/checkout_button.dart';
import 'package:devnology_testapp/app/components/checkout/body/widgets/checkout_circle_done.dart';
import 'package:devnology_testapp/app/components/checkout/body/widgets/checkout_status_info.dart';
import 'package:flutter/material.dart';

import '../../bold_title.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CheckoutCircleDone(),
          const BoldTitle(
            title: 'Order Placed!',
            marginTop: 30,
            marginBottom: 23,
          ),
          const CheckoutStatusInfo(),
          CheckoutButton(
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
