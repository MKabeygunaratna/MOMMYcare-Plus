import 'package:flutter/material.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({Key? key}) : super(key: key);

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  bool isProSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Subscription Plan',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Toggle Button
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E0FF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildToggleButton('Basic', !isProSelected),
                    _buildToggleButton('Pro', isProSelected),
                  ],
                ),
              ),
              SizedBox(height: isProSelected? 20:5),

              // Centered Subscription Box
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: isProSelected? 600: 550, // Increased height
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Purple Top Section
                        ClipPath(
                          clipper: WaveClipper(),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Color(0xFF8474CB),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                isProSelected ? '\$5 per month' : 'FREE',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),
                        _buildFeaturesList(isProSelected) ,
                        const SizedBox(height: 40),

                        if (isProSelected)
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0, bottom: 16),
                            child: SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF8474CB),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  side: const BorderSide(color: Colors.black, width: 2),
                                ),
                                child: const Text(
                                  'Buy Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isProSelected = text == 'Pro';
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 36),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8474CB) : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesList(bool isPro) {
    final features = isPro
        ? [
      'Unlimited access for the chatbot',
      'Guardians getting alerts',
      'No ads',
      'Self Care Tips',
    ]
        : [
      'Limited access for the chatbot',
      'EPDS Test',
      'To Do List',
      'Calendar',
      'Educational Library',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: features
            .map((feature) => Padding(
          padding: EdgeInsets.only(bottom: isPro ? 28.0 : 12.0),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 5,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  feature,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ))
            .toList(),
      ),
    );
  }
}
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7); // Start from bottom left

    path.quadraticBezierTo(
      size.width * 0.2, size.height * 1.2, // First deep curve
      size.width * 0.5, size.height * 0.9,
    );

    path.quadraticBezierTo(
      size.width * 0.8, size.height * 0.6, // Second deep curve
      size.width, size.height * 0.9,
    );

    path.lineTo(size.width, 0); // Move to top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

