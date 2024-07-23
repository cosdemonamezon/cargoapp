import 'package:flutter/material.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<String> sampleImages = [
    'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg',
    'https://img.freepik.com/free-photo/shapely-woman-vintage-dress-touching-her-glasses-outdoor-shot-interested-relaxed-girl-brown-outfit_197531-11308.jpg',
    'https://img.freepik.com/premium-photo/cheerful-lady-brown-outfit-looking-around-outdoor-portrait-fashionable-caucasian-model-with-short-wavy-hairstyle_197531-25791.jpg',
  ];
  // List of image paths
  final List<String> imagePaths = [
    'assets/images/shirt.jpg',
    'assets/images/shirt2.jpg',
    'assets/images/shirt3.jpg',
    'assets/images/shirt4.jpg',
    'assets/images/shirt5.jpg',
  ];

  void _onItemPressed(int index) {
    print('Item $index pressed');
    // Add your logic here, such as navigating to a new page or showing a dialog.
  }

  void _onSearchPressed() {
    print('Search icon pressed');
    // Add your search logic here
  }

  void _onCameraPressed() {
    print('Camera icon pressed');
    // Add your camera logic here
  }

  void _onIconPressed(String iconName) {
    print('$iconName icon pressed');
    // Add your logic here, such as navigating to a new page or showing a dialog.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: TextField(
      //     decoration: InputDecoration(
      //       hintText: '',
      //       prefixIcon: Icon(Icons.search),
      //       suffix: Row(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           InkWell(
      //             onTap: _onCameraPressed,
      //             child: Icon(Icons.camera_alt),
      //           ),
      //           SizedBox(width: 10),
      //           InkWell(
      //             onTap: _onSearchPressed,
      //             child: Icon(Icons.search),
      //           ),
      //         ],
      //       ),
      //       border: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(20),
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'ค้นหา',
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: _onCameraPressed,
                      child: Icon(Icons.camera_alt),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: _onSearchPressed,
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 255, 255, 255),
              height: 300,
              child: PageView(
                children: [
                  FanCarouselImageSlider.sliderType1(
                    imagesLink: sampleImages,
                    isAssets: false,
                    autoPlay: false,
                    sliderHeight: 250,
                    showIndicator: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () => _onIconPressed('Store'),
                      child: Column(
                        children: [
                          Icon(Icons.store, color: Colors.orange),
                          Text('Store'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => _onIconPressed('Favorite'),
                      child: Column(
                        children: [
                          Icon(Icons.favorite, color: Colors.purple),
                          Text('Favorite'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => _onIconPressed('Offer'),
                      child: Column(
                        children: [
                          Icon(Icons.local_offer, color: Colors.green),
                          Text('Offer'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => _onIconPressed('Flash'),
                      child: Column(
                        children: [
                          Icon(Icons.flash_on, color: Colors.red),
                          Text('Flash'),
                        ],
                      ),
                    ),
                  ]),
            ),
            Container(
              color: Colors.pink[50],
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('สิทธิประโยชน์ลูกค้าใหม่',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('฿40'),
                          Text('ซื้อขั้นต่ำ ฿899'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('คูปองส่งฟรี'),
                          Text('ใช้ได้ถึง 24 ก.ค. 11:59PM'),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          child: Text('เก็บโค้ดทั้งหมด'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => _onItemPressed(index),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset('assets/images/shirt.jpg'),
                          ),
                          SizedBox(height: 5),
                          Text('฿89.00', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 8.0),
                    color: Color.fromARGB(255, 236, 182, 182),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imagePaths[index],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name $index',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Subtitle $index',
                                    style: TextStyle(color: Colors.red)),
                                SizedBox(height: 5),
                                Text('Description $index',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.orange, size: 16),
                                    SizedBox(width: 5),
                                    Text('Rating $index'),
                                    SizedBox(width: 10),
                                    Text('Reviews $index'),
                                  ],
                                ),
                              ],
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
