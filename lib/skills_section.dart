import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                AnimatedSkillChip(
                  skill: 'Flutter',
                  define:
                      "Flutter is a UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.",
                ),
                AnimatedSkillChip(
                  skill: 'Dart',
                  define:
                      "Dart is a client-optimized programming language for apps on multiple platforms.",
                ),
                AnimatedSkillChip(
                  skill: 'Mobile Application Development',
                  define:
                      "Designing, coding, and deploying software applications for portable devices.",
                ),
                AnimatedSkillChip(
                  skill: 'Riverpod',
                  define:
                      "A state management solution for Flutter apps with simplicity.",
                ),
                AnimatedSkillChip(
                  skill: 'Clean Architecture',
                  define:
                      "Separation of concerns; modular layers for maintainable, testable, and scalable software.",
                ),
                AnimatedSkillChip(
                  skill: 'FlutterFlow',
                  define:
                      "Low-code platform for building mobile apps with Flutter, visually and easily.",
                ),
                AnimatedSkillChip(
                  skill: 'C#',
                  define:
                      "Modern, object-oriented language for developing diverse applications on the .NET platform.",
                ),
                AnimatedSkillChip(
                  skill: 'ASP.NET Core Web API',
                  define:
                      "Framework for building scalable, high-performance RESTful APIs with .NET Core.",
                ),
                AnimatedSkillChip(
                  skill: 'Entity Framework',
                  define:
                      ".NET ORM framework for database interactions using strongly-typed LINQ queries.",
                ),
                AnimatedSkillChip(
                  skill: 'REST APIs',
                  define:
                      "Web services using HTTP methods for CRUD operations on resources.",
                ),
                AnimatedSkillChip(
                  skill: 'Visual Studio',
                  define:
                      "Comprehensive IDE for developing applications across various platforms and languages.",
                ),
                AnimatedSkillChip(
                  skill: 'Git',
                  define:
                      "Distributed version control system for tracking changes in code collaboratively.",
                ),
                AnimatedSkillChip(
                  skill: 'PostgreSQL',
                  define:
                      "Robust open-source RDBMS supporting SQL standards, known for reliability.",
                ),
                AnimatedSkillChip(
                  skill: 'Postman',
                  define:
                      "API development environment simplifying testing, collaboration, and automation workflows seamlessly.",
                ),
                AnimatedSkillChip(
                  skill: 'UI/UX',
                  define:
                      "Designing user interfaces for optimal experiences and usability principles.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedSkillChip extends StatelessWidget {
  final String skill;
  final String define;

  const AnimatedSkillChip(
      {super.key, required this.skill, required this.define});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Chip(
        label: Text(
          skill,
          style: const TextStyle(color: Colors.black),
        ),
        avatar: const Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
      ),
      onTap: () {
        showToast(context, define);
      },
    );
  }

  void showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: SizedBox(
          width: 250,
          child: Text(
            '$skill: $message',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.white,
          onPressed: scaffold.hideCurrentSnackBar,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.transparent),
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
