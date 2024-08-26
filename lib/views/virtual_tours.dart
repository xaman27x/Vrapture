import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VirtualTours extends StatefulWidget {
  const VirtualTours({super.key});

  @override
  State<VirtualTours> createState() => _VirtualToursState();
}

class _VirtualToursState extends State<VirtualTours> {
  final List<YoutubePlayerController> _controllers = [];

  @override
  void initState() {
    super.initState();
    final videoUrls = [
      'https://youtu.be/b9_SU7NfbyE',
      'https://youtu.be/9xwazD5SyVg',
      'https://youtu.be/5qap5aO4i9A',
    ];

    for (var url in videoUrls) {
      final videoId = YoutubePlayer.convertUrlToId(url);
      if (videoId != null) {
        _controllers.add(
          YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(autoPlay: false),
          ),
        );
      } else {
        debugPrint('Invalid video URL: $url');
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
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
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 25, 3, 56),
        title: Image.asset('images/logo.png', scale: 4.2),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3F0E40), Color(0xFF1C052A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "OUR VIRTUAL TOURS",
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _buildVideoSection(),
              const SizedBox(height: 30),
              Text(
                "Explore Our Amazing Virtual Tours",
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoSection() {
    return Column(
      children: _controllers.map((controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: YoutubePlayer(
                    controller: controller,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      debugPrint('Player is ready.');
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    controller.value.isPlaying
                        ? controller.pause()
                        : controller.play();
                  });
                },
                icon: Icon(
                  controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                label: Text(
                  controller.value.isPlaying ? 'Pause' : 'Play',
                  style: GoogleFonts.orbitron(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 60, 0, 120),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      }).toList(),
    );
  }
}
