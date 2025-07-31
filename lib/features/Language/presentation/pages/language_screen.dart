import '../../../../l10n/app_localizations.dart';
import 'package:daleel/core/language/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/presentation/widgets/custom_app_bar.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'ar'; // Default to Arabic

  @override
  void initState() {
    super.initState();
    // Get current language from cubit
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentLanguage = context.read<LanguageCubit>().currentLanguageCode;
      setState(() {
        selectedLanguage = currentLanguage;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, languageState) {
        final localizations = AppLocalizations.of(context)!;

        return CustomScaffold(
          title: localizations.selectLanguage,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Header
                const Icon(Icons.language, size: 80, color: Color(0xFF1DD3B0)),
                const SizedBox(height: 20),
                Text(
                  localizations.preferredLanguage,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),

                // Language Options
                _buildLanguageCard(
                  language: 'ar',
                  title: 'العربية',
                  subtitle: 'Arabic',
                  flag: '🇸🇦',
                ),
                const SizedBox(height: 16),
                _buildLanguageCard(
                  language: 'en',
                  title: 'English',
                  subtitle: 'الإنجليزية',
                  flag: '🇺🇸',
                ),

                const Spacer(),

                // Apply Button
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _applyLanguageChange();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1DD3B0),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      localizations.apply,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageCard({
    required String language,
    required String title,
    required String subtitle,
    required String flag,
  }) {
    final bool isSelected = selectedLanguage == language;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF1DD3B0).withOpacity(0.1)
              : Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF1DD3B0) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Flag
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.shade100,
              ),
              child: Center(
                child: Text(flag, style: const TextStyle(fontSize: 24)),
              ),
            ),
            const SizedBox(width: 16),

            // Language Info
            Expanded(
              child: Column(
                crossAxisAlignment: context
                    .read<LanguageCubit>()
                    .crossAxisStart,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? const Color(0xFF1DD3B0)
                          : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            // Selection Indicator
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF1DD3B0)
                      : Colors.grey.shade400,
                  width: 2,
                ),
                color: isSelected
                    ? const Color(0xFF1DD3B0)
                    : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  void _applyLanguageChange() {
    final languageCubit = context.read<LanguageCubit>();

    // Check if language actually changed
    if (selectedLanguage == languageCubit.currentLanguageCode) {
      return;
    }

    // Apply language change immediately
    languageCubit.changeLanguage(selectedLanguage);

    // Show success message after a short delay to ensure the UI has updated
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              selectedLanguage == 'ar'
                  ? 'تم تغيير اللغة بنجاح'
                  : 'Language changed successfully',
            ),
            backgroundColor: const Color(0xFF1DD3B0),
          ),
        );
      }
    });
  }
}
