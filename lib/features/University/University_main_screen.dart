import 'package:flutter/material.dart';
import '../home/presentation/widgets/custom_app_bar.dart';

class UniversityMainScreen extends StatefulWidget {
  const UniversityMainScreen({super.key});

  @override
  State<UniversityMainScreen> createState() => _UniversityMainScreenState();
}

class _UniversityMainScreenState extends State<UniversityMainScreen> {
  int expandedIndex = -1; // Track which card is expanded

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          // Header section with title and icon
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.school,
                  color: Color(0xFF1DD3B0),
                  size: 24,
                ),
                const Text(
                  'الجامعات الخاصة',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1DD3B0),
                  ),
                ),
              ],
            ),
          ),
          
          // Search bar
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1DD3B0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.white),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'خريطة الجامعات',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(Icons.map, color: Colors.white),
              ],
            ),
          ),

          // Filter section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'اول عشرة نتائج',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _FilterButton(title: 'الأكثر زيارة', icon: Icons.trending_up),
                    _FilterButton(title: 'أقل رسوم دراسية', icon: Icons.attach_money),
                    _FilterButton(title: 'الأحدث', icon: Icons.thumb_up),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // University cards list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 7, // Number of university cards
              itemBuilder: (context, index) {
                // Check if this card is expanded
                bool isExpanded = expandedIndex == index;
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      expandedIndex = isExpanded ? -1 : index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // Left side - University info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.verified,
                                        color: Color(0xFF1DD3B0),
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Flexible(
                                        child: Text(
                                          _getUniversityName(index),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'أقل معدل للقبول',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Text(
                                    '%60',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'المعلومات موثقة من الجامعة',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            // Right side - University logo
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.school,
                                color: Color(0xFF6366F1),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        
                        // Expanded details when card is tapped
                        if (isExpanded) ...[
                          const SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _buildDetailRow(Icons.school, 'شهادة البكلوريوس', 'بكالوريوس'),
                                const SizedBox(height: 8),
                                _buildDetailRow(Icons.category, 'عدد التخصصات : 20 تخصص', ''),
                                const SizedBox(height: 8),
                                _buildDetailRow(Icons.access_time, 'أقل عدد ساعات : 132 ساعة معتمدة', ''),
                                const SizedBox(height: 8),
                                _buildDetailRow(Icons.location_on, 'توفر المواصلات : عمان، البقاع، الزرقاء، جرش', ''),
                                const SizedBox(height: 8),
                                _buildDetailRow(Icons.phone, '0799024000 | 064791400', ''),
                                const SizedBox(height: 8),
                                _buildDetailRow(Icons.access_time, 'الساعة المعتمدة تبدأ من 12 دينار', ''),
                                const SizedBox(height: 8),
                                _buildDetailRow(Icons.location_on, 'البقاء : عين الباشا ، شارع الأردن - منطقة موبص،', ''),
                                const Text(
                                  'تبعد 12 كم الشمال من العاصمة عمان',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                const SizedBox(height: 16),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: _buildActionButton('اتصال', Icons.phone, const Color(0xFF4CAF50))),
                                        const SizedBox(width: 8),
                                        Expanded(child: _buildActionButton('مراسلة', Icons.message, const Color(0xFF2196F3))),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Expanded(child: _buildActionButton('الموقع', Icons.location_on, const Color(0xFFFF5722))),
                                        const SizedBox(width: 8),
                                        Expanded(child: _buildActionButton('التفاصيل', Icons.info, const Color(0xFF9C27B0))),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getUniversityName(int index) {
    final universities = [
      'جامعة عمان الأهلية',
      'جامعة عمان العربية',
      'جامعة إربد الأهلية',
      'الجامعة الأمريكية في مادبا',
      'جامعة إربد الأهلية',
      'جامعة عمان العربية',
      'جامعة عمان الأهلية',
    ];
    return universities[index];
  }

  Widget _buildDetailRow(IconData icon, String text, String prefix) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(width: 8),
        Icon(
          icon,
          color: Colors.white,
          size: 16,
        ),
      ],
    );
  }

  Widget _buildActionButton(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const _FilterButton({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
