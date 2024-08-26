import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vrapture/models/auth.dart';
import 'package:vrapture/models/firestore.dart';
import 'package:vrapture/views/contactUs.dart';
import 'package:vrapture/views/packages.dart';
import 'package:vrapture/views/team.dart';
import 'package:vrapture/views/virtualTour.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController;
  late final AnimationController _animationController;
  late String userName = '';

  Future<void> retrieveData() async {
    userName = await Firestore.retrieveName();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.antiAlias,
        backgroundColor: const Color.fromARGB(255, 25, 3, 56),
        title: Image.asset('images/logo.png', scale: 4.2),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.purple.withOpacity(0.5),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple[900],
            ),
            onPressed: () {
              Auth().signOut();
            },
            child: Text(
              "SIGN OUT",
              style: GoogleFonts.oxanium(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: _buildAnimatedBackground(
              const Color.fromARGB(255, 20, 0, 50),
              const Color.fromARGB(255, 60, 0, 120),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedBackground(Color startColor, Color endColor) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final double value = _animationController.value;
        return Stack(
          children: [
            Opacity(
              opacity: 0.8,
              child: Image.asset(
                'images/background.jpg',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [startColor, endColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, value],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'VRAPTURE',
                          style: GoogleFonts.orbitron(
                            fontSize: 56,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Anywhere. Together.",
                          style: GoogleFonts.orbitron(
                            fontSize: 28,
                            color: Colors.white70,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Hello, Checkout Our Services!',
                    style: GoogleFonts.orbitron(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildServiceCards(),
                  const SizedBox(height: 100),
                  const Divider(
                    color: Color.fromARGB(255, 180, 83, 221),
                    thickness: 5,
                    indent: 50,
                    endIndent: 50,
                  ),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildServiceCards() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildServiceCard(
              'Virtual Tours',
              Icons.location_city,
              const VirtualTours(),
            ),
            _buildServiceCard(
              'Packages Offered',
              Icons.category_rounded,
              const PackageScreen(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildServiceCard(
              'Our Team',
              Icons.groups_sharp,
              const TeamInfo(),
            ),
            _buildServiceCard(
              'Contact Us',
              Icons.contact_support_outlined,
              const ContactUsPage(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceCard(String title, IconData icon, Widget route) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          );
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 50,
                  color: Colors.purpleAccent,
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.orbitron(
                    fontSize: 18,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
