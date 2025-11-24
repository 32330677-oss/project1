import 'package:flutter/material.dart';

class FoodItem extends StatefulWidget {
  final Map<String, dynamic> food;
  final Function onChanged;

  const FoodItem({super.key, required this.food, required this.onChanged});

  @override
  _FoodItemState createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
    String getItemCaloriesDisplay() {
    final kcal = widget.food["kcal"];
    return "$kcal cal";
  }
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape:
      RoundedRectangleBorder(borderRadius:
      BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.food["image"],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
            ),
            title: Text(
              widget.food["name"],
              style: TextStyle(fontWeight:
              FontWeight.bold, fontSize: 18),
            ),
           subtitle: Text(getItemCaloriesDisplay()), 
                trailing: SizedBox(
                width: 120,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    IconButton(
                    onPressed: () {
                if (widget.food["count"] > 0) {
                setState(() =>
                widget.food["count"]--);
                widget.onChanged();
                }
                },
                icon: Icon(Icons.remove, color:
                Colors.red),
                ),
                Text(
                    widget.food["count"].toString(),
                    style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold),
                ),
                    IconButton(
                      onPressed: () {
                        setState(() => widget.food["count"]++);
                        widget.onChanged();
                      },
                      icon: Icon(Icons.add, color: Colors.green),
                    ),
        ],
      ),
    ),
    ),
      ),
    );
  }
}
