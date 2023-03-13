import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/modules/other/model/banner_image_model.dart';

class OtherPage extends StatelessWidget {
  OtherPage({Key? key}) : super(key: key);

  late Future<List<BannerImageModel>> _bannerImagesFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('images/appbar_image.png'),
        ),
        title: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'First Text',
              style: TextStyle(
                  // fontSize: 16,
                  // fontWeight: FontWeight.w400,
                  ),
            ),
            Text(
              'Second Text',
              style: TextStyle(
                  // fontSize: 16,
                  // fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Perform search action
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Perform more actions
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.blueAccent),
            //width: MediaQuery.of(context).size.width,
            height: 200,
            child: FutureBuilder<List<BannerImageModel>>(
              future: getBannerImage(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<BannerImageModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  List<BannerImageModel> bannerImages = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bannerImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      var image = bannerImages[index];
                      return ListTile(
                        title: Text(image.link),
                        leading: Image.asset(image.imagePath),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<BannerImageModel>> getBannerImage() async {
    List<BannerImageModel> _imageList = [
      BannerImageModel('Image 1', 'images/banner_image1.png'),
      BannerImageModel('Image 2', 'images/banner_image1.png'),
      BannerImageModel('Image 3', 'images/banner_image1.png'),
    ];
    return _imageList;
  }
}
