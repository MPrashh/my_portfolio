import 'package:flutter/material.dart';
import 'package:port_fol/experience_section.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
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
                child: EducationCard(
                  collegeName: "SRA High School Banahatti",
                  dateGraduated: "2015",
                  degree: "SSLC",
                ),
              ),
              Expanded(
                child: EducationCard(
                  collegeName: "SRA PU College Banahatti",
                  dateGraduated: "2015 - 17",
                  degree: "PUC - Science",
                ),
              ),
              Expanded(
                child: EducationCard(
                  collegeName: "RNS Institute of Technology, Bengaluru",
                  dateGraduated: "2017 - 21",
                  degree: "B.E - ECE",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EducationCard extends StatelessWidget {
  final String collegeName;
  final String dateGraduated;
  final String degree;

  const EducationCard({
    super.key,
    required this.collegeName,
    required this.dateGraduated,
    required this.degree,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomPaint(
        painter: BorderPainter(),
        child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  collegeName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  degree,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const RiveAnimatedIcon(
                      riveIcon: RiveIcon.graduate,
                      width: 25,
                      height: 25,
                      loopAnimation: true,
                      color: Color(0xffFFC371),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        dateGraduated,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
