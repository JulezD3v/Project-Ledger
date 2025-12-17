import 'package:flutter/material.dart';
import 'package:proj_ledger/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              //Top Icon
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsetsGeometry.only(top: 50.0),
                  child: Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(34.0),
                    ),
                    child: const Icon(
                      Icons.add_business_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child:  Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        // Heading
                        const Text(
                          "Create Account",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize:
                                24, // Increased slightly for better hierarchy
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 8.0),

                        // Sub-heading
                        const Text(
                          "Stop guessing. Start tracking.\nThe simplest way to manage your textile inventory.",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color:
                                Colors.white70, // Fixed: white24 was invisible
                            height: 1.5, // Adds clean spacing between lines
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis, // Fixed: 'Texto' was a syntax error
                        ),
                      ],
                      ),
                  ), 
                ],
              ),
              const SizedBox(height: 12.0,),
              //My form
              SignUpForm(),
  
                ],
                  ),
                ),
              ), 

            

          );

  }
}
//Actual Form Creation
class SignUpForm extends StatelessWidget {
   SignUpForm({super.key});
  final TextEditingController _username = TextEditingController();
  final GlobalKey<FormState>_formkey  = GlobalKey<FormState>();// for validation
  
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Form(
              key: _formkey,
              child: TextFormField( //changed to textform feild since its a form
                controller: _username,
                autofocus: false,
                style: TextStyle(
                  fontFamily: "Poppin",
                  color: Colors.white
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.previous,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value){
                  //Triggers the validator while typing
                  if(value == null || value.isEmpty){
                    return "Empty";
                  }
                  return null;
                },
                decoration:
              
                InputDecoration(


                  hintText: "Email",
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.white)
                    
                  ),
                  
                ),
              ),
            ),
            const SizedBox(height: 10.0,),

            SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                // --- THIS IS WHERE YOU PUT IT ---
                if (_formkey.currentState!.validate()) { //use .save
                  // If true: The inputs are Good. Proceed.
                  print("Validation Successful!");
                  // Navigator.push(...); 
                } else {
                  // If false: The inputs are Bad. Red text appears.
                  print("Validation Failed!");
                }
              },
              
              child: const Text("Create Account")
            ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}


            //Button with inkwell

            // InkWell(
            //   onTap: (){
            //     print("User request to create account");
            //     Navigator.push(context,
            //     MaterialPageRoute(builder:(context)=> LoginPage()));
            //   },
            //   child: Text(
            //     "Create Account",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontFamily: "Poppins",
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //       letterSpacing: 1.0
            //     ),)
            // ),



//---Use this GestureDetector when you dont want to be specific ---
//             GestureDetector(
//   onTap: () {
//     print("User clicked Create Account");
//     // Navigate to the next screen here
//   },
//   child: const Text(
//     "Create Account",
//     style: TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 24,
//       fontWeight: FontWeight.bold,
//       color: Colors.white,
//     ),
//   ),
// )

 // labelText: "User E-mail",
 // labelStyle: TextStyle(
 //   fontFamily: "Poppins",
 //   fontSize: 20,
 //   fontWeight: FontWeight.w500,
 // ),
 //Same function as the hint