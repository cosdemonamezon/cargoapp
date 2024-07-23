import 'package:flutter/material.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

  const List<String> sampleImages = [
    'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg',
    'https://img.freepik.com/free-photo/shapely-woman-vintage-dress-touching-her-glasses-outdoor-shot-interested-relaxed-girl-brown-outfit_197531-11308.jpg',
    'https://img.freepik.com/premium-photo/cheerful-lady-brown-outfit-looking-around-outdoor-portrait-fashionable-caucasian-model-with-short-wavy-hairstyle_197531-25791.jpg',
  ];

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 1;

    return Scaffold(
      body: ListView(
        children: [
          buildHeaderSection(itemWidth, itemHeight),
          buildPromotionsSection(),
        ],
      ),
    );
  }
}

Widget buildHeaderSection(double itemWidth, double itemHeight) {
  return Container(
    width: double.infinity,
    height: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
      ),
      color: Color.fromARGB(255, 136, 245, 168),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('สวัสดี!!!',
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 0, 0, 0))),
              Spacer(),
              Icon(Icons.favorite, color: Colors.white),
            ],
          ),
        ),
        // Align(
        //   alignment: Alignment.centerLeft,
        //   child: TextButton(
        //     onPressed: () {},
        //     style: TextButton.styleFrom(
        //       backgroundColor: Colors.white,
        //       foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        //     ),
        //     child: Text('btn'),
        //   ),
        // ),
        SizedBox(height: 1),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'ค้นหาเลขพัสดุ',
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: (itemWidth / itemHeight),
              children: [
                buildMainButton('ค้นหาสินค้า'),
                buildMainButton('รายการขนส่ง'),
                buildMainButton('นำเข้าแบบถูกต้อง'),
                buildMainButton('ฝากชำระสินค้า'),
                buildMainButton('ทัวร์ส่วนตัว'),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildMainButton(String title) {
  return Card(
    child: InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}

Widget buildPromotionsSection() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          'https://corporate.lotuss.com/images/2024/04/Website2000x1125-pix-01_0.jpg',
          width: double.infinity,
          height: 150,
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Image.network(
      //     'https://cdn.techinasia.com/wp-content/uploads/2013/08/lazada-marketplace-720x246.jpg',
      //     height: 150,
      //   ),
      // ),
      FanCarouselImageSlider.sliderType1(
        imagesLink: sampleImages,
        isAssets: false,
        autoPlay: false,
        sliderHeight: 200,
        showIndicator: true,
      ),
      const SizedBox(
        height: 30,
      ),
    ],
  );
}
