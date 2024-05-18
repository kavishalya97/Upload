import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: const Text('Simple Login App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 10,
          backgroundColor: Color.fromARGB(255, 140, 207, 229),
          
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.15),
                        Colors.black.withOpacity(0.5),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter
                  )
              ),
            ),
            Center(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Welcome to first loggin app',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            ),
          ]
        ),
        
    );
  }
}