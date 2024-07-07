import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Map<String, dynamic>> category = [
    {
      "imageUrl": "https://thumbs.dreamstime.com/b/large-group-african-safari-animals-wildlife-conservation-concept-174172993.jpg",
      "animalCategory": "Wildlife"
    },
    {
      "imageUrl": "https://t3.ftcdn.net/jpg/02/52/38/80/360_F_252388016_KjPnB9vglSCuUJAumCDNbmMzGdzPAucK.jpg",
      "animalCategory": "Foods"
    },
    {
      "imageUrl": "https://images.pexels.com/photos/534164/pexels-photo-534164.jpeg?auto=compress&cs=tinysrgb&w=600",
      "animalCategory": "Nature"
    },
    {
      "imageUrl": "https://images.pexels.com/photos/773471/pexels-photo-773471.jpeg?auto=compress&cs=tinysrgb&w=600",
      "animalCategory": "City"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            category[index]['imageUrl'],
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 160,
                          top: 80,
                          child: Text(
                            category[index]['animalCategory'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Category(),
  ));
}
