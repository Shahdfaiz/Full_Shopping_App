// Answers in PDF submission
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'test.dart';
import 'signup_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}
class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


  void _inputCheck() {
    if (_keyForm.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;
      if (username == Database.username && password == Database.password) {
        Database.isLoggedIn = true;
        context.go("/home");
      } else {
        _usernameController.clear();
        _passwordController.clear();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Wrong info")));
      }
    }
  }

  @override
  void initState() {
    print(" start Login");
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    print(" finish Login");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Login",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 5
        ),),
        centerTitle: true,

      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(10),
        child: Form(
          key: _keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome back",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xFF790D16)
              ),),
              SizedBox(height: 15),
              Text("Let's login to start our shopping journey...",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.secondary),),
              SizedBox(height: 15,),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 15,
                    ),
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "please enter valid username ";
                  }
                  return null;
                },
              ),SizedBox(height: 15,),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (((value?.length) ?? 0) < 6) {
                    return "please enter valid password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Password",
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 15,
                    ),
                  border: OutlineInputBorder()
                ),


                obscureText: true,
              ),SizedBox(height: 15,),
              ElevatedButton(
                onPressed: _inputCheck,

                //     () {
                //   // context.go("/home");
                //
                //   // context.push("/home");
                //   // context.go("/home/products");
                //   // context.push("/home/products");
                //   context.go("/home");
                // },
                child: const Text("Go to Home",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1
                ),),
              ),
              SizedBox(height: 10,),
              TextButton(onPressed: (){
                context.push("/signup");
              }, child: const Text("Don't have an account. Sign Up"))
            ],
          ),
        ),)
      ),
    );
  }
}
