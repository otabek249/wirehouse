/*
import 'package:flutter/material.dart';
import '../../../../core/colors/colors_screen.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Demo data
    final categories = [
      {'name': 'Erkaklar', 'count': 12},
      {'name': 'Ayollar', 'count': 8},
      {'name': 'Bolalar', 'count': 5},
      {'name': 'Ustki kiyim', 'count': 7},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Kategoriyalar'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.buttonText,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.buttonText,
        onPressed: () {
          // TODO: Kategoriya qo‘shish screeniga o‘tish
        },
        child: const Icon(Icons.add),
        tooltip: 'Kategoriya qo‘shish',
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final cat = categories[i];
          return Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                cat['name'] as String,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Mahsulotlar: ${cat['count']}',
                style: const TextStyle(color: AppColors.textSecondary),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit, color: AppColors.primary),
                onPressed: () {
                  // TODO: Kategoriya tahrirlash
                },
              ),
              onTap: () {
                // TODO: Ushbu kategoriya mahsulotlari ro‘yxatiga o‘tish
              },
            ),
          );
        },
      ),
    );
  }
}
*/
