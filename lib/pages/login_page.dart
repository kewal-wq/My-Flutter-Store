import 'package:flutter/material.dart';
import 'package:flutter_application_learn/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  // const login_page({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

String name = "";
bool changeButton = false;
final _formKey = GlobalKey<FormState>();

moveToHome(BuildContext context) async {
if(_formKey.currentState!.validate())
{
  setState(() {
               changeButton = true;
             });
             await Future.delayed(Duration(seconds: 1));
            await Navigator.pushNamed(context, MyRoutes.homeRoute);
            setState(() {
               changeButton = false;
             });
}
}

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
    
     child: SingleChildScrollView(
       child: Form(
         key: _formKey,
         child: Column(
           children: [
             Image.asset("assets/images/login_page.png",
             fit: BoxFit.cover,),
             SizedBox(
               height: 20.0,
             ),
             Text("Welcome, $name",
              style: TextStyle(
               fontSize: 28,
               fontWeight: FontWeight.bold,
             ),
             ),
             SizedBox(
               height: 20.0,
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
               child: Column(
                 children: [
                   TextFormField(
                 decoration: InputDecoration(
                   hintText: "Enter Username",
                   labelText: "Username",
                   
                ),
             validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },

             
                onChanged: (value){
                  name = value;
                  setState(() {
                    
                  });
                },
               ),
               TextFormField(
                 obscureText: true,
                 decoration: InputDecoration(
                   hintText: "Enter Password",
                   labelText: "Password"
                 ),
                  validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                          else if(value.length < 6)
                          {
                            return "Password must contain atleast 6 characters";
                          }
                          return null;
                        },
               ),
               SizedBox(
                 height: 60.0
               ),
              
            Material(
            color: Vx.indigo400,
              //We can also use BoxShape here to change the shape
              borderRadius: BorderRadius.circular(changeButton? 40: 8),
            
         child: InkWell(
           onTap: () => moveToHome(context),
             
           
           child: AnimatedContainer(
             duration: Duration(seconds: 1),
             width: changeButton? 40: 130,
             height: 40,
            //  color: Colors.deepPurple,
             alignment: Alignment.center,
            
            child: changeButton?Icon(
              Icons.done,
              color: Colors.white,
            )
            :Text("Login",
             style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
         fontSize: 18,
            ),
             
            ),
            
           ),
         ),
            ),
                 ],
               ),
             )
           ],
         ),
       ),
     ),
    );
  }
}