import 'package:flutter/material.dart';
import '../../../home/presentation/widgets/custom_app_bar.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top info banner
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF38CFF7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.send, color: Colors.white, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'اختر الإعلان أو الاشتراك المناسب',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'استفد من خدماتنا التقنية و الإعلانية لتسويق مؤسستك بشكل احترافي و زيادة عدد المشاهدات والتسجيل!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Top blue info box
              const SizedBox(height: 16),

              // Green plan card with special offer
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 16, top: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF14AD93),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    // "عرض خاص" ribbon
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red[400],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: const Text(
                          "عرض خاص",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                    // Main content
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 36,
                          ),
                          const SizedBox(height: 8),

                          const SizedBox(height: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              SizedBox(height: 4),

                              SizedBox(height: 4),

                              SizedBox(height: 4),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF14AD93),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: null,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF13D2B0),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: null,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Other plans
              const SizedBox(height: 8),

              const SizedBox(height: 10),
              _PlanExpansionTile(title: "إعلان الصفحة الرئيسية"),
              _PlanExpansionTile(title: "الإعلان الأول"),
              _PlanExpansionTile(title: "الإعلان المميز"),
              _PlanExpansionTile(title: "باقة الترويج الرقمي"),
              _PlanExpansionTile(title: "باقة التواجد الرقمي"),
              _PlanExpansionTile(title: "الإعلان الشامل"),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlanExpansionTile extends StatefulWidget {
  final String title;
  const _PlanExpansionTile({required this.title});

  @override
  State<_PlanExpansionTile> createState() => _PlanExpansionTileState();
}

class _PlanExpansionTileState extends State<_PlanExpansionTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: const Color(0xFF38CFF7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 12),
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        leading: AnimatedRotation(
          turns: isExpanded ? 0.5 : 0, // 0.5 turns = 180 degrees
          duration: const Duration(milliseconds: 200),
          child: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 7),
            const Icon(
              Icons.home,
              color: Colors.white,
            ), // Home icon on the right
          ],
        ),
        trailing: const SizedBox.shrink(), // Remove default trailing arrow
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'تفاصيل الخطة',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF38CFF7),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'هذه الخطة تتيح لك عرض إعلانك في موقع بارز على الصفحة الرئيسية للتطبيق، مما يضمن وصولك لأكبر عدد من المستخدمين.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _PriceOption(duration: '3 أيام', price: '300 دينار'),
                    _PriceOption(duration: '7 أيام', price: '600 دينار'),
                    _PriceOption(duration: '14 يوم', price: '1000 دينار'),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF38CFF7),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'اشترك الآن',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceOption extends StatelessWidget {
  final String duration;
  final String price;

  const _PriceOption({required this.duration, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF38CFF7).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF38CFF7), width: 1),
      ),
      child: Column(
        children: [
          Text(
            duration,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF38CFF7),
            ),
          ),
          const SizedBox(height: 4),
          Text(price, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
