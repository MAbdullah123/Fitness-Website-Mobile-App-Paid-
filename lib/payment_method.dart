import 'package:flutter/material.dart';
import 'package:flutter_application_gym/payment_procedure.dart';

class payment_method extends StatefulWidget {
  const payment_method({super.key});

  @override
  State<payment_method> createState() => _payment_methodState();
}

class _payment_methodState extends State<payment_method> {
  String? selectedMethod;
  final List<Map<String, dynamic>> payment_methods = [
    {'name': 'Credit Card', 'icon': Icons.credit_card, 'id': 'credit_card'},
    {'name': 'PayPal', 'icon': Icons.paypal, 'id': 'paypal'},
    {'name': 'Google Pay', 'icon': Icons.g_mobiledata, 'id': 'google_pay'},
    {'name': 'Apple Pay', 'icon': Icons.apple, 'id': 'apple_pay'},
  ];

  void _navigateToPaymentProcedure(String methodId, String methodName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PaymentProcedure(paymentMethod: methodId, methodName: methodName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3DB2FF), Color(0xFF1D5D9B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: AppBar(
            title: const Text(
              'Payment Method',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 110),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: payment_methods.length,
              itemBuilder: (context, index) {
                final method = payment_methods[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Icon(
                      method['icon'] as IconData,
                      size: 32,
                      color: selectedMethod == method['id']
                          ? Colors.black
                          : Colors.grey,
                    ),
                    title: Text(
                      method['name'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Radio<String>(
                      value: method['id'] as String,
                      groupValue: selectedMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedMethod = value;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                    onTap: () {
                      setState(() {
                        selectedMethod = method['id'] as String;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, -4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedMethod == null
                    ? null
                    : () {
                        // Find the selected payment method details
                        final selectedpaymentMethod = payment_methods
                            .firstWhere(
                              (method) => method['id'] == selectedMethod,
                            );
                        _navigateToPaymentProcedure(
                          selectedpaymentMethod['id'] as String,
                          selectedpaymentMethod['name'] as String,
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: const Color(0xFF3CADF8),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  disabledBackgroundColor: Colors.grey[300],
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
