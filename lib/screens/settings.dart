import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final bool isDarkMode;
  final bool isFahrenheit;
  final ValueChanged<bool> onDarkModeChanged;
  final ValueChanged<bool> onUnitChanged;

  const MenuScreen({
    super.key,
    required this.isDarkMode,
    required this.isFahrenheit,
    required this.onDarkModeChanged,
    required this.onUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController cityController = TextEditingController();

    final bg1 =
    isDarkMode ? const Color(0xFF0F2027) : const Color(0xFF4facfe);

    final bg2 =
    isDarkMode ? const Color(0xFF203A43) : const Color(0xFF00f2fe);

    final cardColor =
    isDarkMode ? Colors.white10 : Colors.white.withOpacity(0.18);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [bg1, bg2],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Top Bar
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Menu",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                /// Search City
                _glassCard(
                  color: cardColor,
                  child: TextField(
                    controller: cityController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: "Enter City Name",
                      hintStyle: const TextStyle(color: Colors.white70),
                    ),
                    onSubmitted: (value) {
                      Navigator.pop(context, value);
                    },
                  ),
                ),

                const SizedBox(height: 18),

                /// Dark Mode
                _glassCard(
                  color: cardColor,
                  child: SwitchListTile(
                    value: isDarkMode,
                    activeColor: Colors.white,
                    onChanged: onDarkModeChanged,
                    title: const Text(
                      "Dark Mode",
                      style: TextStyle(color: Colors.white),
                    ),
                    secondary: const Icon(
                      Icons.dark_mode,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// Temperature Unit
                _glassCard(
                  color: cardColor,
                  child: ListTile(
                    leading: const Icon(
                      Icons.thermostat,
                      color: Colors.white,
                    ),
                    title: Text(
                      isFahrenheit
                          ? "Temperature Unit: °F"
                          : "Temperature Unit: °C",
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Switch(
                      value: isFahrenheit,
                      activeColor: Colors.white,
                      onChanged: onUnitChanged,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// About Us
                _glassCard(
                  color: cardColor,
                  child: ListTile(
                    leading: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                    title: const Text(
                      "About Us",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AboutUsPage(),
                        ),
                      );
                    },
                  ),
                ),

                const Spacer(),

                const Center(
                  child: Text(
                    "Weather App v1.0",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _glassCard({
    required Color color,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white24),
      ),
      child: child,
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "About Us",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "This Weather App provides real-time weather updates, hourly forecasts, city search, dark mode and temperature unit switching.\n\nBuilt with Flutter and powered by Open-Meteo API.\n\n Build for Non commercial Use only.\n\n Only Build for Academics. \n\n Developed by Abu Talib.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}