import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geo_location/screens/simple_map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(

      title: const Text("Flutter Google Map"),
      centerTitle: true,
    ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                     return const SimpleMapScreen();
                   }));
                },
                child: const Text("Simple Map"))
          ],
        ),
      ),

    );
  }
}
