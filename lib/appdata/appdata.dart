import 'package:flutter/animation.dart';

class AppData {
  static List<Map<String, dynamic>?> cardData = [];
  static List<Map<String, dynamic>?> onGoingData = [];
  static List<Map<String, dynamic>?> staffData = [];

  getCardData() {
    cardData.clear();
    cardData.add({
      'value': 1000,
      'title': 'Total tasks',
      'color': const Color(0xFF3BB4CE)
    });
    cardData.add(
        {'value': 450, 'title': 'Pending', 'color': const Color(0xFFFF983A)});
    cardData.add(
        {'value': 200, 'title': 'Overdue', 'color': const Color(0xFFFF5367)});
  }

  getOnGoingData() {
    onGoingData.clear();
    onGoingData.add({
      'title': 'Product demo with Akhil krishna',
      'date': '10:30 am   |   Thu, June 21',
      'progress': 'Design',
      'color': const Color(0xFF039381)
    });
    onGoingData.add({
      'title': 'Product demo with Muhammad',
      'date': '10:30 am   |   Thu, June 21',
      'progress': 'Development',
      'color': const Color(0xFFE16C00)
    });
    onGoingData.add({
      'title': 'Product demo with Akhil krishna',
      'date': '10:30 am   |   Thu, June 21',
      'progress': 'Bug',
      'color': const Color(0xFFFF5367)
    });
    onGoingData.add({
      'title': 'Product demo with Muhammad',
      'date': '10:30 am   |   Thu, June 21',
      'progress': 'Operations',
      'color': const Color(0xFFE16C00)
    });
    onGoingData.add({
      'title': 'Product demo with Akhil krishna',
      'date': '10:30 am   |   Thu, June 21',
      'progress': 'Sales',
      'color': const Color(0xFF039381)
    });

    //sergvrsybrybdunjyhbhkshiyhbybbesabyeyb

    onGoingData.add({
      'title': 'Product demo with Akhil krishna',
      'date': '10:30 am   |   Thu, June 21',
      'progress': 'Design',
      'color': const Color(0xFF039381)
    });
    onGoingData.add({
      'title': 'Product demo with Muhammad',
      'date': '10:30 am   |   Thu, June 21',
      'progress': 'Development',
      'color': const Color(0xFFE16C00)
    });
    onGoingData.add({
      'title': 'Product demo with Akhil krishna',
      'date': '10:30 am   |   Thu, June 21',
      'progress': 'Bug',
      'color': const Color(0xFFFF5367)
    });
    onGoingData.add({
      'title': 'Product demo with Muhammad',
      'date': '10:30 am   |   Thu, June 21',
      'progress': 'Operations',
      'color': const Color(0xFFE16C00)
    });
    onGoingData.add({
      'title': 'Product demo with Akhil krishna',
      'date': '10:30 am   |   Thu, June 21',
      'progress': 'Sales',
      'color': const Color(0xFF039381)
    });
  }

  getStaffData() {
    staffData.clear();
    staffData.add({
      'image': 'assets/image_1.png',
      'name': 'Sharun das',
      'job': 'UI Designer',
      'task': '15/25',
      'color': const Color(0xFF039381),
      'code': 'Sd'
    });
    staffData.add({
      'image': '',
      'name': 'Vyshna Kalerikkal',
      'job': 'Flutter developer',
      'task': '12/20',
      'color': const Color(0xFF6633FF),
      'code': 'VK'
    });
    staffData.add({
      'image': '',
      'name': 'Shyam Kumar',
      'job': 'Laravel developer',
      'task': '14/22',
      'color': const Color(0xFF01589F),
      'code': 'SK'
    });
    staffData.add({
      'image': 'assets/image_2.png',
      'name': 'Dhaval',
      'job': 'Flutter developer',
      'task': '15/25',
      'color': const Color(0xFF039381),
      'code': 'D'
    });
    staffData.add({
      'image': 'assets/image_3.png',
      'name': 'Shyam Kumar',
      'job': 'QA',
      'task': '12/20',
      'color': const Color(0xFF039381),
      'code': 'SK'
    });
    staffData.add({
      'image': 'assets/image_2.png',
      'name': 'Dhaval',
      'job': 'Flutter developer',
      'task': '15/25',
      'color': const Color(0xFF039381),
      'code': 'D'
    });
    staffData.add({
      'image': 'assets/image_3.png',
      'name': 'Shyam Kumar',
      'job': 'QA',
      'task': '12/20',
      'color': const Color(0xFF039381),
      'code': 'SK'
    });
    staffData.add({
      'image': 'assets/image_2.png',
      'name': 'Dhaval',
      'job': 'Flutter developer',
      'task': '15/25',
      'color': const Color(0xFF039381),
      'code': 'D'
    });
    //awrawtaetvsretyberyberydnuseunseunssss

    staffData.add({
      'image': 'assets/image_1.png',
      'name': 'Sharun das',
      'job': 'UI Designer',
      'task': '15/25',
      'color': const Color(0xFF039381),
      'code': 'Sd'
    });
    staffData.add({
      'image': '',
      'name': 'Vyshna Kalerikkal',
      'job': 'Flutter developer',
      'task': '12/20',
      'color': const Color(0xFF6633FF),
      'code': 'VK'
    });
    staffData.add({
      'image': '',
      'name': 'Shyam Kumar',
      'job': 'Laravel developer',
      'task': '14/22',
      'color': const Color(0xFF01589F),
      'code': 'SK'
    });
    staffData.add({
      'image': 'assets/image_2.png',
      'name': 'Dhaval',
      'job': 'Flutter developer',
      'task': '15/25',
      'color': const Color(0xFF039381),
      'code': 'D'
    });
    staffData.add({
      'image': 'assets/image_3.png',
      'name': 'Shyam Kumar',
      'job': 'QA',
      'task': '12/20',
      'color': const Color(0xFF039381),
      'code': 'SK'
    });
    staffData.add({
      'image': 'assets/image_2.png',
      'name': 'Dhaval',
      'job': 'Flutter developer',
      'task': '15/25',
      'color': const Color(0xFF039381),
      'code': 'D'
    });
    staffData.add({
      'image': 'assets/image_3.png',
      'name': 'Shyam Kumar',
      'job': 'QA',
      'task': '12/20',
      'color': const Color(0xFF039381),
      'code': 'SK'
    });
    staffData.add({
      'image': 'assets/image_2.png',
      'name': 'Dhaval',
      'job': 'Flutter developer',
      'task': '15/25',
      'color': const Color(0xFF039381),
      'code': 'D'
    });
  }
}
