import 'dart:math';
import 'compound_interest.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


class ResultScreen extends StatelessWidget {
  final double loanAmount;
  final double interestRate;
  final int totalMonths;
  final String title;

  // Add this

  const ResultScreen({
    super.key,
    required this.loanAmount,
    required this.interestRate,
    required this.totalMonths,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,##0.00", "en_US");
    double monthlyRate = interestRate / 100 / 12;
    double remaining = loanAmount;
    double principal;

    // Calculate totals
    double totalInterest = 0;
    double totalPayment = 0;

    List<Map<String, dynamic>> paymentSchedule = [];
    if (title == 'រំលស់ថយចុះ ឬ​រំលស់ដើមថេរ') {
      principal = loanAmount / totalMonths;
      for (int i = 0; i < totalMonths; i++) {
        double earlyBalance = remaining;
        double interest = remaining * monthlyRate;
        double payment = principal + interest;
        double endBalance = remaining - principal;

        totalInterest += interest;
        totalPayment += payment;
        paymentSchedule.add({
          'month': i + 1,
          'early_balance': earlyBalance,
          'payment': payment,
          'principal': principal,
          'interest': interest,
          'balance': endBalance < 0 ? 0 : endBalance,
        });
        remaining = endBalance;
      }
    } else if (title == 'បង់រំលស់ថេរ') {
      double earlyBalance = loanAmount;
      double payment =
          loanAmount *
          monthlyRate /
          (1 - (1 / pow(1 + monthlyRate, totalMonths).toDouble()));
      for (int i = 0; i < totalMonths; i++) {
        double interest = monthlyRate * earlyBalance;
        double principal = payment - interest;
        double endBalance = earlyBalance - principal;

        totalInterest += interest;
        totalPayment += payment;
        paymentSchedule.add({
          'month': i + 1,
          'early_balance': earlyBalance,
          'payment': payment,
          'principal': principal,
          'interest': interest,
          'balance': endBalance < 0 ? 0 : endBalance,
        });
        earlyBalance -= principal;
        remaining = endBalance;
      }
    } else if (title == 'សំណងពាក់កណ្តាល-ពាក់កណ្តាល') {
      double interest;
      double earlyBalance;
      double payment = 0;
      double endBalance = 0;
      double hak = totalMonths / 2;
      earlyBalance = loanAmount;
      double principal = 0;
      int l = 1;
      for (int i = 0; i < totalMonths; i++) {
        earlyBalance -= principal;
        interest = monthlyRate * earlyBalance;
        if (l < hak) {
          payment = interest;
          endBalance = earlyBalance - principal;
        } else if (l == hak) {
          principal = loanAmount / 2;
          payment = interest + principal;
          endBalance = earlyBalance - principal;
        } else if (l == totalMonths) {
          principal = loanAmount / 2;
          endBalance = earlyBalance - principal;
          payment = interest + principal;
        } else if (l > hak) {
          earlyBalance = endBalance;
          payment = interest;
          principal = 0;
        }
        totalInterest += interest;
        totalPayment += payment;
        paymentSchedule.add({
          'month': i + 1,
          'early_balance': earlyBalance,
          'payment': payment,
          'principal': principal,
          'interest': interest,
          'balance': endBalance < 0 ? 0 : endBalance,
        });
        remaining = endBalance;
        l++;
      }
    } else if (title == 'សងការរាល់ខែ​ និងទូទាត់ដើមនៅចុងកាលបរិច្ឆេទ') {
      double interest = monthlyRate * loanAmount;
      double principal = 0;
      double earlyBalance = loanAmount;
      for (int i = 0; i < totalMonths; i++) {
        double payment = interest;
        double endBalance = loanAmount;
        if (i == totalMonths - 1) {
          payment = loanAmount + interest;
          principal = loanAmount;
          endBalance -= principal;
        }
        totalInterest += interest;
        totalPayment += payment;
        paymentSchedule.add({
          'month': i + 1,
          'early_balance': earlyBalance,
          'payment': payment,
          'principal': principal,
          'interest': interest,
          'balance': endBalance < 0 ? 0 : endBalance,
        });
        remaining = endBalance;
      }
    } else if (title == 'កម្ចីសងតែម្តង') {
      double interest;
      double earlyBalance = loanAmount;
      double endBalance = 0;

      for (int i = 0; i < totalMonths; i++) {
        interest = 0;
        double payment = 0;
        double principal = 0;
        endBalance = earlyBalance;
        if (i == totalMonths - 1) {
          principal = earlyBalance;
          interest = (monthlyRate * loanAmount) * totalMonths;
          payment = interest + earlyBalance;
          endBalance -= earlyBalance;
        }
        totalInterest += interest;
        totalPayment += payment;
        paymentSchedule.add({
          'month': i + 1,
          'early_balance': earlyBalance,
          'payment': payment,
          'principal': principal,
          'interest': interest,
          'balance': endBalance < 0 ? 0 : endBalance,
        });
        remaining = endBalance;
      }
    }
    if (title == 'ផ្គួបការប្រាក់') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => CompoundInterest(
              loanAmount: loanAmount,
              interestRate: interestRate,
              totalMonths: totalMonths,
              title: title,
            ),
          ),
        );
      });

      return const SizedBox.shrink(); // Don't return any Scaffold here
    }

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
                loanAmount,
                interestRate,
                totalMonths,
                totalInterest,
                totalPayment,
                paymentSchedule,
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
                        formatter.format(loanAmount),
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
                        'សរុបទូទាត់:',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columnSpacing: 20,
                    headingRowColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 225, 235, 255),
                    ),
                    columns: const [
                      DataColumn(
                        label: Text(
                          'ខែ',
                          style: TextStyle(
                            fontFamily: 'Misan',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'ប្រាក់ដើមគ្រា',
                          style: TextStyle(
                            fontFamily: 'Misan',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'សំណងទូទាត់',
                          style: TextStyle(
                            fontFamily: 'Misan',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'រលស់ប្រាក់ដើម',
                          style: TextStyle(
                            fontFamily: 'Misan',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'ការប្រាក់',
                          style: TextStyle(
                            fontFamily: 'Misan',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'សមតុល្យចុងគ្រា',
                          style: TextStyle(
                            fontFamily: 'Misan',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    rows: paymentSchedule.map((payment) {
                      return DataRow(
                        color: payment['month'] % 2 == 0
                            ? WidgetStateProperty.all(Colors.grey[50])
                            : null,
                        cells: [
                          DataCell(
                            Text(
                              '${payment['month']}',
                              style: const TextStyle(fontFamily: 'Misan'),
                            ),
                          ),
                          DataCell(
                            Text(
                              formatter.format(payment['early_balance']),

                              style: const TextStyle(fontFamily: 'Misan'),
                            ),
                          ),
                          DataCell(
                            Text(
                              formatter.format(payment['payment']),
                              style: const TextStyle(
                                fontFamily: 'Misan',
                                color: Colors.green,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              formatter.format(payment['principal']),
                              style: const TextStyle(fontFamily: 'Misan'),
                            ),
                          ),
                          DataCell(
                            Text(
                              formatter.format(payment['interest']),
                              style: const TextStyle(
                                fontFamily: 'Misan',
                                color: Colors.red,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              formatter.format(payment['balance']),
                              style: const TextStyle(fontFamily: 'Misan'),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
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
    List<Map<String, dynamic>> paymentSchedule,
  ) async {
    String engtitle = title.trim();

if (engtitle == 'រំលស់ថយចុះ ឬ​រំលស់ដើមថេរ') {
  engtitle = 'Declining Balance Repayment or Fixed Principal Repayment';
} else if (engtitle == 'បង់រំលស់ថេរ') {
  engtitle = 'Fixed Installment Repayment';
} else if (engtitle == 'សំណងពាក់កណ្តាល-ពាក់កណ្តាល') {
  engtitle = 'Half-and-Half Settlement';
} else if (engtitle == 'សងការរាល់ខែ​ និងទូទាត់ដើមនៅចុងកាលបរិច្ឆេទ') {
  engtitle = 'Pay Interest Monthly and Principal at Maturity';
} else if (engtitle == 'កម្ចីសងតែម្តង') {
  engtitle = 'Single Payment';
} else if (engtitle == 'ផ្គួបការប្រាក់') {
  engtitle = 'Conpound interest';
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
            'Loan Method: $engtitle',
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
          pw.SizedBox(height: 20),
          pw.Table(
            border: pw.TableBorder.all(),
            defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
            children: [
              // Header row
              pw.TableRow(
                decoration: const pw.BoxDecoration(color: PdfColors.blue),
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        'Month',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.white,
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        'Principal',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.white,
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        'Payment',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.white,
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        'Principal Paid',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.white,
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        'Interest',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.white,
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        'Balance',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Data rows
              ...paymentSchedule.map((e) {
                return pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(
                        '${e['month']}',
                        textAlign: pw.TextAlign.center,
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(
                        formatter.format(e['early_balance']),
                        textAlign: pw.TextAlign.center,
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(
                        formatter.format(e['payment']),
                        textAlign: pw.TextAlign.center,
                        style: const pw.TextStyle(color: PdfColors.green),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(
                        formatter.format(e['principal']),
                        textAlign: pw.TextAlign.center,
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(
                        formatter.format(e['interest']),
                        textAlign: pw.TextAlign.center,
                        style: const pw.TextStyle(color: PdfColors.red),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(
                        formatter.format(e['balance']),
                        textAlign: pw.TextAlign.center,
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ],
      ),
    );
    
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
