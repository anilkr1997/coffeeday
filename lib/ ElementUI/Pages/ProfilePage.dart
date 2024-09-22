import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.brown,
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Anil Kumar Maurya',style: TextStyle(color: Colors.white),),
              background: Image.network(
                'https://img.freepik.com/premium-photo/coffee-cup-with-red-straw-straw-middle_1304829-5192.jpg',
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Add edit profile functionality
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildInfoCard(
                    icon: Icons.person,
                    title: 'About Me',
                    content: 'Software developer passionate about creating innovative solutions.',
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    icon: Icons.work,
                    title: 'Work',
                    content: 'Senior Developer at Tech Innovations Inc.',
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    icon: Icons.location_on,
                    title: 'Location',
                    content: 'San Francisco, CA',
                  ),
                  const SizedBox(height: 16),
                  _buildSocialLinks(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String title, required String content}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 24, color: Colors.brown),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    final skills = ['Flutter', 'Dart', 'React', 'JavaScript', 'Python'];
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Skills',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills.map((skill) => Chip(
                label: Text(skill),
                backgroundColor: Colors.blue.withOpacity(0.1),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Connect',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSocialIcon(Icons.link, 'Website'),
                _buildSocialIcon(FontAwesomeIcons.linkedinIn, 'LinkedIn'),
                _buildSocialIcon(FontAwesomeIcons.github, 'GitHub'),
                _buildSocialIcon(FontAwesomeIcons.instagram, 'Instagram'),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String label) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 30),
          onPressed: () {
            // Add functionality to open respective social links
          },
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
