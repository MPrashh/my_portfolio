import 'package:flutter/material.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Row(
                children: [
                  RiveAnimatedIcon(
                    riveIcon: RiveIcon.mail,
                    loopAnimation: true,
                    color: Color(0xffFFC371),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'prashantsmane66@gmail.com',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  RiveAnimatedIcon(
                    riveIcon: RiveIcon.call,
                    loopAnimation: true,
                    color: Color(0xffFFC371),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      '+91-8951856207',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  RiveAnimatedIcon(
                    riveIcon: RiveIcon.home2,
                    loopAnimation: true,
                    color: Color(0xffFFC371),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Mangalwar Peth, Banahatti - 587311, Karnataka, India',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
