import 'package:daleel/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/drawer.dart';
import '../widgets/horizontal_category_section.dart';
import '../../../University/University_main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner carousel slider
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentCarouselIndex = index;
                    });
                  },
                ),
                items: [
                  // First banner item
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1DD3B0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 20,
                          top: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 8),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFD6F1F0),
                                  foregroundColor: const Color(0xFF1DD3B0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: const SizedBox(width: 80, height: 35),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Second banner item
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A90E2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 20,
                          top: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 8),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE3F2FD),
                                  foregroundColor: const Color(0xFF4A90E2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: const SizedBox(width: 80, height: 35),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Third banner item
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB9DBC1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 20,
                          top: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 8),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFF3E5F5),
                                  foregroundColor: const Color(0xFFB9DBC1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: const SizedBox(width: 80, height: 35),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Dynamic dots indicator for carousel
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3, // Number of carousel items
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: _currentCarouselIndex == index ? 12 : 8,
                  height: _currentCarouselIndex == index ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentCarouselIndex == index
                        ? const Color(0xFF1DD3B0) // Active dot color
                        : Colors.grey.withOpacity(0.5), // Inactive dot color
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Guide section
            HorizontalCategorySection(
              categories: [
                'جامعة',
                'مدرسة', 
                'حضانه',
                'روضة',
                'كلية',
                'احتياجات'
              ],
              backgroundColor: const Color(0xFF1DD3B0),
              icons: [
                Icons.school,
                Icons.home_work,
                Icons.child_care,
                Icons.child_friendly,
                Icons.business,
                Icons.category,
              ],
              onCategoryTap: (index, category) {
                if (category == 'جامعة') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UniversityMainScreen(),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 24),
            // Announcements section
            HorizontalCategorySection(
              categories: [
                'عروض خاصة',
                'فعاليات ايفنت', 
                'دورات تدريبية',
                'وظائف شاغرة',
                'منح دراسية',
                'أعمال تطوعية'
              ],
              backgroundColor: Colors.grey[500]!,
              icons: [
                Icons.local_offer,
                Icons.event,
                Icons.school,
                Icons.work,
                Icons.card_giftcard,
                Icons.volunteer_activism,
              ],
            ),
            const SizedBox(height: 24),
            // Placeholder for other content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
