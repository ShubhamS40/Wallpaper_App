import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List Wallpaperimage =[
    "https://images.pexels.com/photos/20568493/pexels-photo-20568493/free-photo-of-green-maple-leaf.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/20564358/pexels-photo-20564358/free-photo-of-back-view-of-a-woman-at-lake.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(90),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Image.network(
                        "https://images.pexels.com/photos/20568493/pexels-photo-20568493/free-photo-of-green-maple-leaf.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        width: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    "Vlogify",
                    style: TextStyle(fontSize: 28),
                  )
                ],
              ),
              Container(
                child: CarouselSlider.builder(
                    itemCount: Wallpaperimage.length,
                    itemBuilder:(context, index, realIndex) {
                      final res=Wallpaperimage[index];
                      return buildimage(res, index);
                    },
                    options:CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height
                    ) 
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
 Widget buildimage(String url,int index)=> Container(
      height: 90,
      child: Image.network(url),
    );
  
}
