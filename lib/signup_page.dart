import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'test.dart';

class SignupPage extends StatefulWidget{
  const SignupPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SignupPageState();
  }
}
class _SignupPageState extends State<SignupPage>{
  final _keyForm= GlobalKey<FormState>();
  final _usernameController= TextEditingController();
  final _emailController= TextEditingController();
  final _passwordController= TextEditingController();
  final _passConfirmController= TextEditingController();

  String? _validateUsername(String? username){
    if (username == null || username.trim().isEmpty || username.trim().length<3){
      return "Username must be at least 3 characters";
    }
    return null;
  }
  String? _validateEmail(String? email){
    if (email == null || email.trim().isEmpty || !email.contains("@") || !email.contains(".")){
      return "Please enter a valid email";
    }
    return null;
  }
  String? _validatePassword(String? password){
    if (password == null || password.trim().isEmpty || password.trim().length<6){
      return "Password must be at least 6 characters";
    }
    return null;
  }
  String? _validatePassConfirm(String? passconfirm){
    if(passconfirm != _passwordController.text){
      return "Passwords do not match";
    }
    return null;
  }
  void _createAccount(){
    if(_keyForm.currentState!.validate()){
      final newUsername= _usernameController.text;
      final newPassword= _passwordController.text;

      Database.username= newUsername;
      Database.password= newPassword;

      ScaffoldMessenger.of(context).showSnackBar
        (SnackBar(content: Text("Account created successfully...")));
      context.pop();
    }
  }
  @override
  void initState(){
    super.initState();
    print("Start Signup");
  }
  @override
  void dispose(){
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passConfirmController.dispose();
    print(" Finish Creating Account");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2
          ),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: Icon(Icons.arrow_circle_left_outlined)),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
               const Text("Welcome to you.",
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 30,
                       color: Color(0xFF790D16)
                   )),
                const SizedBox(height: 10,),
                Text("Let's create a new account...",
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.secondary
                    )),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username:",
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 15,
                    ),
                    border: OutlineInputBorder()
                  ),
                  validator: _validateUsername,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email:",
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 15,
                      ),
                    border: OutlineInputBorder()
                  ),
                  validator: _validateEmail,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: "Password:",
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder()
                  ),
                  obscureText: true,
                  validator: _validatePassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passConfirmController,
                  decoration: InputDecoration(
                      labelText: "Confirm Password:",
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder()
                  ),
                  obscureText: true,
                  validator: _validatePassConfirm,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: _createAccount,
                    child: const Text("Create Account",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1
                      ),))
              ],
            ),
          )
        )
      ),
    );
  }
}