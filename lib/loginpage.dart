import 'package:flutter/material.dart';
import 'package:animated_switch/animated_switch.dart';
import 'package:owdmsapp/fiirstpage.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  final FocusNode _focususername = FocusNode();
  final FocusNode _focuspassword = FocusNode();

  Future<void> login(BuildContext context) async {
  final response = await http.post(
    Uri.parse('http://192.168.93.133/connection/dbconnection.php'),
    body: {
      'username': username.text,
      'password': password.text,
    },
  );

  if (response.body == 'success') {
    // Login successful, navigate to fist page
    print('Login successful');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Firstpage()),
    );
  } else {
    // Login failed, show error message
    print('Login failed');
     _showErrorDialog(context);
     username.clear();
     password.clear();
     _focususername.requestFocus();
  }
}

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Failed'),
          content: Text('Incorrect username or password. Please try again.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Welcome !',style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                  
                      ),),
                      SizedBox(height: 30,),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          controller: username,
                          focusNode: _focususername,
                          maxLength: 30,
                          decoration: InputDecoration(
                          hintText: 'User Name',
                          label: Text('User Name'),
                            fillColor: Color(0xffD8D8DD),
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          controller: password,
                          focusNode: _focuspassword,
                          obscureText: true,
                          maxLength: 30,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            label: Text('Password'),
                            suffixIcon: Icon(Icons.visibility_off),
                            fillColor: Color(0xffD8D8DD),
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 19,top: 8,right: 19),
                        child: Row(
                     children: [
                         AnimatedSwitch(
                           colorOff: Color(0xffA09F99),
                         ),
                       SizedBox(width: 5,),
                       Text('Remember me',style: TextStyle(
                         color: Colors.grey,
                       ),
                       ),
                       Spacer(),
                       Text("Forgot Password",style: TextStyle(
                         color: Colors.grey,
                       ),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: MaterialButton(
                          onPressed: () {
                            if (username.text.isEmpty) {
                              print('User Name Empty');
                              _focususername.requestFocus();
                            } else if (password.text.isEmpty) {
                              _focuspassword.requestFocus();
                            } else {
                              login(context); // Pass the context here 
                            }
                          },
                          
                          child: Text('Login',              
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                              ),
                            ),
                          color: Color.fromARGB(255, 41, 130, 159),
                          textColor: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              )
            ],
          ),
        );
  }
}
