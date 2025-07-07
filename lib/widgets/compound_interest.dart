import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
class CompoundInterest extends StatelessWidget {
  final double loanAmount;
  final double interestRate;
  final int totalMonths;
  final String title;
  // Add this

  const CompoundInterest({
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

    // Calculate totals
    double totalInterest = 0;
    double totalPayment = 0;
    List<Map<String, dynamic>> paymentSchedule = [];

    if (title == 'ផ្គួបការប្រាក់') {
      double compoundInterest = 0;
      double endBalance = 0;
      double payment = 0;
      double principal = 0;
      double earlyBalance = loanAmount;

      for (int i = 0; i < totalMonths; i++) {
        double interest = earlyBalance * monthlyRate;
        endBalance = earlyBalance + interest;
        compoundInterest += interest;
        earlyBalance += interest;

        if (i == totalMonths - 1) {
          payment = compoundInterest + earlyBalance;
          principal = earlyBalance - compoundInterest;
          payment = endBalance;
          endBalance -= payment;
        }

        totalInterest += interest;
        totalPayment += payment;
        paymentSchedule.add({
          'month': i + 1,
          'compound_interest': compoundInterest,
          // 'early_balance': earlyBalance,
          'payment': payment,
          'principal': principal,
          'interest': interest,
          'balance': endBalance < 0 ? 0 : endBalance,
        });
        remaining = endBalance;
      }
    } else {
      // return const SizedBox.shrink();
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
        backgroundColor: const Color.fromARGB(255, 0, 47, 129),
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
                          'សមតុល្យត្រូវបង់',
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
                          'ការប្រាក់ផ្គួប',
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
                              formatter.format(payment['payment']),

                              style: const TextStyle(
                                fontFamily: 'Misan',
                                color: Colors.green,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              formatter.format(payment['interest']),
                              style: const TextStyle(fontFamily: 'Misan'),
                            ),
                          ),
                          DataCell(
                            Text(
                              formatter.format(payment['compound_interest']),
                              style: const TextStyle(
                                fontFamily: 'Misan',
                                color: Colors.red,
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

    if (engtitle == 'ផ្គួបការប្រាក់') {
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
            'Calculation Method: $engtitle',
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
                        'Compound Interest',
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
                        formatter.format(e['payment']),
                        textAlign: pw.TextAlign.center,
                        style: const pw.TextStyle(color: PdfColors.green),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(
                        formatter.format(e['interest']),
                        textAlign: pw.TextAlign.center,
                        
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(
                        formatter.format(e['compound_interest']),
                        textAlign: pw.TextAlign.center,
                         style: const pw.TextStyle(color: PdfColors.red),
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
