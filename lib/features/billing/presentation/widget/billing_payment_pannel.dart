import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/features/billing/application/billing_notifier.dart';
import 'package:shop_app/features/cart/application/cart_notifier.dart';
import 'package:shop_app/features/customer/domain/entity/customer_entity.dart';
import 'package:uuid/uuid.dart';

class BillingPaymentPannel extends ConsumerWidget {
  BillingPaymentPannel({super.key});
  TextEditingController receivedAmtCtrl = TextEditingController();

  void _onPressed(
    BuildContext context,
    WidgetRef ref,
    double receivedAmount,
  ) async {
    ref.read(billingProvider.notifier).generateBill(receivedAmount);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);

    final billingState = ref.watch(billingProvider);

    final due = max(0, cartState.totalAmount - billingState.receivedAmount);

    final change = max(0, billingState.receivedAmount - cartState.totalAmount);

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Payment",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 25),

          /// TOTAL
          Text(
            "₹${cartState.totalAmount.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 25),

          TextFormField(
            controller: receivedAmtCtrl,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$')),
              LengthLimitingTextInputFormatter(10),
            ],
            onChanged: (value) {
              final amount = double.tryParse(value) ?? 0;
              ref.read(billingProvider.notifier).updateReceivedAmount(amount);
            },
            decoration: const InputDecoration(
              labelText: "Received Amount",
              prefixText: "₹ ",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: due > 0 ? Colors.orange.shade50 : Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: due > 0 ? Colors.orange.shade300 : Colors.green.shade300,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      due > 0
                          ? Icons.warning_amber_rounded
                          : Icons.currency_exchange,
                      size: 20,
                      color: due > 0 ? Colors.orange : Colors.green,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      due > 0 ? "Amount Due" : "Change to Return",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "₹${(due > 0 ? due : change).toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: due > 0
                          ? Colors.orange.shade800
                          : Colors.green.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _showCreditDialog(context, ref);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1F2937),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Customer Detail",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Spacer(),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _showWarningDialog(context, ref);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Clear",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () =>
                      _onPressed(context, ref, billingState.receivedAmount),

                  icon: const Icon(Icons.print, color: Colors.white),
                  label: const Text(
                    "Print",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    backgroundColor: Color.fromARGB(255, 7, 37, 94),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showWarningDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are you sure?"),
          content: const Text(
            "This will clear the current cart and cannot be undone.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                receivedAmtCtrl.clear();

                /// Clear the cart
                ref.read(cartProvider.notifier).clearCart();
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  void _showCreditDialog(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(30),
            width: 430,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// HEADER
                  Row(
                    children: const [
                      Icon(Icons.person_add_alt_1, color: Color(0xFF1F2937)),
                      SizedBox(width: 10),
                      Text(
                        "Add to Udhaar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// NAME
                  TextFormField(
                    controller: nameController,
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Customer name is required";
                      }

                      if (value.trim().length < 3) {
                        return "Name must be at least 3 characters";
                      }

                      if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value.trim())) {
                        return "Enter a valid customer name";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      labelText: "Customer Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// PHONE
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Phone number is required";
                      }

                      if (!RegExp(r'^[0-9]{10}$').hasMatch(value.trim())) {
                        return "Enter a valid 10-digit phone number";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      labelText: "Phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// ADDRESS
                  TextFormField(
                    controller: addressController,
                    maxLines: 2,
                    validator: (value) {
                      if (value != null &&
                          value.trim().isNotEmpty &&
                          value.trim().length < 5) {
                        return "Address is too short";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.location_on),
                      labelText: "Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("Cancel"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            FocusScope.of(context).unfocus();

                            if (!formKey.currentState!.validate()) {
                              return;
                            }

                            final name = nameController.text.trim();
                            final phone = phoneController.text.trim();
                            final address = addressController.text.trim();

                            final customer = CustomerEntity(
                              id: const Uuid().v4(),
                              name: name,
                              phone: phone,
                              address: address,
                              isActive: true,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            );

                            ref
                                .read(billingProvider.notifier)
                                .setCustomer(customer);

                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1F2937),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
