import '../models/article.dart';
import '../models/section.dart';

class FakeData {
  static const List<Section> sections = [
    Section(label: 'Bourse'),
    Section(label: 'Immobilier'),
    Section(label: 'Placements'),
    Section(label: 'Fiscalité'),
    Section(label: 'Assurance'),
    Section(label: 'Retraite'),
  ];

  static const Article featuredArticle = Article(
    title: 'Le CAC 40 franchit un nouveau record historique',
    category: 'Bourse',
    imageUrl: 'https://picsum.photos/seed/cac40/800/500',
    publishedAt: 'Il y a 2h',
  );

  static const List<Article> articles = [
    Article(
      title: 'Immobilier : les taux de crédit repartent à la baisse',
      category: 'Immobilier',
      imageUrl: 'https://picsum.photos/seed/immo1/400/300',
      publishedAt: 'Il y a 3h',
    ),
    Article(
      title: 'Assurance-vie : quel fonds euros choisir en 2026 ?',
      category: 'Placements',
      imageUrl: 'https://picsum.photos/seed/placement1/400/300',
      publishedAt: 'Il y a 5h',
    ),
    Article(
      title: 'Ce qui change pour votre déclaration de revenus cette année',
      category: 'Fiscalité',
      imageUrl: 'https://picsum.photos/seed/fiscal1/400/300',
      publishedAt: 'Il y a 6h',
    ),
    Article(
      title: 'Retraite : faut-il encore miser sur le PER ?',
      category: 'Retraite',
      imageUrl: 'https://picsum.photos/seed/retraite1/400/300',
      publishedAt: 'Hier',
    ),
    Article(
      title: 'Les cinq valeurs à surveiller cette semaine en Bourse',
      category: 'Bourse',
      imageUrl: 'https://picsum.photos/seed/bourse2/400/300',
      publishedAt: 'Hier',
    ),
  ];
}