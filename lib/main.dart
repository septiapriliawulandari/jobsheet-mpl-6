import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ubah Nama Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentNamesScreen(),
    );
  }
}

class StudentNamesScreen extends StatefulWidget {
  @override
  _StudentNamesScreenState createState() => _StudentNamesScreenState();
}

class _StudentNamesScreenState extends State<StudentNamesScreen> {
  final List<Map<String, dynamic>> students = [
    {'name': 'Septi Aprilia Wulandari', 'color': Colors.red},
    {'name': 'Fatin Nurmalaningrum', 'color': Colors.green},
    {'name': 'Immaculata Hagar Kemala', 'color': Colors.blue},
    {'name': 'Margereta Stephani', 'color': Colors.orange},
    {'name': 'Salsabila Mumtaz', 'color': Colors.purple},
  ];

  Color andiColor = Colors.purple;
  final Random random = Random();

  void _refreshAndiColor() {
    setState(() {
      andiColor = Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hallo Dunia'),
          backgroundColor:
              Colors.blue,
      ),
      body: PageView.builder(
        itemCount: students.length + 1,
        itemBuilder: (context, index) {
          if (index == students.length) {
            return Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Apa kabar',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Andi',
                      style: TextStyle(fontSize: 40, color: andiColor),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Apa kabar',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Text(
                      students[index]['name'],
                      style: TextStyle(fontSize: 40, color: students[index]['color']),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshAndiColor,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
