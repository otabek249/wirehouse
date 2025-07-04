import 'package:flutter/material.dart';
import 'package:main/core/colors/colors_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final isDesktop = screenWidth >= 1024;


    return Scaffold(
      body: Container(
        color: AppColors.background,
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
             Padding(
               padding: const EdgeInsets.all(12),
               child: TextField(

                 decoration: InputDecoration(
                   labelText: 'Qidirish',
                   hintText: 'Matn kiriting...',
                   prefixIcon: const Icon(Icons.search),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(12),
                   ),
                 ),
               ),
             ),
            const SizedBox(height: 16),
            const SizedBox(height: 24),
            const Text(
              "Latest Arrived Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 1;
                if (isDesktop) {
                  crossAxisCount = 3;
                } else if (isTablet) {
                  crossAxisCount = 2;
                }
                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3,
                  children: [
                    _buildProductCard(
                      color: AppColors.cardBackground,
                      image: 'https://via.placeholder.com/150', // Haqiqiy image URL
                      name: "Premium Cotton T-Shirt",
                      units: 42,
                      location: "Warehouse A-12",
                      colors: [Colors.red, Colors.green, Colors.blue],
                      colorCounts: [10, 5, 8],
                    ),
                    _buildProductCard(
                      color: AppColors.cardBackground,
                      image: 'https://via.placeholder.com/150',
                      name: "Classic Denim Jeans",
                      units: 35,
                      location: "Warehouse B-03",
                      colors: [Colors.blue, Colors.purple, Colors.grey],
                      colorCounts: [15, 12, 8],
                    ),
                    _buildProductCard(
                      color: AppColors.cardBackground,
                      image: 'https://via.placeholder.com/150', // Haqiqiy image URL
                      name: "Premium Cotton T-Shirt",
                      units: 42,
                      location: "Warehouse A-12",
                      colors: [Colors.red, Colors.green, Colors.blue],
                      colorCounts: [10, 5, 8],
                    ),
                    _buildProductCard(
                      color: AppColors.cardBackground,
                      image: 'https://via.placeholder.com/150', // Haqiqiy image URL
                      name: "Premium Cotton T-Shirt",
                      units: 42,
                      location: "Warehouse A-12",
                      colors: [Colors.red, Colors.green, Colors.blue],
                      colorCounts: [10, 5, 8],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(Color color, IconData icon, String label, String count) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(icon, color: color, size: 40),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                count,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildProductCard({
    required Color color,
    required String image,
    required String name,
    required int units,
    required String location,
    required List<Color> colors,
    required List<int> colorCounts,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://cdn.olcha.uz/image/700x700/products//rpc/terrapro/2025-04-12/qfUzDkS9uaXH17ZBG3GE6IriKOg4KiCq1SIcIyNlZUYA5nC1Sxm0KeGkcyCph1eG.jpg",
              width: 80,
              errorBuilder: (_, __, ___) => const Icon(Icons.error, size: 80),
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppColors.textColor),
                ),
                const SizedBox(height: 4),
                Text(
                  "$units units",
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: List.generate(colors.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: colors[index],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${colorCounts[index]}",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
