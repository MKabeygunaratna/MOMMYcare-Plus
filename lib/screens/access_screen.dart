import 'package:flutter/material.dart';
import 'notification_permission_dialog.dart';
import 'next_screen.dart';

class AccessScreen extends StatefulWidget {
  const AccessScreen({Key? key}) : super(key: key);

  @override
  State<AccessScreen> createState() => _AccessScreenState();
}

class _AccessScreenState extends State<AccessScreen> {
  bool notificationsEnabled = false;
  bool permissionAsked = false; // Whether the user completed the prompt

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD3CBFD),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/image19.png",
                  width: 270,
                  height: 270,
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Rediscover self love and acceptance, you are worth it.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Notifications Label
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Toggle Switch
                Switch(
                  value: notificationsEnabled,
                  onChanged: (val) async {
                    if (val) {
                      // Show the dialog asking for permission
                      bool? allowed = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return const NotificationPermissionDialog();
                        },
                      );

                      // The user either allowed or didn't allow
                      if (allowed == true) {
                        // User allowed notifications
                        setState(() {
                          notificationsEnabled = true;
                          permissionAsked = true;
                        });
                      } else {
                        // User did not allow notifications
                        setState(() {
                          notificationsEnabled = false;
                          permissionAsked = false;
                        });
                      }
                    } else {
                      // If user toggled it off, just remain off
                      setState(() {
                        notificationsEnabled = false;
                        permissionAsked = false;
                      });
                    }
                  },
                ),
                const SizedBox(height: 40),

                // If user has permissionAsked & notificationsEnabled show "Continue", else show "Skip"
                if (permissionAsked && notificationsEnabled)
                  ElevatedButton(
                    onPressed: () {
                      // Go to next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NextScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7261C6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  )
                else
                  TextButton(
                    onPressed: () {
                      // Skip leads to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NextScreen()),
                      );
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
