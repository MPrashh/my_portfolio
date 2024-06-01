import 'package:flutter/material.dart';
import 'package:port_fol/appbar_section.dart';
import 'package:port_fol/contacts_view.dart';
import 'package:port_fol/education_card.dart';
import 'package:port_fol/experience_section.dart';
import 'package:port_fol/header_section.dart';
import 'package:port_fol/project_section.dart';
import 'package:port_fol/skills_section.dart';

void main() {
  runApp(
    const PortfolioApp(),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prashant Mane',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          fontFamily: 'Montserrat',
        ),
        home: const Center(
          child: PortfolioHomePage(),
        ),
      ),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  late Future<void> _imageLoader;

  @override
  void initState() {
    super.initState();
    _imageLoader = _loadImage();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // Show dialog after the first frame is built
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       backgroundColor: Colors.grey.shade600,
    //       title: const Text('Welcome'),
    //       content: const Text('Thank you for visiting!'),
    //       actions: <Widget>[
    //         TextButton(
    //           onPressed: () => Navigator.of(context).pop(),
    //           child: const Text('Close'),
    //         ),
    //       ],
    //     ),
    //   );
    // });
  }

  Future<void> _loadImage() async {
    await precacheImage(
        const AssetImage('assets/images/bg_image2.jpg'), context);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: FutureBuilder<void>(
            future: _imageLoader,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg_image2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBarSection(),
                        HeaderSection(),
                        SkillsSection(),
                        EducationSection(),
                        ExperienceSection(),
                        ProjectsSection(),
                        ContactSection(),
                      ],
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      
    );
  }
}
