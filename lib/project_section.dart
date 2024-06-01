import 'package:flutter/material.dart';
import 'package:port_fol/experience_section.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: FadeInProjectCard(
                    title: 'PS Relief Hub',
                    description:
                        "PS Relief Hub is a volunteering event app built in Flutter aimed at facilitating users to find and participate in volunteering events near their location. Users can utilize various filters such as sort, availability, cause, and location to discover events matching their interests. Additionally, the app features a bookmarking functionality enabling users to save preferred events for future reference.\n\nReponsibilities: Designed and implemented the user interface for engaging experience. Integrated APIs to fetch and display event data, implemented filtering options allowing users to search results based on various criteria. Integrated Push Notification services like OneSignal to notify users about events."),
              ),
              Expanded(
                child: FadeInProjectCard(
                    title: 'Travel and Deals app',
                    description:
                        "The Travel and Deals app is designed for users to explore and book various travel-related services such as car rentals, theme parks, and flights. The app offers a comprehensive deals section where users can browse through a curated list of brand deals and apply filters based on distance, location, and offer type. Additionally, users have the ability to add deals to their wishlist for future reference.\n\nResponsiilites: Developed user-friendly interfaces for navigation and interaction, Integrated APIs to retrieve nd display travel-related services and deals, Implemented localization support in preferred languages, Utilized Hive for local storage to store user preferences, bookmarks. and Created APIs for profile information and updates."),
              ),
              Expanded(
                child: FadeInProjectCard(
                    title: 'Task Creation',
                    description:
                        "Developed a .NET Web API for a task management system, allowing logged-in users to perform CRUD operations on tasks. Implemented authentication and authorization, integrated OneSignal for task notifications, used MailKit for sending feedback emails to the admin, and provided file uploading and downloading capabilities with IFormFile.Technologies used includes .NET Core, Entity Framework, JWT Authentication, PostgreSQL, OneSignal, and MailKit.\n\nUtilized PostgreSQL as the database management system for efficient data storage and retrieval.Integrated OneSignal for push notifications, enabling real-time updates and alerts for users. Leveraged MailKit for sending feedback emails to the admin,"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FadeInProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String? imageUrl;

  const FadeInProjectCard({
    super.key,
    required this.title,
    required this.description,
    this.imageUrl,
  });

  @override
  _FadeInProjectCardState createState() => _FadeInProjectCardState();
}

class _FadeInProjectCardState extends State<FadeInProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: CustomPaint(
          painter: BorderPainter(),
          child: Card(
            color: Colors.transparent,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 15,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
