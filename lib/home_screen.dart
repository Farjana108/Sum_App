import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _numberOneTEController = TextEditingController();
  final TextEditingController _numberTwoTEController = TextEditingController();

  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text(
          'Sum Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _numberOneTEController,
              decoration: const InputDecoration(hintText: 'Number One'),
            ),
            const SizedBox(
              height: 16,
            ),
             TextField(
              controller: _numberTwoTEController,
              decoration: InputDecoration(hintText: 'Number Two'),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      double numOne = double.tryParse(_numberOneTEController.text.trim()) ?? 0;
                      double numTwo = double.tryParse(_numberTwoTEController.text.trim()) ?? 0;
                      double result = add(numOne, numTwo);
                      _result = result;
                      setState(() {

                      });
                    },
                    child: const Text('Add'),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      double numOne = double.tryParse(_numberOneTEController.text.trim()) ?? 0;
                      double numTwo = double.tryParse(_numberTwoTEController.text.trim()) ?? 0;
                      double result = subs(numOne, numTwo);
                      _result = result;
                      setState(() {

                      });
                    },
                    child: const Text('Subs'),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: clear,
                    child: const Text('Clear'),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Result: $_result',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  void clear() {
    _numberOneTEController.clear();
    _numberTwoTEController.clear();
    _result = 0;
    setState(() {});
  }

  double add(double numOne, double numTwo) {
    return numOne + numTwo;
  }

  double subs(double numOne, double numTwo) {
    return numOne - numTwo;
  }
}
