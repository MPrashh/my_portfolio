import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:port_fol/widgets/border_painter.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
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
    return Center(
      child: FadeScaleTransition(
        animation: _animation,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 140),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const AnimatedCircle(),
                // const CircleAvatar(
                //   radius: 50,
                //   //backgroundImage: AssetImage('assets/images/link_two.png'),
                //   child: Icon(Icons.person),
                // ),
                const SizedBox(height: 20),
                MouseRegion(
                  onEnter: (_) => setState(() => _isHovered = true),
                  onExit: (_) => setState(() => _isHovered = false),
                  child: GestureDetector(
                    onScaleStart: (details) {
                      _previousScale = _scale;
                      setState(() {});
                    },
                    onScaleUpdate: (details) {
                      _scale = _previousScale * details.scale;
                      setState(() {});
                    },
                    onScaleEnd: (details) {
                      _previousScale = 1.0;
                      setState(() {});
                    },
                    child: Transform.scale(
                      scale: _scale,
                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                        // width: _isHovered ? 220 : 200,
                        // height: _isHovered ? 220 : 200,
                        // color: _isHovered ? Colors.blue : Colors.red,
                        child: Center(
                          child: Text(
                            "PRASHANT MANE",
                            style: TextStyle(
                              letterSpacing: _isHovered ? 10 : 6,
                              fontFamily: 'Montserrat',
                              fontSize: 24,
                              color: const Color.fromARGB(255, 219, 174, 30),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Software Developer',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.place_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Flexible(
                      child: Text(
                        'Bangalore, Karnataka, India',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1,
                          color: Colors.white70,
                        ),
                        maxLines: 4,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Expanded(
                    child: Text(
                      "Highly skilled Flutter developer with over 2.6 years of experience in building cross-platform mobile applications. Proficient in Flutter framework, including widgets, architecture, and libraries. Strong background in UI design, API integration, state management, and third-party service integration. Excellent problem-solving skills and a keen eye for detail. Additionally, knowledgeable in .NET Web API, enhancing backend integration capabilities.",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        launchLinkedInURL();
                      },
                      child: Lottie.asset(
                        "assets/animations/linkedin_anim.json",
                        //width: 50,
                        height: 55,
                        fit: BoxFit.fill,
                        //controller: _controller,
                        onLoaded: (composition) {
                          _controller.duration = composition.duration;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        launchGitHubURL();
                      },
                      child: Lottie.asset(
                        "assets/animations/github_anim.json",
                        // width: 30,
                        height: 40,
                        fit: BoxFit.fill,
                        frameRate: const FrameRate(4),
                        //controller: _controller,
                        onLoaded: (composition) {
                          _controller.duration = composition.duration;
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedCircle extends StatefulWidget {
  final String? text;

  const AnimatedCircle({super.key, this.text});

  @override
  _AnimatedCircleState createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: BorderPainter(
            _animation.value,
          ),
          child: child,
        );
      },
      child: Stack(
        children: [
          SizedBox(
            width: 125,
            height: 125,
            // decoration: BoxDecoration(
            //   shape: BoxShape.circle,
            //   color: Colors.transparent,
            //   border: Border.all(color: Colors.white),
            // ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(
                        'assets/images/profile.jpeg',
                        // width: 40,
                        // height: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void launchLinkedInURL() async {
  const url = 'https://www.linkedin.com/in/prashant-mane-a6176521a/';
  if (await canLaunch(url)) {
    await launch(
      url,
      forceWebView: true,
    );
  } else {
    throw 'Could not launch $url';
  }
}

void launchGitHubURL() async {
  const url = 'https://github.com/MPrashh?tab=repositories';
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true, enableJavaScript: true);
  } else {
    throw 'Could not launch $url';
  }
}
