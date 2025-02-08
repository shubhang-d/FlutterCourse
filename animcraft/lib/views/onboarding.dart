// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:animcraft/common/app_colors.dart';
import 'package:animcraft/common/buttons/scale_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 60),
                SizedBox(height: 160),
                Expanded(
                  child: AbsorbPointer(
                    // absorbing: true,
                    child: SingleChildScrollView(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          ...categories.map(
                            (e) => FadeInUp(
                              delay: Duration(
                                  milliseconds:
                                      100 * (categories.indexOf(e) + 1)),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColors.chipColor,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(width: 4),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        e.emoji,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      e.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FadeInUp(
              delay: Duration(milliseconds: 2200),
              child: Container(
                height: 680,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.bgColor.withValues(alpha: 0),
                      AppColors.bgColor.withValues(alpha: .6),
                      AppColors.bgColor.withValues(alpha: .8),
                      AppColors.bgColor.withValues(alpha: 1),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    ScaleButton(
                      scale: 1.1,
                      onTap: () {},
                      child: FractionallySizedBox(
                        widthFactor: .8,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade700,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    Colors.amber.shade700.withValues(alpha: .5),
                                blurRadius: 100,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                color: AppColors.bgColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.paddingOf(context).bottom + 40),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 120,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: AppColors.bgColor,
                  blurRadius: 100,
                  spreadRadius: 100,
                ),
              ]),
              child: Center(
                child: FadeInUp(
                  delay: Duration(milliseconds: 200),
                  duration: Duration(milliseconds: 800),
                  child: Text.rich(
                    TextSpan(
                      text: "Anim",
                      children: [
                        TextSpan(
                            text: "Craft",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                            )),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryModel {
  String name;
  String emoji;
  CategoryModel({
    required this.name,
    required this.emoji,
  });
}

final List<CategoryModel> categories = [
  CategoryModel(name: 'Mind & Psychology', emoji: '🧠'),
  CategoryModel(name: 'Self Help', emoji: '🌱'),
  CategoryModel(name: 'Science', emoji: '🔬'),
  CategoryModel(name: 'Philosophy', emoji: '💭'),
  CategoryModel(name: 'Fiction', emoji: '📚'),
  CategoryModel(name: 'Business', emoji: '💼'),
  CategoryModel(name: 'Technology', emoji: '💻'),
  CategoryModel(name: 'History', emoji: '📜'),
  CategoryModel(name: 'Art & Design', emoji: '🎨'),
  CategoryModel(name: 'Health & Fitness', emoji: '💪'),
  CategoryModel(name: 'Cooking', emoji: '🍳'),
  CategoryModel(name: 'Travel', emoji: '✈️'),
  CategoryModel(name: 'Personal Finance', emoji: '💰'),
  CategoryModel(name: 'Poetry', emoji: '📝'),
  CategoryModel(name: 'Biography', emoji: '👤'),
  CategoryModel(name: 'Religion & Spirituality', emoji: '🕉️'),
  CategoryModel(name: 'Mystery & Thriller', emoji: '🔍'),
  CategoryModel(name: 'Romance', emoji: '❤️'),
  CategoryModel(name: 'Science Fiction', emoji: '🚀'),
  CategoryModel(name: 'Fantasy', emoji: '🔮'),
  CategoryModel(name: 'Horror', emoji: '👻'),
  CategoryModel(name: 'Comics & Manga', emoji: '🦸'),
  CategoryModel(name: 'Education', emoji: '📖'),
  CategoryModel(name: 'Politics', emoji: '⚖️'),
  CategoryModel(name: 'Environment', emoji: '🌍'),
  CategoryModel(name: 'Music', emoji: '🎵'),
  CategoryModel(name: 'Sports', emoji: '⚽'),
  CategoryModel(name: 'Photography', emoji: '📸'),
];
