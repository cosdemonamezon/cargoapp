import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int activeStep = 0;
  double value = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Status'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Existing sections
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'นำส่งพัสดุสำเร็จ',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'พัสดุถูกนำส่งเมื่อวันที่',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '12 ก.ค. 2024',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'จัดส่งจากไทยโดย แบบธรรมดา',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivered on time',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'We are pleased to inform you that your parcel arrived on time. We look forward to your next purchase.',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'การจัดส่งของเราเป็นอย่างไรบ้าง?',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  RatingStars(
                    value: value,
                    onValueChanged: (v) {
                      setState(() {
                        value = v;
                      });
                    },
                    starSize: 24.0,
                    starBuilder: (index, _) => Icon(
                      index < value ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/person.png'),
                      radius: 24.0,
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'พนักงานจัดส่ง Aphichat Khambai',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'จัดส่งโดย: LEX TH',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Phone: 0632234731',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'หมายเลขติดตามพัสดุ LEXPU0366821127',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ผู้รับ:ใส่สกรีหน้าบ้าน',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'ปากซอยอ่อนนุชกรุงเทพ 89 แยก51, บ้านเลขที่ 1 ปากซอยอ่อนนุช 89 ซอยหมู่บ้าน, สวนหลวง / Suan Luang, 10250, แขวงสวนหลวง / Suan Luang, กรุงเทพมหานคร / Bangkok',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),

              // New section for delivery timeline
              Text(
                'การจัดส่งสำเร็จ',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTimelineItem(
                        '12 ก.ค.', '13:51', 'การจัดส่งสำเร็จ', Colors.grey),
                    buildTimelineItem(
                        '12 ก.ค.', '13:22', 'พัสดุใกล้ถึงแล้ว!', Colors.grey),
                    buildTimelineItem('12 ก.ค.', '08:09',
                        'เจ้าหน้าที่กำลังจัดส่งพัสดุ', Colors.grey),
                    buildTimelineItem('12 ก.ค.', '08:07',
                        'พัสดุออกจากสาขาปลายทางแล้ว', Colors.grey),
                    buildTimelineItem('12 ก.ค.', '02:47',
                        'พัสดุถึงสาขาปลายทางแล้ว', Colors.blue),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'หมายเลขคำสั่งซื้อ # 882396423854628',
                style: TextStyle(fontSize: 16.0, color: Colors.blue),
              ),
              EasyStepper(
                lineStyle: const LineStyle(
                  lineType: LineType.normal,
                ),
                activeStep: activeStep,
                direction: Axis.vertical,
                unreachedStepIconColor: Colors.white,
                unreachedStepBorderColor: Colors.black54,
                finishedStepBackgroundColor: Colors.deepPurple,
                unreachedStepBackgroundColor: Colors.deepOrange,
                showTitle: true,
                onStepReached: (index) => setState(() => activeStep = index),
                steps: const [
                  EasyStep(
                    icon: Icon(CupertinoIcons.cart),
                    title: 'Cart',
                    activeIcon: Icon(CupertinoIcons.cart),
                    lineText: 'Cart Line',
                  ),
                  EasyStep(
                    icon: Icon(Icons.filter_center_focus_sharp),
                    activeIcon: Icon(Icons.filter_center_focus_sharp),
                    title: 'Checkout',
                    lineText: 'Review your order',
                  ),
                  EasyStep(
                    icon: Icon(Icons.money),
                    activeIcon: Icon(Icons.money),
                    title: 'Payment',
                  ),
                  EasyStep(
                    icon: Icon(Icons.local_shipping_outlined),
                    activeIcon: Icon(Icons.local_shipping_outlined),
                    title: 'Shipping',
                  ),
                  EasyStep(
                    icon: Icon(Icons.check_circle_outline),
                    activeIcon: Icon(Icons.check_circle_outline),
                    title: 'Finish',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimelineItem(
      String date, String time, String description, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(date, style: TextStyle(color: color)),
              Text(time, style: TextStyle(color: color)),
            ],
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.check_circle, color: color),
                  SizedBox(width: 8.0),
                  Text(description, style: TextStyle(color: color)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  
}
