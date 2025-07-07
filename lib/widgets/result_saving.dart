import 'dart:math';
import 'compound_interest.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';

class ResultSaving extends StatelessWidget {
  final double deposit;
  final double interestRate;
  final int totalMonths;
  final String title;
  // Add this

  const ResultSaving({
    super.key,
    required this.deposit,
    required this.interestRate,
    required this.totalMonths,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,##0.00", "en_US");
    double monthlyRate = interestRate / 100 / 12;
    // Calculate totals
    double totalInterest = 0;
    double totalPayment = 0;
    

    // List<Map<String, dynamic>> paymentSchedule = [];
    if (title == 'គណនីសន្សំធម្មតា') {
      double interest = deposit * (interestRate / 100) * (totalMonths / 12);
      totalInterest = interest;
      totalPayment = interest + deposit;
    } else if (title == 'បញ្ញើថេររ') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => CompoundInterest(
              loanAmount: deposit,
              interestRate: interestRate,
              totalMonths: totalMonths,
              title: title,
            ),
          ),
        );
      });
      return const SizedBox.shrink();
    } else if (title == 'ការសន្សំប្រចាំខែ') {
      double futureValue =
          deposit * ((pow(1 + monthlyRate, totalMonths) - 1) / monthlyRate);
      double totalDeposit = deposit * totalMonths;
      double interest = futureValue - totalDeposit;
      totalInterest = interest;
      totalPayment = futureValue;
    } else if (title == 'គណនីសន្សំអត្រាការប្រាក់ខ្ពស់') {
      double amount = deposit * pow(1 + monthlyRate, totalMonths);
      double interest = amount - deposit;
      totalInterest = interest;
      totalPayment = amount;
    } else if (title == 'គណនីសន្សំសម្រាប់កុមារ') {
      double totalDeposit = deposit * totalMonths;
      double amount =
          deposit * ((pow(1 + monthlyRate, totalMonths) - 1) / monthlyRate);
      double interest = amount - totalDeposit;
      totalInterest = interest;
      totalPayment = amount;
    }
    if (title == 'គណនីសន្សំសម្រាប់គោលដៅជាក់លាក់') {
      double totalDeposit = deposit * totalMonths;
      double amount =
          deposit * ((pow(1 + monthlyRate, totalMonths) - 1) / monthlyRate);
      double interest = amount - totalDeposit;
      totalInterest = interest;
      totalPayment = amount;
    }
    double totalDeposit=totalPayment-totalInterest;
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.all(10),
        actions: [
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: () async {
              await _generateAndSavePDF(
                context,
                title,
                deposit,
                interestRate,
                totalMonths,
                totalInterest,
                totalPayment,
              );
            },
          ),
        ],
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color(0xFF001379),
        centerTitle: true,
        title: const Text(
          'លទ្ធផលគណនា',
          style: TextStyle(color: Colors.white, fontFamily: 'Misan'),
        ),
      ),
      body: Column(
        children: [
          // Summary Card
          Card(
            margin: const EdgeInsets.all(12),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'វិធីសាស្រ្តគណនា: $title',
                    style: const TextStyle(
                      fontFamily: 'Misan',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ប្រាក់ដើមសរុប:',
                        style: TextStyle(fontFamily: 'Misan'),
                      ),
                      Text(
                        formatter.format(totalDeposit),
                        style: const TextStyle(fontFamily: 'Misan'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'អត្រាការប្រាក់:',
                        style: TextStyle(fontFamily: 'Misan'),
                      ),
                      Text(
                        '${interestRate.toStringAsFixed(2)}%',
                        style: const TextStyle(fontFamily: 'Misan'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'រយៈពេល:',
                        style: TextStyle(fontFamily: 'Misan'),
                      ),
                      Text(
                        '$totalMonths ខែ',
                        style: const TextStyle(fontFamily: 'Misan'),
                      ),
                    ],
                  ),
                  const Divider(height: 24, thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ការប្រាក់សរុប:',
                        style: TextStyle(
                          fontFamily: 'Misan',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        formatter.format(totalInterest),
                        style: const TextStyle(
                          fontFamily: 'Misan',
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ទឹកប្រាក់ទទួលបានសរុប:',
                        style: TextStyle(
                          fontFamily: 'Misan',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        formatter.format(totalPayment),
                        style: const TextStyle(
                          fontFamily: 'Misan',
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Payment Schedule
        ],
      ),
    );
  }

  Future<void> _generateAndSavePDF(
    BuildContext context,
    String title,
    double loanAmount,
    double interestRate,
    int totalMonths,
    double totalInterest,
    double totalPayment,
  ) async {
    String engtitle = title.trim();

    if (engtitle == 'បញ្ញើថេរ') {
      engtitle = 'Fixed Deposit';
    } else if (engtitle == 'ការសន្សំប្រចាំខែ') {
      engtitle = 'Monthly Savings';
    } else if (engtitle == 'គណនីសន្សំអត្រាការប្រាក់ខ្ពស់') {
      engtitle = 'High-Interest Savings Account';
    } else if (engtitle == 'គណនីសន្សំធម្មតា') {
      engtitle = 'Regular Savings Account';
    } else if (engtitle == 'គណនីសន្សំសម្រាប់កុមារ') {
      engtitle = 'Children Savings Account';
    } else if (engtitle == 'គណនីសន្សំសម្រាប់គោលដៅជាក់លាក់') {
      engtitle = 'Goal-Based Savings Account';
    }
    // final khmerFont = pw.Font.ttf(await rootBundle.load('assets/fonts/NOTOSANSKHMER-BOLD.TTF'));
    final pdf = pw.Document(
      //   theme: pw.ThemeData.withFont(
      //   base: khmerFont,
      // ),
    );
    final formatter = NumberFormat("#,##0.00", "en_US");

    pdf.addPage(
      pw.MultiPage(
        build: (pw.Context context) => [
          pw.Header(
            level: 0,
            child: pw.Text('Payment schedule', textAlign: pw.TextAlign.center),
          ),
          pw.Text(
            'Saving Method: $engtitle',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
          pw.Text(
            'Total Principal: ${formatter.format(loanAmount)}',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
          pw.Text(
            'Interest Rate: ${interestRate.toStringAsFixed(2)}%',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
          pw.Text(
            'Term: $totalMonths Month',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),

          pw.SizedBox(height: 10),
          pw.Text(
            'Total Interest: ${formatter.format(totalInterest)}',
            style: const pw.TextStyle(color: PdfColors.red),
          ),
          pw.Text(
            'Total Payment: ${formatter.format(totalPayment)}',
            style: const pw.TextStyle(color: PdfColors.green),
          ),
        ],
      ),
    );
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
