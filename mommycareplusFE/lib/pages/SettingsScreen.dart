import 'package:flutter/material.dart';
import 'ProfileScreen.dart';
import 'package:provider/provider.dart';
import 'ThemeProvider.dart';
import 'AboutScreen.dart';
import 'HelpScreen.dart';
import 'PrivacyScreen.dart';
import 'TermsOfUseScreen.dart';


class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedTheme = "System default"; // Default theme

  void _showThemePopup(BuildContext context) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Color(0xFFD3CBFD),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(size.width * 0.04),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * 0.01),
                      child: Text(
                        "Themes",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
              Divider(color: Color(0xFF7261C6)),
              SizedBox(height: size.height * 0.02),
              _buildThemeOption("System default"),
              _buildThemeOption("Dark"),
              _buildThemeOption("Light"),
              SizedBox(height: size.height * 0.015),
            ],
          ),
        );
      },
    );
  }

  Widget _buildThemeOption(String text) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return SwitchListTile(
          title: Text(text, style: TextStyle(fontSize: 16)),
          value: selectedTheme == text, // Highlight the selected theme
          onChanged: (value) {
            if (value) {
              setState(() {
                selectedTheme = text;
              });

              if (text == "Dark") {
                themeProvider.setTheme(ThemeMode.dark);
              } else if (text == "Light") {
                themeProvider.setTheme(ThemeMode.light);
              } else {
                themeProvider.setTheme(ThemeMode.system);
              }
              Navigator.pop(context);
            }
          },
        );
      },
    );
  }





  void _showSupportPopup(BuildContext context) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Color(0xFFD3CBFD),
      builder: (context) {
        return Padding(
          padding:  EdgeInsets.all(size.width * 0.04),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Support",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
              Divider(color: Color(0xFF7261C6)),
              SizedBox(height: size.height * 0.02),
              _buildSupportOption(context,"About MOMMYCare+", Icons.info,AboutScreen()),
              _buildSupportOption(context,"Help Center",Icons.help_outline,HelpCenterScreen()),
              _buildSupportOption(context,"Privacy Policy",Icons.privacy_tip,PrivacyPolicyScreen()),
              _buildSupportOption(context,"Terms of Use",Icons.description,TermsOfUseScreen()),
              SizedBox(height: size.height * 0.015),
            ],
          ),
        );
      },
    );
  }
  Widget _buildSupportOption(BuildContext context, String title, IconData icon, Widget screen) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: () {
        Navigator.pop(context); // Close the popup first
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      },
    );
  }

  void _showNotificationPopup(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool newMessages = true; // Default value
    bool updates = false;
    bool reminders = true;

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Color(0xFFD3CBFD),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.all(size.width * 0.04),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01),
                          child: Text(
                            "Notification Settings",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Color(0xFF7261C6)),
                  SizedBox(height: size.height * 0.02),
                  _buildNotificationOption("New Messages", newMessages, (value) {
                    setState(() {
                      newMessages = value;
                    });
                  }),
                  _buildNotificationOption("App Updates", updates, (value) {
                    setState(() {
                      updates = value;
                    });
                  }),
                  _buildNotificationOption("Reminders", reminders, (value) {
                    setState(() {
                      reminders = value;
                    });
                  }),
                  SizedBox(height: size.height * 0.015),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildNotificationOption(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 16)),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }







  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profilescreen()),
          ),
        ),
        title: Text("Settings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(bottom: screenHeight * 0.02),
              children: [
                SizedBox(height: screenHeight * 0.05),
                _buildSettingsOption(context, "Profile", Icons.person,Profilescreen()),
                SizedBox(height: screenHeight * 0.025),
                _buildSettingsOption(context, "Notification", Icons.notifications,null, isNotification:true),
                SizedBox(height: screenHeight * 0.025),
                _buildSettingsOption(context, "Themes", Icons.brightness_6, null, isTheme: true),
                SizedBox(height: screenHeight * 0.025),
                _buildSettingsOption(context, "Support", Icons.help, null,isSupport: true),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15, vertical: screenHeight * 0.1),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7261C6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                minimumSize: Size(screenWidth * 0.5, screenHeight * 0.06),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profilescreen()),
                );
              },
              child: Text("Sign Out", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsOption(BuildContext context, String title, IconData icon, Widget? screen, {bool isTheme = false,bool isSupport = false, bool isNotification = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF7261C6)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title, style: TextStyle(fontSize: 18)),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
          onTap: () {
            if (isTheme) {
              _showThemePopup(context);
            }
            else if(isSupport){
              _showSupportPopup(context);
            }
            else if (isNotification) {
              _showNotificationPopup(context);  // Show notification popup
            }
            else if (screen != null) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
            }
          },
        ),
      ),
    );
  }
}
