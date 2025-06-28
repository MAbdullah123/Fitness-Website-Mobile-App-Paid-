import 'package:flutter/material.dart';

class privacy_policy extends StatelessWidget {
  const privacy_policy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.cancel, color: Colors.black, size: 28),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'PRIVACY & POLICY',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 12),
                  SectionTitle(
                    title:
                        'What Personal Data We Collect And Why We Collect it ',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We collect data from the comments form, visitor’s IP address, and browser user agent for spam detection.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'An anonymized hash of your email may be shared with Gravatar to check if you are using it.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Gravatar’s privacy policy: https://automattic.com/privacy/',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Once approved, your profile picture is visible with your comment.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'Media'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Avoid uploading images with embedded location data (EXIF GPS).',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Website visitors can download and extract this location data from images.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'Cookies:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Commenting: You can choose to save your name, email, and website in cookies.These cookies last 1 year for your convenience.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Login Page: A temporary cookie checks if your browser accepts cookies.It contains no personal data and is deleted when you close your browser.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Logging In: Sets cookies for login and screen display preferences.Login cookies: 2 days (or 2 weeks if "Remember Me" is selected).Display cookies: 1 year.Cookies are removed when you log out.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Editing/Publishing Articles: A cookie stores the post ID of the article edited.It contains no personal data and expires in 1 day.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'Embedded Content From Other Apps '),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Articles may include embedded content (videos, images, articles, etc.).',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Embedded content acts as if you visited the original website.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'These sites may: Collect your data.Use cookies.Add third-party tracking.Monitor your interactions (especially if you are logged in)',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(
                    title:
                        'Who We Share Your Data With How Long We Retain Your Data',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Comments and their metadata are stored indefinitely to allow automatic approval of follow-up comments.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Registered users personal information is saved in their profile.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'What rights you have over your data'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Request a file of your personal data we have collected (if you have an account or have left comments).',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Request deletion of your personal data.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Note: Some data may be retained for administrative, legal, or security reasons.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'Where We Send Your Data'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Visitor comments may be checked through an automated spam detection service.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'Where We Send Your Data'),
                  SizedBox(height: 12),
                  SectionTitle(title: 'Your Contact Information'),
                  SizedBox(height: 12),
                  SectionTitle(title: 'Additional Information'),
                  SizedBox(height: 12),
                  SectionTitle(title: 'How We Protect Your Data'),
                  SizedBox(height: 12),
                  SectionTitle(
                    title: 'What Data Breach Procedures We Have In Place',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(
                    title: 'What Third Parties We Receive Data From',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(
                    title:
                        'What Automated Decision Making And/Or Profiling We Do With User Data',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(
                    title: 'Industry Regulatory Disclosure Requirements',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const AboutItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black87, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
