import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';
class FaceBookScreen extends StatelessWidget {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Text(
            'Facebook',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/face.png'),
                      radius: 100.0,
                    ),
                  ),
                ),
                Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                ),
                SizedBox(height: 15.0,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (String value) {
                    if(value.isEmpty)
                      return'email must not be empty';
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    labelText: 'EMail',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  validator: (String value) {
                    if(value.isEmpty)
                      return'password must not be empty';
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.power_input,
                    ),
                    suffix: Icon(
                      Icons.remove_red_eye,
                    ),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    MaterialButton(
                      color: Colors.blue,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                        onPressed: (){
                         if(formKey.currentState.validate())
                           {
                             print(emailController.text);
                             print(passwordController.text);
                           }
                        }
                        ),
                    SizedBox(width: 10.0),
                    MaterialButton(
                      color: Colors.blue,
                      child: Text(
                        'SignUP',
                        style: TextStyle(color: Colors.white),
                      ),
                        onPressed: (){
                        if(formKey.currentState.validate())
                          {
                            print(emailController.text);
                            print(passwordController.text);
                          }
                        }
                        ),
                  ],
                ),
                Center(
                  child: TextButton(
                      onPressed: (){},
                      child:Text(
                        'Forget Password ?',
                      ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
