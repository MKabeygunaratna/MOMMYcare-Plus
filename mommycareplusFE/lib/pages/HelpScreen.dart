import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Center"),
        backgroundColor: Color(0xFF8474CB),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Help Center Heading
            Text(
              "How can we help you?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // FAQ Section
            Text(
              "Frequently Asked Questions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            FAQItem(
                question: "How do I reset my password?",
                answer:
                "Go to Settings > Profile > Change Password. Follow the steps to reset your password."),
            FAQItem(
                question: "How can I contact support?",
                answer:
                "You can reach out via email at support@mommycareplus.com or through the live chat option."),
            FAQItem(
                question: "Is MOMMYcare+ free to use?",
                answer:
                "Yes, the basic version is free. However, there are premium features available with a subscription."),
            FAQItem(
                question: "How do I track my baby's growth?",
                answer:
                "Use the 'Baby Health' section to log weight, vaccinations, and milestones."),
            FAQItem(
                question: "How does the postpartum depression test work?",
                answer:
                "Our test uses the Edinburgh Postnatal Depression Scale (EPDS) to assess symptoms and provide recommendations."),

            SizedBox(height: 20),

            // Contact Support Section
            Text(
              "Contact Support",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            ContactOption(
              icon: FontAwesomeIcons.envelope,
              text: "Email Support",
              subtext: "support@mommycareplus.com",
              onTap: () {},
            ),
            ContactOption(
              icon: FontAwesomeIcons.phone,
              text: "Call Support",
              subtext: "+94 112 345 678",
              onTap: () {},
            ),
            ContactOption(
              icon: FontAwesomeIcons.commentDots,
              text: "Live Chat",
              subtext: "Chat with us in the app",
              onTap: () {},
            ),

            SizedBox(height: 20),

            // Troubleshooting Section
            Text(
              "Troubleshooting",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            ListTile(
              leading: Icon(FontAwesomeIcons.bug, color: Colors.redAccent),
              title: Text("App not working?"),
              subtitle: Text("Try updating the app or clearing cache."),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.lock, color: Colors.blueAccent),
              title: Text("Privacy & Security"),
              subtitle: Text("Learn about our security measures."),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.gear, color: Colors.green),
              title: Text("General Settings"),
              subtitle: Text("Manage app preferences and notifications."),
              onTap: () {},
            ),

            SizedBox(height: 30),
            Center(
              child: Text(
                "MOMMYcare+ – Always Here to Help!",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF8474CB)),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// Custom Widget for FAQ Items
class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(widget.question, style: TextStyle(fontWeight: FontWeight.bold)),
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(widget.answer, style: TextStyle(fontSize: 16)),
          )
        ],
      ),
    );
  }
}

// Custom Widget for Contact Options
class ContactOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final String subtext;
  final VoidCallback onTap;

  ContactOption({required this.icon, required this.text, required this.subtext, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF8474CB)),
      title: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Text(subtext, style: TextStyle(fontSize: 14, color: Colors.black54)),
      onTap: onTap,
    );
  }
}
