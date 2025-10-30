import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class HobbyCard extends StatelessWidget{
  final String title;
  final IconData icon;
  final Color? color;

  const HobbyCard({required this.icon, required this.title,this.color = Colors.blue, super.key});

  @override
  Widget build(BuildContext context) {
    return
    Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), 
                    color: color,  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsetsGeometry.all(30),),
                        Padding(padding: EdgeInsetsGeometry.all(20),
                          child: Icon(
                          icon,
                          color: Colors.white,
                          ),
                        ),
                          Text(title ,style: TextStyle(fontSize: 32,color: Colors.white),),
                      ],
                    ),
                  ),
                );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
        Scaffold(        
          appBar: AppBar(title: Text('My hobbies'),),
          backgroundColor: Colors.grey,
          
          body: 
          Padding(
            padding: EdgeInsetsGeometry.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 30,
              children: [
                HobbyCard(icon: Icons.travel_explore, title: 'Travelling',color: Colors.green,),
                HobbyCard(title: 'Skating', icon: Icons.ice_skating,color: Colors.blueGrey,),
                HobbyCard(icon: Icons.book, title: 'Reading', color: Colors.orange,)
              ],
            ),
          ),
        ),
      );
  }
}
