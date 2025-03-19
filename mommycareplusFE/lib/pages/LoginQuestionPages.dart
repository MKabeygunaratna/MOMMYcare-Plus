import 'package:flutter/material.dart';
import 'package:mommycareplusFE/pages/GuardianScreen.dart';
import 'package:provider/provider.dart';
import 'UserProvider.dart';


class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.15),
                      // Question Text
                      Text(
                        "What do you want me to call you?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.w600, color: Color(0xFF7261C6)),
                      ),
                      SizedBox(height: screenHeight * 0.06),
                      Container(
                        width: double.infinity,
                        padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF7261C6), width: 1.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          controller: _nameController,
                          style: TextStyle(fontSize: screenWidth * 0.05),
                          decoration: const InputDecoration(
                            hintText: "Name",
                            border: InputBorder.none,
                          ),
                          validator: (value){
                            if(value == null || value.trim().isEmpty){
                              return "Please enter your name";
                            }
                            if(!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)){
                              return "Only letters and spaces allowed";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 120),
                      // Bottom Section (Image + Button)
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.03 , left: screenWidth * 0.05, right: screenWidth * 0.05), // Add padding for better positioning
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Image.asset(
                                "assets/images/image8.png",
                                width: screenWidth * 0.6,
                                fit: BoxFit.contain,
                              ),
                            ),
                            // Bottom Left Image
                            // Next Button at Bottom Right
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF7261C6),
                                foregroundColor: Colors.white,
                                minimumSize:  Size(screenWidth * 0.3, screenHeight * 0.06),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              ),
                              onPressed: () {
                                if(_formKey.currentState!.validate()){
                                  Provider.of<UserProvider>(context, listen: false).setName(_nameController.text);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PageTwo()));
                                }
                              },
                              child: const Text("NEXT", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20), // Extra space at the bottom
                    ],
                  ),
                )
            )
        ),
      ),
    );
  }
}
class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final TextEditingController _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.15),

                    // Question Text
                    Text(
                      "What is your age?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.w600, color: Color(0xFF7261C6)),
                    ),

                    SizedBox(height: screenHeight * 0.06),

                    // Input Field
                    Container(
                      width: double.infinity,
                      padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF7261C6), width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: screenWidth * 0.05),
                        decoration: const InputDecoration(
                          hintText: "Age",
                          border: InputBorder.none,
                        ),
                        validator: (value){
                          if(value == null || value.trim().isEmpty){
                            return "Please enter your age";
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return "Enter a valid number";
                          }
                          int age = int.tryParse(value) ?? 0;
                          if (age < 18 || age > 99) {
                            return "Enter a valid age (18-99)";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 120),
                    // Bottom Section (Image + Button)
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.03 , left: screenWidth * 0.05, right: screenWidth * 0.05), // Add padding for better positioning
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Image.asset(
                              "assets/images/image15.png",
                              width: screenWidth * 0.6,
                              fit: BoxFit.contain,
                            ),
                          ),
                          // Bottom Left Image
                          // Next Button at Bottom Right
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7261C6),
                              foregroundColor: Colors.white,
                              minimumSize:  Size(screenWidth * 0.3, screenHeight * 0.06),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                Provider.of<UserProvider>(context, listen: false).setAge(_ageController.text);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const PageThree()));
                              }
                            },
                            child: const Text("NEXT", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20), // Extra space at the bottom
                  ],
                ),
              )

          ),
        ),
      ),
    );
  }
}


class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  final TextEditingController _postpartumController = TextEditingController();
  final _formKey  = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.15),
                    // Question Text
                    Text(
                      "What is your postpartum period?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.w600, color: Color(0xFF7261C6)),
                    ),

                    SizedBox(height: screenHeight * 0.06),
                    // Input Field
                    Container(
                      width: double.infinity,
                      padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF7261C6), width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: _postpartumController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: screenWidth * 0.05),
                        decoration: const InputDecoration(
                          hintText: "Postpartum Period",
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value
                              .trim()
                              .isEmpty) {
                            return "Please enter your postpartum period";
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return "Enter a valid number";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 120),
                    // Bottom Section (Image + Button)
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.03 , left: screenWidth * 0.05, right: screenWidth * 0.05), // Add padding for better positioning
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Image.asset(
                              "assets/images/image21.png",
                              width: screenWidth * 0.6,
                              fit: BoxFit.contain,
                            ),
                          ),
                          // Bottom Left Image
                          // Next Button at Bottom Right
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7261C6),
                              foregroundColor: Colors.white,
                              minimumSize:  Size(screenWidth * 0.3, screenHeight * 0.06),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Provider.of<UserProvider>(context, listen: false)
                                    .setPostpartum(_postpartumController.text);
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>
                                        GuardianDetailsScreen()));
                              }
                            },
                            child: const Text("NEXT", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20), // Extra space at the bottom
                  ],
                ),
              )

          ),
        ),
      ),
    );
  }
}
