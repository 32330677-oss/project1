
import 'package:flutter/material.dart';

import 'food_item.dart';

class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({super.key});

  @override
  _MealPlannerScreenState createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  num totalCalories = 0;
 bool useKilocalories = false;
  void calculateCalories() {
    num sum = 0;
    for (var item in foodList) {
      sum += item['cal'] * item['count'];
    }
    setState(() {
      totalCalories = sum;
    });
  }
String getDisplayCalories() {
  if (useKilocalories) {
    return (totalCalories / 1000).toStringAsFixed(2); 
  } else {
    return totalCalories.toString(); 
  }
}


String getCalorieUnit() {
  return useKilocalories ? "kcal" : "cal";

}
  void reset() {
    for (var item in foodList) {
      item['count'] = 0;
    }
    setState(() {
      totalCalories = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Plan Your Meal"),
      backgroundColor: Colors.deepOrange),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: foodList.length,
              itemBuilder: (ctx, i) =>
                  FoodItem(food: foodList[i], onChanged: () => setState(() {})),
            ),
          ),







  Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.deepOrange.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.fitness_center,
                color: Colors.deepOrange,
              ),
              SizedBox(width: 10),
              Text(
                "Show in kilocalories",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10),
              Checkbox(
                value: useKilocalories,
                onChanged: (bool? value) {
                  setState(() {
                    useKilocalories = value ?? false;
                  });
                },
                activeColor: Colors.deepOrange,
              ),
            ],
          ),
        ),









          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
                onPressed: calculateCalories,
                child: Text("Calculate Calories"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
                onPressed: reset,
                child: Text("Reset"),
              ),
            ],
          ),
          SizedBox(height: 10),

          Text("Total: ${getDisplayCalories()} ${getCalorieUnit()}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.deepOrange)),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
List<Map<String, dynamic>> foodList = [
  { "name": "Fruits & Vegetables", "cal": 52, "count": 0,"image":
  "https://plus.unsplash.com/premium_photo-1664302148512-ddea30cd2a92?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8ZnJ1aXRzJTIwYW5kJTIwdmVnZXRhYmxlfGVufDB8fDB8fHww" },
  { "name": "Meats & Chickens", "cal": 89, "count": 0,"image":
  "https://plus.unsplash.com/premium_photo-1724260604247-589515ec1246?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjl8fG1lYXRzJTIwJTI2JTIwY2hpY2tlbiUyMGdyb3VwfGVufDB8fDB8fHww" },
  { "name": "Diary products", "cal": 200, "count": 0 ,"image":
  "https://plus.unsplash.com/premium_photo-1663127123513-a11369f67c8c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWlsayUyMHByb2R1Y3RzfGVufDB8fDB8fHww"},
  { "name": "Cereals(starch)", "cal": 80, "count": 0,"image":
  "https://plus.unsplash.com/premium_photo-1733317211709-c6c6c13012f6?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YnJlYWQlMjBwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D" },
  { "name": "Oil & Fats", "cal": 300, "count": 0,"image":
  "https://media.istockphoto.com/id/1206682746/photo/pouring-extra-virgin-olive-oil-in-a-glass-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=O3qhyYvzGTBTikWGySIiNveiCqwxgwS3nQ9Hem2o_FU=" },
  { "name": "Candies & sugar", "cal": 200, "count": 0 ,"image":
  "https://images.unsplash.com/photo-1621939514649-280e2ee25f60?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fENhbmRpZXMlMjAlMjYlMjBjaG9jb2xhdGUlMjBwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D"},

];
