import 'package:flutter/material.dart';

class PaymentMethodDropdown extends StatefulWidget {
  const PaymentMethodDropdown({Key? key}) : super(key: key);

  @override
  State<PaymentMethodDropdown> createState() => _PaymentMethodDropdownState();
}

class _PaymentMethodDropdownState extends State<PaymentMethodDropdown> {
  String selectedPayment = "MasterCard •••• 5522";

  final List<Map<String, dynamic>> paymentMethods = [
    {"label": "Visa •••• 3241", "icon": Icons.credit_card},
    {"label": "MasterCard •••• 5522", "icon": Icons.credit_card_rounded},
    {"label": "Cash on Delivery", "icon": Icons.local_shipping_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12),
          value: selectedPayment,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: paymentMethods.map<DropdownMenuItem<String>>((method) {
            return DropdownMenuItem<String>(
              value: method["label"] as String,
              child: Row(
                children: [
                  Icon(method["icon"] as IconData, size: 20),
                  const SizedBox(width: 10),
                  Text(method["label"] as String),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedPayment = value!;
            });
          },
        ),
      ),
    );
  }
}
