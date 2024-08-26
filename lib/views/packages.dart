import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({super.key});

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.purple,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 25, 3, 56),
        title: Image.asset('images/logo.png', scale: 4.2),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 60, 0, 120),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "OUR PACKAGES",
                  style: GoogleFonts.oxanium(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              packageBuilder(
                'images/packages/basic.jpg',
                3,
                'BASIC',
                'The Basic Package offers essential VR 360-degree coverage for 4-6 hours. This package is perfect for capturing key moments of your event in immersive 360-degree video, ideal for those seeking a simple yet memorable experience.',
              ),
              const SizedBox(height: 40),
              packageBuilder(
                'images/packages/premium.png',
                2,
                'STANDARD',
                "The Standard Package provides up to a full day of VR 360-degree video coverage. It includes additional cameras and basic post-production editing, ensuring a comprehensive capture of your special day.",
              ),
              const SizedBox(height: 40),
              packageBuilder(
                'images/packages/premium_1.jpg',
                4,
                'PREMIUM',
                "The Premium Package delivers extensive VR 360-degree coverage over multiple days of your wedding or event. With multiple camera angles, advanced editing, drone footage, and professional-grade production, this package offers a cinematic experience that fully encapsulates your event.",
              ),
              const SizedBox(height: 40),
              packageBuilder(
                'images/packages/custom.png',
                2,
                'CUSTOM',
                "The Custom Package is tailored for multiple events or specific business needs. It allows you to customize every aspect of your VR 360-degree event coverage, providing a personalized experience that meets your unique requirements.",
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

Widget packageBuilder(
    String imageRoute, double scale, String name, String description) {
  return Material(
    color: const Color.fromARGB(255, 60, 0, 120),
    elevation: 10,
    child: Card.outlined(
      color: Colors.pink[800],
      child: Row(
        children: [
          Image.asset(imageRoute, scale: scale),
          Flexible(
            child: ListTile(
              title: Text(
                name,
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
              subtitle: Text(
                description,
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[900],
                ),
                onPressed: () {},
                child: Text(
                  'ENQUIRE',
                  style: GoogleFonts.oxanium(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
