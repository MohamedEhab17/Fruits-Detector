import 'package:flutter/material.dart';

class PredictionResult extends StatelessWidget {
  final String result;
  const PredictionResult({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    if (result.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text: 'Result: ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Theme.of(context).textTheme.titleSmall!.color,
          ),
          children: [
            TextSpan(
              text: result,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        //  Text(
        //   "Result: $result",
        //   style: const TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
    );
  }
}
