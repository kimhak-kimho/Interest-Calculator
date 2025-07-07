import 'package:flutter/material.dart';
import 'result_loan.dart';
import 'package:flutter/services.dart';

class InputScreen extends StatefulWidget {
  final String title;

  const InputScreen({super.key, required this.title});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();
  final loanController = TextEditingController();
  final rateController = TextEditingController();
  final monthsController = TextEditingController();

  @override
  void dispose() {
    loanController.dispose();
    rateController.dispose();
    monthsController.dispose();
    super.dispose();
  }

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      // Remove any commas or special characters that might be in the input
      final loan = double.parse(loanController.text.replaceAll(',', ''));
      final rate = double.parse(rateController.text.replaceAll('%', ''));
      final months = int.parse(monthsController.text);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            loanAmount: loan,
            interestRate: rate,
            totalMonths: months,
            title: widget.title,
          ),
        ),
      );
    }
  }

  String? _validatePositiveNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'សូមបញ្ចូល $fieldName';
    }
    final number = double.tryParse(
      value.replaceAll(',', '').replaceAll('%', ''),
    );
    if (number == null) {
      return 'សូមបញ្ចូលលេខត្រឹមត្រូវ';
    }
    if (number <= 0) {
      return 'តម្លៃត្រូវតែធំជាង 0';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontFamily: 'Misan', color: Colors.white),
        ),
        backgroundColor: const Color(0xFF001379),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: loanController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'ចំនួនប្រាក់ដើម',
                    labelStyle: TextStyle(
                      fontFamily: 'Misan',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 89, 255),
                    ),
                    hintText: 'បញ្ចូលចំនួនប្រាក់ដើម',
                    hintStyle: TextStyle(
                      fontFamily: 'Misan',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(
                    // This affects the user-typed input
                    fontFamily: 'Misan',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  validator: (value) =>
                      _validatePositiveNumber(value, 'ចំនួនប្រាក់ដើម'),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: rateController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'អត្រាការប្រាក់ក្នុងមួយឆ្នាំ (%)',
                    hintText: 'បញ្ចូលអត្រាការប្រាក់ជាភាគរយ',
                    hintStyle: TextStyle(
                      fontFamily: 'Misan',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(Icons.percent),
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontFamily: 'Misan'),
                  ),
                  validator: (value) =>
                      _validatePositiveNumber(value, 'អត្រាការប្រាក់'),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: monthsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'រយៈពេល (ខែ)',
                    hintText: 'បញ្ចូលចំនួនខែ',
                    hintStyle: TextStyle(
                      fontFamily: 'Misan',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontFamily: 'Misan'),
                  ),
                  validator: (value) =>
                      _validatePositiveNumber(value, 'រយៈពេល'),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _calculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 47, 129),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'គណនាកម្ចី',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Misan',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
