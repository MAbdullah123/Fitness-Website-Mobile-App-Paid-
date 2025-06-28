import 'package:flutter/material.dart';
import 'package:flutter_application_gym/privacy_policy.dart';
import 'package:flutter_application_gym/terms_conditons.dart';

class about_us extends StatelessWidget {
  const about_us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'terms') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const terms_conditions()),
                );
              } else if (value == 'privacy') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const privacy_policy()),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'terms',
                child: Text('Terms & Conditions'),
              ),
              const PopupMenuItem(
                value: 'privacy',
                child: Text('Privacy & Policy'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            const Text(
              'WHO WE ARE',
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
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  AboutItem(
                    icon: Icons.check_circle,
                    text: 'Affordable and high-quality fitness products.',
                  ),
                  AboutItem(
                    icon: Icons.local_shipping,
                    text: 'Fast and efficient shipping.',
                  ),
                  AboutItem(
                    icon: Icons.fitness_center,
                    text: 'Helping you achieve your fitness goals.',
                  ),
                  AboutItem(
                    icon: Icons.lightbulb,
                    text: 'Innovative fitness technology.',
                  ),
                  AboutItem(
                    icon: Icons.support_agent,
                    text: 'Reliable customer support team.',
                  ),
                  AboutItem(
                    icon: Icons.thumb_up,
                    text: 'Customer satisfaction is our top priority.',
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
