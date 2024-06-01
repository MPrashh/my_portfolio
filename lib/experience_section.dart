import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 22,
              fontWeight: FontWeight.bold,
               letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 10),
          ExperienceCard(
            companyName: 'Tezo (formerly Technovert)',
            companyurl: 'https://tezo.com/',
            location: "Hyderabad, Telangana, India",
            role: "Software Developer",
            date: "Apr 2023 - Present",
            description:
                "~ Utilized Riverpod provider for state management in various projects. Implemented new features and functionalities based on project requirements.\n~ Leveraged local storage using Hive for efficient data management.\n~ Incorporated localization features to support multiple languages and improve user accessibility. Implemented a deep link app router to provide seamless navigation within the application.\n~ Collaborated with team members to brainstorm ideas and solutions for project challenges. Implemented the application UI and developed reusable custom widgets to speed up application development.\n~ Built and maintained high-performance, reusable and reliable code that will be extensively documented for future use and upgrades.\n~ Implemented backend services and APIs using C# and .NET frameworks.\n~ Created Web APIs and utilized modern authorization mechanisms, such as JSON Web Tokens, with the .NET Framework to facilitate communication between the mobile application and backend service\n~ Experienced in database design and development using SQL and PostgreSQL databases.",
          ),
          SizedBox(height: 20),
          ExperienceCard(
            companyName: 'Publicis Sapient',
            companyurl: 'https://www.publicissapient.com/',
            location: "Bengaluru, Karnataka, India",
            role: "Developer Mobile Solutions L1",
            date: "Nov 2021 - Apr 2023",
            description:
                "~ Contributed to the development of a volunteering event app, allowing users to search and attend events based on their interests and location.\n~ Demonstrated a strong understanding of the Flutter framework, including widgets, architecture, and libraries.\n~ Familiarity with Restful APIs (GET, POST, PUT, DELETE), UI, integration of network manager over services and core packages on express framework.\n~ Developed Mobile applications for both android and iOS devices, with good understanding of SDLC, state management and clean architecture.\n~ Proficient in code versioning tools such as Git and IDEs like Android Studio, VS Code.",
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String companyName;
  final String companyurl;
  final String location;
  final String role;
  final String date;
  final String description;

  const ExperienceCard({
    super.key,
    required this.companyName,
    required this.companyurl,
    required this.location,
    required this.role,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CustomPaint(
        painter: BorderPainter(),
        child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Text(
                    companyName,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 247, 150, 163),
                        letterSpacing: 1.4),
                  ),
                  onTap: () {
                    launchCompanyInURL(companyurl);
                  },
                ),
                const SizedBox(height: 4),
                Text(location,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    )),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 25,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void launchCompanyInURL(String companyUrl) async {
  var url = companyUrl;
  if (await canLaunch(url)) {
    await launch(
      url,
      forceWebView: true,
    );
  } else {
    throw 'Could not launch $url';
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white24
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(15));

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


// class ExperienceSection extends StatelessWidget {
//   const ExperienceSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Experience',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 10),
//           Row(
//             children: [
//               Expanded(
//                 child: ExperienceCard(
//                   companyName: 'Tezo (formerly Technovert)',
//                   companyurl: 'https://tezo.com/',
//                   location: "Hyderabad, Telangana, india",
//                   role: "Software Developer",
//                   date: "Apr 2023 - Present",
//                   description:
//                       "~ Utilized Riverpod provider for state management in various projects. Implemented new features and functionalities based on project requirements.\n~ Leveraged local storage using Hive for efficient data management.\n~ Incorporated localization features to support multiple languages and improve user accessibility. Implemented a deep link app router to provide seamless navigation within the application.\n~ Collaborated with team members to brainstorm ideas and solutions for project challenges. Implemented the application UI and developed reusable custom widgets to speed up application development.\n~ Built and maintained high-performance, reusable and reliable code that will be extensively documented for future use and upgrades.\n~ Implemented backend services and APIs using C# and .NET frameworks.\n~ Created Web APIs and utilized modern authorization mechanisms, such as JSON Web Tokens, with the .NET Framework to facilitate communication between the mobile application and backend service\n~ Experienced in database design and development using SQL and PostgreSQL databases.",
//                 ),
//               ),
//               SizedBox(
//                 width: 125,
//               ),
//             ],
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               SizedBox(
//                 width: 125,
//               ),
//               Expanded(
//                 child: ExperienceCard(
//                     companyName: 'Publicis Sapient',
//                     companyurl: 'https://www.publicissapient.com/',
//                     location: "Bengaluru, Karnataka, india",
//                     role: "Developer Mobile Solutions L1",
//                     date: "Nov 2021 - Apr 2023",
//                     description:
//                         "~ Contributed to the development of a volunteering event app, allowing users to search and attend events based on their interests and location.\n~ Demonstrated a strong understanding of the Flutter framework, including widgets, architecture, and libraries.\n~ Familiarity with Restful APIs (GET, POST, PUT, DELETE), UI, integration of network manager over services and core packages on express framework.\n~ Developed Mobile applications for both android and iOS devices, with good understanding of SDLC, state management and clean architecture.\n~ Proficient in code versioning tools such as Git and IDEs like Android Studio, VS Code."),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ExperienceCard extends StatefulWidget {
//   final String companyName;
//   final String companyurl;
//   final String location;
//   final String role;
//   final String date;
//   final String description;
//   const ExperienceCard(
//       {super.key,
//       required this.companyName,
//       required this.companyurl,
//       required this.location,
//       required this.role,
//       required this.date,
//       required this.description});

//   @override
//   State<ExperienceCard> createState() => _ExperienceCardState();
// }

// class _ExperienceCardState extends State<ExperienceCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 4),
//       vsync: this,
//     )..repeat();
//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: AnimatedBuilder(
//         animation: _animation,
//         builder: (context, child) {
//           return CustomPaint(
//             painter: BorderPainter(_animation.value, Colors.red),
//             child: child,
//           );
//         },
//         child: Card(
//           color: Colors.transparent,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           elevation: 5,
//           //  color: Colors.white,
//           //  margin: const EdgeInsets.symmetric(vertical: 10,),
//           child: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Image.asset(widget.imageUrl ?? "",
//                 //     height: 150, fit: BoxFit.cover),

//                 GestureDetector(
//                   child: Text(
//                     widget.companyName,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red.shade200,
//                     ),
//                   ),
//                   onTap: () {
//                     launchCompanyInURL(widget.companyurl);
//                   },
//                 ),
//                 const SizedBox(height: 4),
//                 Text(widget.location,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.white,
//                     )),
//                 const SizedBox(height: 4),
//                 Text(
//                   widget.role,
//                   style: const TextStyle(
//                       fontSize: 12,
//                       // fontWeight: FontWeight.nor,
//                       color: Colors.white),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   widget.date,
//                   style: const TextStyle(fontSize: 12, color: Colors.white),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   widget.description,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 25,
//                   style: const TextStyle(color: Colors.white, fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void launchCompanyInURL(String companyUrl) async {
//   var url = companyUrl;
//   if (await canLaunch(url)) {
//     await launch(
//       url,
//       forceWebView: true,
//     );
//   } else {
//     throw 'Could not launch $url';
//   }
// }
