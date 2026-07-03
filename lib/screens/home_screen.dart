import 'package:flutter/material.dart';
import '../data/fake_data.dart';
import '../widgets/breaking_news_banner.dart';
import '../widgets/section_chip_list.dart';
import '../widgets/article_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  String _selectedCategory = 'Tous';

  void _onTabTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le Revenu'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BreakingNewsBanner(article: FakeData.featuredArticle),
            const SizedBox(height: 20),
            SectionChipList(
              sections: FakeData.sections,
              selectedLabel: _selectedCategory,
              onSelected: _onCategorySelected,
            ),
            const SizedBox(height: 20),
            const Text(
              'À la une',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...FakeData.articles
              .where((article) =>
                _selectedCategory == 'Tous' || article.category == _selectedCategory)
              .map((article) => ArticleCard(article: article)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF0B3D91),
        unselectedItemColor: Colors.grey,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Bourse'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}