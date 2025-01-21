import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Stack(children: [
                Image.network('https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fG1hbiUyMHRhbGtpbmd8ZW58MHx8MHx8fDA%3D',),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/terminal.png', width: 30, height: 30,),
                      Text("Abhiraj", style: TextStyle(fontSize: 40, color: Colors.deepPurpleAccent, fontWeight: FontWeight.w800),),
                      Text("Chauhan", style: TextStyle(fontSize: 40, color: Colors.deepPurpleAccent, fontWeight: FontWeight.w800),),
                      Container(decoration: BoxDecoration(color: Colors.deepPurpleAccent), width: 100, height: 15,),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Image.asset('assets/youtube.png', width: 20, height: 20,),
                          SizedBox(width: 5,),
                          Image.asset('assets/youtube.png', width: 20, height: 20,),
                          SizedBox(width: 5,),
                          Image.asset('assets/youtube.png', width: 20, height: 20,),
                          SizedBox(width: 5,),
                          Image.asset('assets/youtube.png', width: 20, height: 20,),
                        ],
                      )

                    ],
                  ),
                )
              ],),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff3d3d3d)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 20),
                        child: Text("- Introduction", style: TextStyle(fontSize: 15, color: Colors.grey),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 10),
                        child: Text("Abhiraj Singh Chauhan is a great flutter Developer and he wants to develop awesome apps in flutter", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    ),
  );
}
