import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj_ledger/pages/signup_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // --- Top Icon ---
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(34.0),
                    ),
                    child: const Icon(
                      Icons.inventory_2_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),

              // --- Welcome Text ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Welcome to LedgerOne",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          "Your professional platform for real-time asset \n tracking and inventory monitoring",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12.0),

              // --- Feature List ---
              const FeatureListContainer(),

              // --- FIX: Replaced Spacer() with SizedBox ---
              // Spacer() crashes inside SingleChildScrollView because the height is infinite.
              const SizedBox(height: 30), 

              // --- Get Started Button ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0), // Added horizontal padding for better look
                child: SizedBox(
                  width: double.infinity,
                  height: 48, // Slightly taller for better touch target
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SignUpScreen())
                        );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // --- Footer Text ---
              const Text(
                "Start managing your inventory smarter",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30), // Bottom padding for safety
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureListContainer extends StatelessWidget {
  const FeatureListContainer({super.key});

  Widget _buildFeatureRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(
              icon,
              size: 30,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70, // Slightly dimmer for contrast
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // Removed fixed width: 400 to make it responsive on smaller screens
        constraints: const BoxConstraints(maxWidth: 400), 
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[900], // Matches background or can be slightly lighter
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.white10), // Optional border for visibility
        ),
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildFeatureRow(
              icon: CupertinoIcons.graph_square,
              iconColor: Colors.cyan,
              title: "Real-Time Insights",
              subtitle: "Monitor your inventory and asset values instantly with live updates",
            ),
            const Divider(color: Colors.white10, height: 20), // Added height to divider
            _buildFeatureRow(
              icon: CupertinoIcons.bell, // Changed icon for variety
              iconColor: Colors.cyan,
              title: "Smart Alert",
              subtitle: "Get notified when the stock levels are low or critical actions are to be taken",
            ),
            const Divider(color: Colors.white10, height: 20),
            _buildFeatureRow(
              icon: CupertinoIcons.briefcase, // Changed icon for variety
              iconColor: Colors.cyan,
              title: "Professional Grade",
              subtitle: "Enterprise tools designed for busy professionals and managers",
            ),
          ],
        ),
      ),
    );
  }
}