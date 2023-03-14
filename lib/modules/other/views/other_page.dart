import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/values/app_colors.dart';
import 'package:flutter_demo/core/widget/custombox_container.dart';
import 'package:flutter_demo/modules/other/model/banner_image_model.dart';

class OtherPage extends StatelessWidget {
  OtherPage({Key? key}) : super(key: key);

  late Future<List<BannerImageModel>> _bannerImagesFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('images/appbar_image.png'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'John Dow',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '01521300500',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
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
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Perform more actions
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //width: MediaQuery.of(context).size.width,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      height: 480.0,
                      width: 360.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/banner_image1.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 480.0,
                      width: 360.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/banner_image1.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 240.0,
                      width: 360.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/banner_image1.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Information Service',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kCustomInfoColor)),
            ),
            Row(
              children: const [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomBoxContainer(
                        text: "Information",
                        imagePath: "images/book_open_01.svg",
                        bgColor: AppColors.kCustomInfoBackgroundColor,
                        solidColor: AppColors.kCustomInfoColor,
                        outlineStrokeWidth: .1),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomBoxContainer(
                        text: "Fq",
                        imagePath: "images/book_open_01.svg",
                        bgColor: AppColors.kCustomInfoBackgroundColor,
                        solidColor: AppColors.kCustomInfoColor,
                        outlineStrokeWidth: .1),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomBoxContainer(
                        text: "Weather",
                        imagePath: "images/book_open_01.svg",
                        bgColor: AppColors.kCustomInfoBackgroundColor,
                        solidColor: AppColors.kCustomInfoColor,
                        outlineStrokeWidth: .1),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomBoxContainer(
                        text: "Solution",
                        imagePath: "images/book_open_01.svg",
                        bgColor: AppColors.kCustomInfoBackgroundColor,
                        solidColor: AppColors.kCustomInfoColor,
                        outlineStrokeWidth: .1),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Buy',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kCustomBuyColor)),
            ),
            Row(
              children: const [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomBoxContainer(
                        text: "Buy product",
                        imagePath: "images/coins_stacked_02.svg",
                        bgColor: AppColors.kCustomBuyBackgroundColor,
                        solidColor: AppColors.kCustomBuyColor,
                        outlineStrokeWidth: .1),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomBoxContainer(
                        text: "Buy Fish",
                        imagePath: "images/coins_stacked_02.svg",
                        bgColor: AppColors.kCustomBuyBackgroundColor,
                        solidColor: AppColors.kCustomBuyColor,
                        outlineStrokeWidth: .1),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomBoxContainer(
                  text: "Buy Fish",
                  imagePath: "images/coins_stacked_02.svg",
                  bgColor: AppColors.kCustomBuyBackgroundColor,
                  solidColor: AppColors.kCustomBuyColor,
                  outlineStrokeWidth: .1),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Another Information',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kCustomColor)),
            ),
            Row(
              children: const [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomBoxContainer(
                        text: "Market Director",
                        imagePath: "images/users_01.svg",
                        bgColor: AppColors.kCustomBackgroundColor,
                        solidColor: AppColors.kCustomColor,
                        outlineStrokeWidth: .1),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomBoxContainer(
                        text: "Fish Info",
                        imagePath: "images/users_01.svg",
                        bgColor: AppColors.kCustomBackgroundColor,
                        solidColor: AppColors.kCustomColor,
                        outlineStrokeWidth: .1),
                  ),
                ),
              ],
            ),
          ],
        ),
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

// FutureBuilder<List<BannerImageModel>>(
//               future: getBannerImage(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<List<BannerImageModel>> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done &&
//                     snapshot.hasData) {
//                   List<BannerImageModel> bannerImages = snapshot.data!;
//                   return ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: bannerImages.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       var image = bannerImages[index];
//                       return ListTile(
//                         title: Text(image.link),
//                         leading: Image.asset(image.imagePath),
//                       );
//                     },
//                   );
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             ),