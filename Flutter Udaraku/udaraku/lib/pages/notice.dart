import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
            ),
            width: 250,
            height: 300,
            child: Center(
              child: Text(
                'GAMBAR',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 1),
            child: Text(
              'Helping you \n to monitoring clean air for \n healthy living',
              textAlign: TextAlign.center,
            ),
          )
        ],
      )),
    );
  }
}
