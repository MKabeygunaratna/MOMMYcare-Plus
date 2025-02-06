import 'package:flutter/material.dart';
import 'Languages.dart';
import 'ProfileScreen.dart';
import 'package:provider/provider.dart';
import 'ThemeProvider.dart';
import 'AboutScreen.dart';
import 'HelpScreen.dart';
import 'PrivacyScreen.dart';
import 'DescriptionScreen.dart';



class SettingsScreen extends StatefulWidget {
  final String guardianName;
  final String guardianEmail;
  final String guardianContact;

  const SettingsScreen({
    Key? key,
    required this.guardianName,
    required this.guardianEmail,
    required this.guardianContact,
  }) : super(key: key);


  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedTheme = "System default"; // Default theme

  void _showThemePopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: const Color(0xFFD3CBFD),
      builder: (context) {
        return Padding(

          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Themes",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
              const Divider(color: Color(0xFF7261C6)),
              const SizedBox(height: 15),
              _buildThemeOption("System default"),
              _buildThemeOption("Dark"),
              _buildThemeOption("Light"),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }



  Widget _buildThemeOption(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: const TextStyle(fontSize: 16)),
        Switch(
          value: selectedTheme == text, // Highlight the selected theme
          onChanged: (value) {
            setState(() {
              selectedTheme = text;
            });
            final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
            if (text == "Dark") {
              themeProvider.setTheme(ThemeMode.dark);
            } else if (text == "Light") {
              themeProvider.setTheme(ThemeMode.light);
            } else {
              themeProvider.setTheme(ThemeMode.system);
            }

            Navigator.pop(context); // Close the popup after selection
          },
        ),
      ],
    );
  }
  void _showSupportPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: const Color(0xFFD3CBFD),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Support",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
              const Divider(color: Color(0xFF7261C6)),
              const SizedBox(height: 15),
              _buildSupportOption(context,"About MOMMYCare+", Icons.info,AboutScreen()),
              _buildSupportOption(context,"Help Center",Icons.help_outline,HelpScreen()),
              _buildSupportOption(context,"Privacy Policy",Icons.privacy_tip,PrivacyScreen()),
              _buildSupportOption(context,"Terms of Use",Icons.description,DescriptionScreen()),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
  Widget _buildSupportOption(BuildContext context, String title, IconData icon, Widget screen) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: () {
        Navigator.pop(context); // Close the popup first
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      },
    );
  }

  void _showNotificationPopup(BuildContext context) {
    bool newMessages = true; // Default value
    bool updates = false;
    bool reminders = true;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: const Color(0xFFD3CBFD),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Notification Settings",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xFF7261C6)),
                  const SizedBox(height: 15),
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
                  const SizedBox(height: 10),
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
        Text(title, style: const TextStyle(fontSize: 16)),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Settings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 16),
              children: [
                const SizedBox(height: 30),
                _buildSettingsOption(context, "Profile", Icons.person, ProfileScreen(
                  guardianName: widget.guardianName,
                  guardianEmail: widget.guardianEmail,
                  guardianContact: widget.guardianContact,
                )),
                const SizedBox(height: 15),
                _buildSettingsOption(context, "Languages", Icons.translate, LanguageScreen()),
                const SizedBox(height: 15),
                _buildSettingsOption(context, "Notification", Icons.notifications,null, isNotification:true),
                const SizedBox(height: 15),
                _buildSettingsOption(context, "Themes", Icons.brightness_6, null, isTheme: true),
                const SizedBox(height: 15),
                _buildSettingsOption(context, "Support", Icons.help, null,isSupport: true),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 170),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7261C6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                minimumSize: const Size(200, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen(
                    guardianName: widget.guardianName,
                    guardianEmail: widget.guardianEmail,
                    guardianContact: widget.guardianContact,
                  )),
                );
              },
              child: const Text("Sign Out", style: TextStyle(fontSize: 18, color: Colors.white)),
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
          border: Border.all(color: const Color(0xFF7261C6)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title, style: const TextStyle(fontSize: 18)),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
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

