import 'package:flutter/material.dart';
import 'meal_planner_screen.dart';
void main() {
  runApp(const MealPlanner());
}

class MealPlanner extends StatelessWidget {
  const MealPlanner({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Planner(Calories tracker)',
      debugShowCheckedModeBanner: false,
     home: MealPlannerScreen() ,

    );
  }
}



