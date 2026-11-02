import 'package:flutter/material.dart' ;
import 'package:go_router/go_router.dart';
import 'test.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePageState() ;
  }
}

class _HomePageState extends State<HomePage>{

  @override
  void initState() {
    print(" start Home");
    super.initState();
  }

  @override
  void dispose() {
    print(" finish Home");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Welcome to Home Page",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xFF790D16)
              ),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed:(){
              context.push("/home/products");
            }, child: Text("View Products",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1
              ),)),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Database.isLoggedIn= false;
              context.go("/login");
            }, child: const Text("Go back",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1
              ),))
          ],
        ),
      ),
    );
  }
}