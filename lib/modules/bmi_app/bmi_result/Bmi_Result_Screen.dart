import 'package:flutter/material.dart';
class BmiResultScreen extends StatelessWidget {
  final double result;
  final bool IsMale;
  final int age;
  BmiResultScreen({
    @required this.result,
    @required this.age,
    @required this.IsMale
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
          Icons.arrow_back,
          ),
        ),
        title: Text(
          'BMI RESULT'
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${IsMale ? 'Male' :'Female'}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            Text(
                'Result : ${result.round()}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              )
            ),
            Text(
              'Age : $age',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                )
            ),
          ],
        ),
      ),
    );
  }
}
