import 'package:app/dashboard/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  static const String _title = 'Flutter App';

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: SignUP._title,
      home: Scaffold(
        appBar: AppBar(title: const Text(SignUP._title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cfpasswordController = TextEditingController();

   loginButton() async {
    try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: nameController.text,
    password: passwordController.text,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  ' Welcome ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Container(
               padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
             Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                controller: cfpasswordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confrim Password',
                ),
              ),
            ),
           
           SizedBox(height: 15,),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('SignUp'),
                  onPressed: () {

                    print(nameController.text);
                    print(passwordController.text);
                  },
                )
            ),
           Row(
              children: <Widget>[
                const Text('Already Account?'),
                TextButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Login()),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}