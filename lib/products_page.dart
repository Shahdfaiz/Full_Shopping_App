import 'package:flutter/material.dart' ;
import 'package:go_router/go_router.dart';
class ProductsPage extends StatefulWidget{
  const ProductsPage({super.key});
  @override
  State<ProductsPage> createState() {
    return _ProductsPageState() ;
  }
}

class _ProductsPageState extends State<ProductsPage>{

  @override
  void initState() {
    print(" start Products");
    super.initState();
  }

  @override
  void dispose() {
    print(" finish Products");
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
            const Text("Welcome to Products Page",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xFF790D16)
                )),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              context.pop();
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