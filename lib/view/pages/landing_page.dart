import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: Center(child: Image.asset("assets/images/Illustration.png")),
          ),
          const SizedBox(
            height: 70,
          ),
          const Text(
            "Connect easily with\nyour family and friends\nover countries",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 120,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Terms & Privacy Policy",
                style: TextStyle(fontSize: 12, color: Colors.black),
              )),
          SizedBox(
            width: 310,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 13),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white),
              child: const Text(
                "Start Messaging",
              ),
            ),
          )
        ],
      ),
    );
  }
}
