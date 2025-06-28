import 'package:flutter/material.dart';

class terms_conditions extends StatelessWidget {
  const terms_conditions({super.key});

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
            const Text(
              'TERMS & CONDITIONS',
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
                  SectionTitle(title: 'AGREEMENT TO TERMS:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Agreement between you and Fitness Finesse Fusion ("Company") for using https://fitnessfinessefusion.com and related media.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'By using the App, you agree to all Terms of Use; if not, stop using immediately.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Supplemental terms may be added and are part of these Terms.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Company can modify Terms anytime; continued use means acceptance of changes.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'It’s your responsibility to review Terms periodically.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'App content not intended for jurisdictions where use would violate laws.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Users accessing from such locations do so at their own risk and responsibility.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'App is for users aged 13+.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Minors (under 18) need parental permission and supervision to use the App.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Parents/guardians must agree to Terms before minors use the App.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'INTELLECTUAL PROPERTY RIGHTS:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'All App content (code, text, images, media, etc.) and trademarks are owned or licensed by us.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Protected by U.S. and international copyright, trademark, and IP laws.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Content is provided “AS IS” for personal, informational use only.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You may not copy, distribute, or use any part of the App for commercial purposes without written permission.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You’re granted a limited license to use and download content only for personal, non-commercial use.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'All rights not explicitly granted to you are reserved by the company.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'PRIVACY POLICY:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'We care about your data privacy and security.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'By using the App, you agree to our Privacy Policy (incorporated into these Terms of Use).',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'The App is hosted in the United States.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'If you access the App from another country, you:',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Transfer your data to the U.S., and',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Consent to it being processed under U.S. laws.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We do not knowingly collect or market to children under 13.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'If we learn that a child under 13 submitted personal data without verified parental consent,',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'In compliance with COPPA (Children’s Online Privacy Protection Act):',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'TERM AND TERMINATION :'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'These Terms remain in effect while you use the App.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We reserve the right to deny access or block users/IPs at our sole discretion, without notice or liability.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Grounds for denial may include:',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Breach of these Terms,',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Violation of Applicable laws/regulations, or',
                  ),
                  AboutItem(icon: Icons.arrow_right, text: 'No reason at all.'),
                  AboutItem(icon: Icons.arrow_right, text: 'Civil remedies,'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Criminal prosecution,',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Injunctive relief.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'MODIFICATIONS AND INTERRUPTIONS '),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We may change, modify, or remove App content at any time, for any reason, without notice.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'We are not obligated to update any App information.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We may modify, suspend, or discontinue all or part of the App at any time, without notice.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We are not liable for any changes, price adjustments, suspensions, or discontinuation.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'App availability is not guaranteed at all times.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'These Terms do not obligate us to maintain, update, or support the App.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'CONTRIBUTION LICENSE:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'By posting, you grant us a worldwide, royalty-free license to use, share, and modify your contributions in any media.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'This includes the right to use your name, company/franchise name, logos, and personal/commercial images.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You waive all moral rights and confirm you have rights to the content you post.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You retain full ownership of your contributions and related intellectual property.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'We are not responsible for your posted content.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You agree not to take legal action against us regarding your contributions.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We may edit, move, or delete any content at our discretion.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'We are not required to monitor your contributions.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'GUIDELINES FOR REVIEWS:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Reviews must reflect firsthand experience.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'No profanity, abusive, racist, or hate language.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'No discriminatory content based on religion, race, gender, etc.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'No references to illegal activity.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'No false or misleading statements.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'No conflicts of interest (e.g., competitors posting negative reviews).',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'No campaigns to influence reviews.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We may accept, reject, or remove reviews at our discretion.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Reviews do not reflect our views and we are not liable for them.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'By posting a review, you grant us a license to use and distribute it.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'SUBMISSIONS:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Submissions (feedback, ideas, etc.) you provide are non-confidential.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We own all rights to these Submissions, including intellectual property.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You confirm the Submissions are original or that you have the right to share them.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'No claims can be made against us for use or ownership of your Submissions.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'App MANAGEMENT:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We may monitor the App for any Terms of Use violations.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We may take legal action, including reporting users to law enforcement.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We can restrict or disable access to any user content at our discretion.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We may remove large or system-burdening files without notice.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'No false or misleading statements.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We manage the App to protect our rights and ensure proper functionality.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'GOVERNING LAW:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'These Terms and your use of the App are governed by the laws of the Commonwealth of Pennsylvania.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Applicable laws are those for agreements made and performed entirely within Pennsylvania.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Conflict of law principles are not Applied',
                  ),
                  SectionTitle(title: 'USER GENERATED CONTRIBUTIONS:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'When posting content ("Contributions") on the App (e.g., text, images, videos, suggestions):',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'You represent and warrant that:',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Your content does not infringe on any third-party rights (copyright, trademark, patent, etc.).',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You own or have permission to post and let others use your content.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Your content is not false, inaccurate, or misleading.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Your content does not mock, intimidate, or abuse others.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Your content is not false, inaccurate, or misleading.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Your content does not mock, intimidate, or abuse others.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Your content does not include offensive comments related to race, gender, sexuality, or disability.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Your content does not violate these Terms of Use or link to anything that does.',
                  ),
                  SectionTitle(title: 'PROHIBITED ACTIVITES :'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Collect or compile data from the App without written permission.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Trick, defraud, or mislead us or other users (especially to obtain sensitive info).',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Interfere with the App’s security features.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Disparage, tarnish, or harm us or the App.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Use information from the App to harass, abuse, or harm others.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Misuse support services or submit false reports.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Violate laws or regulations through your use of the App.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Use the App to promote or sell unauthorized goods or services.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Engage in unauthorized framing or linking.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Use the App to compete with us or for unauthorized commercial gain.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'USER REGISTRATION:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'You may need to register to use the App.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'You must keep your password confidential.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You are responsible for all activity under your account.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We may remove, reclaim, or change your username if we find it inAppropriate, obscene, or otherwise objectionable.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'USER REPRESENTATIONS '),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        '  You provide true, accurate, current, and complete registration information.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You will keep your registration information updated.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You have legal capacity and agree to these Terms of Use.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'You are at least 13 years old.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You are not a minor in your jurisdiction, or have parental permission if you are.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Your use of the App will comply with all Applicable laws and regulations.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'DISPUTE RESOLUTION:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'All disputes related to the contract (existence, validity, termination) shall be resolved by:International Commercial Arbitration Court (ICAC) under the European Arbitration Chamber, Belgium (Brussels, Avenue Louise 146).',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Applicable Rules: ICAC Rules (considered part of this clause).',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Number of Arbitrators: _',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Seat of Arbitration: _',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Language of Proceedings: _',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Governing Law: Substantive law of _',
                  ),
                  SectionTitle(title: 'RESTRICTIONS:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        ' Arbitration is limited only to the Dispute between the Parties individually.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'To the fullest extent permitted by law:',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'No joint arbitration with any other proceeding.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'No class-action arbitration or use of class-action procedures.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'No representative claims on behalf of the public or others.',
                  ),
                  SectionTitle(title: 'EXCEPTIONS TO  ARBITRATION:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Disputes about enforcing/protecting intellectual property rights.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Disputes involving theft, piracy, invasion of privacy, or unauthorized use.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Claims for injunctive relief.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Affected Disputes will not be arbitrated.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Such Disputes will be decided by a court of competent jurisdiction as previously agreed.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Both Parties agree to submit to that court’s personal jurisdiction.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'CORRECTIONS:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Typographical errors',
                  ),
                  AboutItem(icon: Icons.arrow_right, text: 'Inaccuracies'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Omissions (e.g., descriptions, pricing, availability)',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Correct errors, inaccuracies, or omissions',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Change or update App information at any time',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Do so without prior notice',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'LIMITATIONS OF LIABILITY '),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'We and our directors, employees, or agents will not be liable to you or any third party for:',
                  ),
                  AboutItem(icon: Icons.arrow_right, text: 'Direct damages'),
                  AboutItem(icon: Icons.arrow_right, text: 'Indirect damages'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Consequential damages',
                  ),
                  AboutItem(icon: Icons.arrow_right, text: 'Exemplary damages'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Incidental damages',
                  ),
                  AboutItem(icon: Icons.arrow_right, text: 'Special damages'),
                  AboutItem(icon: Icons.arrow_right, text: 'Punitive damages'),
                  AboutItem(icon: Icons.arrow_right, text: 'Lost profit'),
                  AboutItem(icon: Icons.arrow_right, text: 'Lost revenue'),
                  AboutItem(icon: Icons.arrow_right, text: 'Loss of data'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Even if we have been advised of the possibility of such damages, we will not be held liable.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'INDEMNIFICATION:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You agree to defend, indemnify, and hold us harmless (including our subsidiaries, affiliates, officers, agents, partners, and employees) from any third-party claims resulting from:',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Your Contributions',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Your use of the App',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Your breach of these Terms of Use',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Any false representations or warranties made by you',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Violation of a third party’s rights (e.g., intellectual property)',
                  ),
                  SectionTitle(title: 'USER DATA:'),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        ' We may store certain data you transmit for performance and usage tracking of the App.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Regular routine backups are performed.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You are solely responsible for your own transmitted data and activities on the App.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'We are not liable for any data loss or corruption.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You waive any right to take action against us for such loss or corruption.',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(
                    title:
                        'ELECTRONIC COMMUNICATIONS, TRANSACTIONS, AND SIGNATURES:',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Using the App, emailing us, or filling online forms = electronic communication.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You consent to receive communications electronically (via email or on-App).',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You agree to electronic signatures, contracts, orders, notices, and records.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'You waive rights requiring original (paper) signatures or non-digital records.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'California Users and Residents📍If your complaint isn’t resolved, contact:',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Address: 1625 North Market Blvd., Suite N 112, Sacramento, CA 95834',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Phone: (800) 952-5210 or (916) 445-1254',
                  ),
                  SizedBox(height: 12),
                  SectionTitle(title: 'DISCLAIMER '),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'The App is provided “as-is” and “as-available.”',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'You use the App and our services at your own risk.',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'To the fullest extent allowed by law, we disclaim all warranties, express or implied, including:',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Merchantability,Fitness for a particular purpose,Non-infringement',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Errors, mistakes, or inaccuracies in content/materials',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Personal injury or property damage from App use',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Unauthorized access to personal/financial information',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Interruptions in App transmission',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text: 'Content errors/omissions or any related loss/damage',
                  ),
                  AboutItem(
                    icon: Icons.arrow_right,
                    text:
                        'Use your best judgment and caution when purchasing products/services online or offline.',
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
