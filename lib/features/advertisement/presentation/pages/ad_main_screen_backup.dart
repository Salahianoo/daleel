import 'package:flutter/material.dart';
import '../../../home/presentation/widgets/custom_app_bar.dart';
import '../../../../l10n/app_localizations.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

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
                          Text(
                            localizations.chooseAdOrSubscription,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            localizations.marketingServices,
                            style: const TextStyle(
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
                        child: Text(
                          localizations.specialOffer,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
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
              _PlanExpansionTile(title: localizations.homePageAd),
              _PlanExpansionTile(title: localizations.firstAd),
              _PlanExpansionTile(title: localizations.featuredAd),
              _PlanExpansionTile(title: localizations.digitalPromotionPackage),
              _PlanExpansionTile(title: localizations.digitalPresencePackage),
              _PlanExpansionTile(title: localizations.comprehensiveAd),
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
    final localizations = AppLocalizations.of(context)!;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: const Color(0xFF38CFF7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.home,
              color: Colors.white,
              size: 18, // Smaller icon to prevent overflow
            ),
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
                Text(
                  localizations.planDetails,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF38CFF7),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  localizations.planDescription,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: _PriceOption(
                        duration: localizations.threeDays,
                        price: '300 ${localizations.dinar}',
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: _PriceOption(
                        duration: localizations.sevenDays,
                        price: '600 ${localizations.dinar}',
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: _PriceOption(
                        duration: localizations.fourteenDays,
                        price: '1000 ${localizations.dinar}',
                      ),
                    ),
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
                    child: Text(
                      localizations.subscribeNow,
                      style: const TextStyle(
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
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF38CFF7).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF38CFF7), width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            duration,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF38CFF7),
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
