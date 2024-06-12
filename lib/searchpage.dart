// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:wallpaperapp/searchpage.dart';

// Widget wallpaper (List<PhotoModel> listphoto,BuildContext context){
//   return Container(
//     padding: EdgeInsets.all(16),
//     child: GridView.count(
// crossAxisCount: 2,
// childAspectRatio: 0.6,
// mainAxisSpacing: 6.0,
// crossAxisSpacing: 6.0,
// children:listphoto.map((PhotoModel photoModel) {
//   return GridTile(child: 
//   Hero(tag: photoModel.src!.portrait!, child:Container(
//     child: CachedNetworkImage(imageUrl: photoModel.src.portrait!),
//   ) )
//   )
// })
//     ),
//   )
// }


// class PhotoModel{
//   String? url;
//   String? src;

//   PhotoModel({this.url,this.src});
// }

// class SrcModel{
//    String? Potratit;
//   String? Large;
//   String? Landscape;
//   String? Medium;

//    SrcModel({this.Landscape, this.Large,this.Medium,this.Potratit});
// }

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   TextEditingController serchInput=new TextEditingController();

// List<PhotoModel> photos=[];

// getSearchWallpaper(String searchquery)async{
//   await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$searchquery&per_page=1"),headers:{
//     'Authorization':'vpjrnjdq6xkzYQSexQN2rHHcociXbz6PJhfukh2m8YBbVdaj34GRzeX9',

//   } ).then((value) {
//   Map<String,dynamic> jsonData=jsonDecode(value.body);
//   jsonData["photos"].forEach((element)){
//     PhotoModel photomodel=new PhotoModel();
//     photomodel=PhotoModel.fromMap(element);
//     photos.add(photomodel);
//   };
//   setState(() {
    
//   });
//   });

// }







//   Future<List<User>> fetchimages() async{
//  final String apikey='vpjrnjdq6xkzYQSexQN2rHHcociXbz6PJhfukh2m8YBbVdaj34GRzeX9';
//   final response=await http.get(Uri.parse("https://api.pexels.com/v1/search?query=nature&per_page=1"),
//   headers: {
//     'Content-Type':'application/json',
//     'Authorization':'Bearer $apikey'
//   }
//   );
//     if (response.statusCode == 200) {
//     List jsonResponse = json.decode(response.body);
//     return jsonResponse.map((user) => User.fromJson(user)).toList();
//   } else {
//     throw Exception('Failed to load users');
//   }
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             TextField(
//               controller:serchInput ,
              
//               decoration: InputDecoration(
//                 suffixIcon: GestureDetector(onTap: () {
//                   getSearchWallpaper(serchInput.text);
//                 },child: Icon(Icons.search)),
//                 hintText: "Search diffrent wallpaper",
//                 border: OutlineInputBorder()
//               ),
//             )
//           ],
//         ),
//       )
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

// Model class for Photo
class PhotoModel {
  String? url;
  SrcModel? src;

  PhotoModel({this.url, this.src});

  factory PhotoModel.fromMap(Map<String, dynamic> jsonData) {
    return PhotoModel(
      url: jsonData["url"],
      src: SrcModel.fromMap(jsonData["src"]),
    );
  }
}

// Model class for Src
class SrcModel {
  String? portrait;
  String? large;
  String? landscape;
  String? medium;

  SrcModel({this.portrait, this.large, this.landscape, this.medium});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
      portrait: jsonData["portrait"],
      large: jsonData["large"],
      landscape: jsonData["landscape"],
      medium: jsonData["medium"],
    );
  }
}

// Function to build the wallpaper grid
Widget wallpaper(List<PhotoModel> listphoto, BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16),
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: listphoto.map((PhotoModel photoModel) {
        return GridTile(
          child: Hero(
            tag: photoModel.src!.portrait!,
            child: Container(
              child: CachedNetworkImage(imageUrl: photoModel.src!.portrait!),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

// Search Page
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchInput = TextEditingController();
  List<PhotoModel> photos = [];

  getSearchWallpaper(String searchQuery) async {
      setState(() {
      photos.clear(); // Clear the existing photos list
    });
    await http.get(
      Uri.parse("https://api.pexels.com/v1/search?query=$searchQuery&per_page=15"),
      headers: {
        'Authorization': 'vpjrnjdq6xkzYQSexQN2rHHcociXbz6PJhfukh2m8YBbVdaj34GRzeX9',
      },
    ).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        PhotoModel photoModel = PhotoModel.fromMap(element);
        photos.add(photoModel);
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: searchInput,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      getSearchWallpaper(searchInput.text);
                    });
                  },
                  child: Icon(Icons.search),
                ),
                hintText: "Search different wallpaper",
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
              child: wallpaper(photos, context),
            ),
          ],
        ),
      ),
    );
  }
}
