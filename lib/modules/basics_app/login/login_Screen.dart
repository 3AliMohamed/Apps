import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/componants.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey= GlobalKey<FormState>();

  bool isPasswordShow=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormFeild(
                    controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: ( String value)
                      {
                        if(value.isEmpty)
                          return("email must not be empty");
                        return null;
                      },
                      label: 'Email Address',
                      prefix: Icons.email,
                  ),
                  SizedBox(height: 15),
                  defaultFormFeild(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (String value)
                      {
                        if(value.isEmpty)
                          return("Password must not be empty ");
                        return null;
                      },
                      label: 'Password',
                      prefix: Icons.lock,
                      isPassword: isPasswordShow,
                      onSuffixPressed: ()
                       {
                         setState(() {
                           isPasswordShow=!isPasswordShow;
                         });
                       },
                      suffix: isPasswordShow? Icons.visibility :Icons.visibility_off,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultButton(
                      text: 'login',
                      function: ()
                      {
                        if(formKey.currentState.validate())
                        {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                      }
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t Have An Account?',
                      ),
                      TextButton(
                        onPressed: null,
                          child: Text(
                            'Register Now ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
