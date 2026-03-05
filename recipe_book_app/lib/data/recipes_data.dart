import '../models/recipe.dart';

final List<Recipe> sampleRecipes = [
  Recipe(
    name: 'Pasta',
    imagePath: 'assets/images/pasta.jpg',
    ingredients: [
      'Pasta',
      'Garlic',
      'Cream',
      'Parmesan cheese'
    ],
    instructions:
        'Boil pasta. Cook garlic in butter. Add cream and cheese. Mix with pasta.',
  ),

  Recipe(
    name: 'Greek Salad',
    imagePath: 'assets/images/greeksalad.jpg',
    ingredients: [
      'Lettuce',
      'Tomatoes',
      'Cucumber',
      'Feta cheese',
      'Olives',
      'Olive oil'
    ],
    instructions:
        'Chop vegetables. Add feta and olives. Drizzle olive oil and mix.',
  ),

  Recipe(
    name: 'Pancakes',
    imagePath: 'assets/images/pancakes.jpg',
    ingredients: [
      'Flour',
      'Milk',
      'Eggs',
      'Sugar',
      'Baking powder'
    ],
    instructions:
        'Mix ingredients into batter. Pour on pan. Cook both sides until golden.',
  ),

  Recipe(
    name: 'Chicken Stir Fry',
    imagePath: 'assets/images/chickenstirfry.jpg',
    ingredients: [
      'Chicken breast',
      'Soy sauce',
      'Mixed vegetables',
      'Garlic',
      'Ginger'
    ],
    instructions:
        'Cook chicken. Add vegetables. Add soy sauce and stir fry for 5 minutes.',
  ),

  Recipe(
    name: 'Chocolate Mug Cake',
    imagePath: 'assets/images/chocolatemugcake.jpg',
    ingredients: [
      'Flour',
      'Cocoa powder',
      'Sugar',
      'Milk',
      'Oil'
    ],
    instructions:
        'Mix ingredients in mug. Microwave for 60–90 seconds.',
  ),
];