// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoBuilder {
  static Widget photo_builder() {
    return Opacity(
      opacity: 0.8,
      child: Container(
        color: const Color.fromARGB(255, 60, 0, 120),
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          shrinkWrap: true,
          physics:
              const NeverScrollableScrollPhysics(), // Disable GridView scrolling
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 3 items per row
            mainAxisSpacing: 6.0, // Reduced spacing between rows
            crossAxisSpacing: 16.0, // Spacing between columns
            childAspectRatio: 0.75, // Adjusted aspect ratio
          ),
          children: [
            Column(
              children: [
                Image.asset(
                  'images/aastha.jpeg',
                  scale: 10,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'CEO',
                  style: GoogleFonts.orbitron(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Background in leadership and a passion for innovation in VR technology, well suited to guide the company through its growth and development.",
                  style: GoogleFonts.orbitron(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'images/akansha.jpeg',
                  scale: 7.35,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'CMO',
                  style: GoogleFonts.orbitron(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Experience in publicity and creative approach to brand building, ideal for increasing the company's visibility and market reach.",
                  style: GoogleFonts.orbitron(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'images/mrug.jpeg',
                  scale: 8,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'COO',
                  style: GoogleFonts.orbitron(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Experience in operations management and organizational skills are ideal for handling the complexities of running the company's internal operations.",
                  style: GoogleFonts.orbitron(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'images/arpit.jpeg',
                  scale: 7.35,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'CFO',
                  style: GoogleFonts.orbitron(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Background in finance and accounting allow to manage the company's financial health and ensure sustainable growth.",
                  style: GoogleFonts.orbitron(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'images/arpit.jpeg', // Replace with the correct image
                  scale: 8,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'CTO', // Replace with the correct title
                  style: GoogleFonts.orbitron(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Expert in technology with a deep understanding of VR systems, leading the tech innovations at the company.", // Replace with appropriate description
                  style: GoogleFonts.orbitron(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
