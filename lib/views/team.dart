import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamInfo extends StatelessWidget {
  const TeamInfo({super.key});

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
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "MEET OUR TEAM",
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              cardBuilder(
                'images/aastha.jpeg',
                6,
                'Aastha Jajoo, CEO',
                "Background in leadership and a passion for innovation in VR technology, well suited to guide the company through its growth and development.",
              ),
              const SizedBox(height: 20),
              cardBuilder(
                'images/aman.jpeg',
                6,
                'Aman Morghade, CTO',
                "Expertise in technology and software development aligns perfectly to lead the technical aspects of the product.",
              ),
              const SizedBox(height: 20),
              cardBuilder(
                'images/mrug.jpeg',
                6,
                'Mruganksha Kudake, COO',
                "Experience in operations management and organizational skills are ideal for handling the complexities of running the company's internal operations.",
              ),
              const SizedBox(height: 20),
              cardBuilder(
                'images/arpit.jpeg',
                6,
                'Arpit Mutha, CFO',
                "Background in finance and accounting allows to manage the company's financial health and ensure sustainable growth.",
              ),
              const SizedBox(height: 20),
              cardBuilder(
                'images/akansha.jpeg',
                6,
                'Akansha Patil, CMO',
                "Experience in publicity and creative approach to brand building, ideal for increasing the company's visibility and market reach.",
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardBuilder(
    String imageRoute, double scale, String name, String description) {
  return Material(
    color: const Color.fromARGB(255, 60, 0, 120),
    child: Card(
      color: Colors.grey[700],
      child: Row(
        children: [
          Image.asset(imageRoute, scale: scale, fit: BoxFit.contain),
          Flexible(
            child: ListTile(
              minLeadingWidth: 100,
              title: Text(
                name,
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                description,
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
