
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
      sum += item['kcal'] * item['count'];
    }
    setState(() {
      totalCalories = sum;
    });
  }
String getDisplayCalories() {
  if (useKilocalories) {
    return (totalCalories / 1000).toStringAsFixed(2); // Convert to kcal
  } else {
    return totalCalories.toString(); // Keep as calories
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
  { "name": "Apple", "kcal": 52, "count": 0,"image":
  "https://images.unsplash.com/photo-1570913149827-d2ac84ab3f9a?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YXBwbGV8ZW58MHx8MHx8fDA%3D" },
  { "name": "Banana", "kcal": 89, "count": 0,"image":
  "https://media.istockphoto.com/id/1187668811/photo/fresh-bananas-on-wooden-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=yoA-t9KI57DflISTnpUdgOJM7yZapLPsT3u7aFqYymE=" },
  { "name": "Chicken", "kcal": 200, "count": 0 ,"image":
  "https://images.unsplash.com/photo-1606728035253-49e8a23146de?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Y2hpY2tlbnxlbnwwfHwwfHx8MA%3D%3D"},
  { "name": "Rice", "kcal": 80, "count": 0,"image":
  "https://images.unsplash.com/photo-1536304993881-ff6e9eefa2a6?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmljZXxlbnwwfHwwfHx8MA%3D%3D" },
  { "name": "Oil", "kcal": 1, "count": 0,"image":
  "https://media.istockphoto.com/id/1206682746/photo/pouring-extra-virgin-olive-oil-in-a-glass-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=O3qhyYvzGTBTikWGySIiNveiCqwxgwS3nQ9Hem2o_FU=" },
];
