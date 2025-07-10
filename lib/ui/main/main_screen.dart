import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main/core/colors/colors_screen.dart';
import 'package:main/ui/main/bloc/main_bloc.dart';
import 'package:main/ui/main/widgets/product_card.dart';
import 'product_detail_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() {
    context.read<MainBloc>().add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final isDesktop = screenWidth >= 1024;

    return Scaffold(
      body: Container(
        color: AppColors.background,
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ListView(
              children: [
                SizedBox(
                  height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Qidirish',
                      label: null,
                      labelStyle: TextStyle(
                        color: AppColors.textColor, // Label rangi
                        fontSize: 16, // Font o‘lchami
                      ),
                      hintText: 'Matn kiriting...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.black,
                          // Aktiv bo‘lganda border rangi
                          width: 2, // Qalinligi
                        ),
                      ),
                    ),
                  ),

                ),
                const SizedBox(height: 16),
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
                    final productList= state.productList??[];

                    if (!isTablet && !isDesktop) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: productList.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final product = productList[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailScreen(product: product),
                                ),
                              );
                            },
                            child: ProductCard(
                              name: product.name ?? "",
                              code: product.code ?? "",
                              price: product.price ?? 0,
                              warehouse: product.warehouse ?? "",
                              imageUrl: product.imageUrl,
                              images: product.images,
                              variants: product.variants ?? [],
                              totalCount: product.totalCount ?? 0,
                            ),
                          );
                        },
                      );
                    } else {
                      return GridView.count(
                        crossAxisCount: crossAxisCount,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 10 / 4,
                        children: productList.map((product) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailScreen(product: product),
                                ),
                              );
                            },
                            child: ProductCard(
                              name: product.name ?? "",
                              code: product.code ?? "",
                              price: product.price ?? 0,
                              warehouse: product.warehouse ?? "",
                              imageUrl: product.imageUrl,
                              images: product.images,
                              variants: product.variants ?? [],
                              totalCount: product.totalCount ?? 0,
                            ),
                          );
                        }).toList(),
                      );
                    }
                  },
                ),

              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatCard(Color color,
      IconData icon,
      String label,
      String count,) {
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
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
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


}
