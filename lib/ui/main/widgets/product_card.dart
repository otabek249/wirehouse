import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/product/varinat.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String code;
  final double price;
  final String warehouse;
  final String? imageUrl;
  final List<dynamic?> images;
  final List<Variant> variants;
  final int totalCount;

  const ProductCard({
    super.key,
    required this.name,
    required this.code,
    required this.price,
    required this.warehouse,
    required this.imageUrl,
    required this.images,
    required this.variants,
    required this.totalCount,
  });

  Color getColorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'qora':
        return Colors.black;
      case 'oq':
        return Colors.white;
      case 'qizil':
        return Colors.red;
      case 'yashil':
        return Colors.green;
      case "ko'k":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 100,
                height: 100,
                child:
                    images.isNotEmpty
                        ? CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 1,
                            height: 100,
                            autoPlay: true,
                            enableInfiniteScroll: false,
                          ),
                          items:
                              images.map((imgUrl) {
                                return Image.network(
                                  imgUrl ?? "",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (_, __, ___) => Container(
                                        color: Colors.grey.shade200,
                                        child: const Icon(
                                          Icons.image_not_supported,
                                          size: 40,
                                        ),
                                      ),
                                );
                              }).toList(),
                        )
                        : (imageUrl != null
                            ? Image.network(
                              imageUrl!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (_, __, ___) => Container(
                                    color: Colors.grey.shade200,
                                    child: const Icon(
                                      Icons.image_not_supported,
                                      size: 40,
                                    ),
                                  ),
                            )
                            : Container(
                              color: Colors.grey.shade200,
                              child: const Icon(Icons.image, size: 40),
                            )),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    code,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          warehouse,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "$totalCount dona",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 24,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: variants.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final variant = variants[index];
                        final color = getColorFromName(variant.color ?? '');
                        final quantity = variant.quantity ?? 0;
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(radius: 6, backgroundColor: color),
                              const SizedBox(width: 4),
                              Text(
                                variant.color ?? 'N/A',
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "$quantity ta",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
