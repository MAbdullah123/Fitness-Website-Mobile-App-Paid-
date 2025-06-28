import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_gym/accessories.dart';
import 'package:flutter_application_gym/clothing.dart';
import 'package:flutter_application_gym/final_cart.dart';
import 'package:flutter_application_gym/shop.dart';
import 'package:flutter_application_gym/workout_equipment.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  late VideoPlayerController _controller;
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  final List<Map<String, String>> _slides = [
    {
      'image': 'assets/fit1.jpg',
      'text': 'Unleash Your Ultimate Fitness Potential',
    },
    {
      'image': 'assets/fit2.jpg',
      'text': 'Elevate Your Workout With Fitness Gear',
    },
    {'image': 'assets/fit3.jpg', 'text': 'Unlock Your Fitness Journey'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/fitness.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });

    _pageController = PageController(initialPage: _currentPage);
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      _currentPage = (_currentPage + 1) % _slides.length;
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Future<void> _launchFacebookLogin() async {
    final Uri url = Uri.parse('https://www.facebook.com/login');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchTwitterLogin() async {
    final Uri url = Uri.parse('https://twitter.com/login');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D5D9B),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black12,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _slides.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(_slides[index]['image']!),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(left: 20, bottom: 20),
                          child: Text(
                            _slides[index]['text']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                hintStyle: TextStyle(color: Colors.white70),
                                filled: true,
                                fillColor: Colors.white10,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 20,
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 12),
                          GestureDetector(
                            onTap: _launchFacebookLogin,
                            child: FaIcon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          SizedBox(width: 12),
                          GestureDetector(
                            onTap: _launchTwitterLogin,
                            child: FaIcon(
                              FontAwesomeIcons.twitter,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          Stack(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const final_cart(
                                        isFromBottomNav: false,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Consumer<CartProvider>(
                                  builder: (context, cartProvider, child) {
                                    int itemCount = cartProvider.items.length;
                                    return itemCount > 0
                                        ? Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF3DB2FF),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              itemCount.toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 48, 152, 222),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.verified, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Quality Product',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Amazing quality and affordable outdoor products',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Icon(Icons.local_shipping, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Free Shipping',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'We offer Free Shipping on all our products.',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Icon(Icons.email, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Email Us',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Have any questions about our products? Contact us',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Shop(
                              onTabSelected: (_) {
                                Navigator.pop(context);
                              },
                              isFromBottomNav: false,
                            ),
                          ),
                        );
                      },
                      child: const Text('Shop Now'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'WELCOME TO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'FITNESS FINESSE FUSION',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Quality Yet Affordable Fitness Gym Apparel and Fitness Gym Health Products',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bulletPoint('Great gear fuels your motivation.'),
                  bulletPoint('For beginners and pros alike.'),
                  bulletPoint('Quality products at fair prices.'),
                  bulletPoint('Fast shipping to your door.'),
                  bulletPoint('We deliver quality and support every step.'),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Stylish, Comfortable, and Affordable Fitness Gym Apparel',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bulletPoint('Stylish, affordable, and high-quality.'),
                  bulletPoint('For all fitness levels — men & women.'),
                  bulletPoint(
                    'Includes: activewear, shoes, and smart accessories.',
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Fitness Gym Health Products',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bulletPoint(
                    'Strength Training: Weight sets, resistance bands, grip strength trainers.',
                  ),
                  bulletPoint(
                    'Recovery & Flexibility: Yoga balls and yoga bands.',
                  ),
                  bulletPoint(
                    'Boxing & Cardio: Speed bags and heavy bags for intense workouts.',
                  ),
                  bulletPoint(
                    'Protection & Grip: Workout gloves and other essentials to support your performance.',
                  ),
                ],
              ),
              SizedBox(height: 8),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const workout_equipment(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 4, right: 4),
                  height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/equipment.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Workout Equipment',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 1),
                              blurRadius: 3,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const clothing()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
                  height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/gym_outfit.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Clothing',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 1),
                              blurRadius: 3,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const accessories(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
                  height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/gym_accessories.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Accessories',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 1),
                              blurRadius: 3,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  if (_controller.value.isInitialized)
                    Container(
                      height: 400,
                      width: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: VideoPlayer(_controller),
                    )
                  else
                    const SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 48, 152, 222),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: const [
                            SizedBox(width: 10),
                            Text(
                              'Sculpt Your Journey',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Fitness Finesse Fussion Gallery',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Shop(
                                  onTabSelected: (_) {
                                    Navigator.pop(context);
                                  },
                                  isFromBottomNav: false,
                                ),
                              ),
                            );
                          },
                          child: const Text('Shop All'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WHY SHOP WITH US',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 13),
                        Text(
                          'Choosing the right fitness gear is key to your healthier lifestyle. Here why we are your best choice:',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        bulletPoint('Expertly selected fitness products'),
                        bulletPoint('Gear to support your health journey'),
                        bulletPoint('Quality and value you can trust'),
                        SizedBox(height: 13),
                        Text(
                          'Gear Up for Greatness',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 8),
                        bulletPoint(
                          'Premium-grade products built with advanced fitness tech.',
                        ),
                        bulletPoint(
                          'Designed to boost performance and endurance.',
                        ),
                        bulletPoint(
                          'From equipment to apparel, every item is carefully crafted.',
                        ),
                        SizedBox(height: 13),
                        Text(
                          'Affordable Prices',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 8),
                        bulletPoint('Top-quality gear at fair prices'),
                        bulletPoint('Fitness for everyone — no overspending'),
                        bulletPoint('Great value across all product ranges'),
                        SizedBox(height: 13),
                        Text(
                          'Fast Shipping',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 8),
                        bulletPoint('Lightning-fast delivery to your doorstep'),
                        bulletPoint(
                          'No delays, so you stay on track with your fitness goals',
                        ),
                        bulletPoint(
                          'Efficiency first, every order, every time',
                        ),
                        SizedBox(height: 13),
                        Text(
                          'Great Customer Service',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 8),
                        bulletPoint('We have got your back!'),
                        bulletPoint(
                          'Friendly team ready to assist with any questions or issues.',
                        ),
                        bulletPoint(
                          'Quick help with products or orders—anytime you need.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 48, 152, 222),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 10),
                            Text(
                              'ESSENTIALS',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Featured Product',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset('assets/1.jpg', height: 100),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Ice Silk Summer Muscle Hoodie',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Text(
                                    '\$8.99',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset('assets/2.jpg', height: 100),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Shorts Loose Large Size Multi-Pocket',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    '\$53.99',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset('assets/3.jpg', height: 100),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Xshape Booty Lifting Leggings',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    '\$28.99',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 20, 27, 30),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '💬 Exceptional Customer Support',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 7),
                        bulletPoint('Your satisfaction is our top priority'),
                        bulletPoint('Dedicated support team available anytime'),
                        bulletPoint(
                          'Help with product inquiries or order issues',
                        ),
                        bulletPoint('Guidance at every step of your journey'),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                0,
                                171,
                                244,
                              ),
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Shop(
                                    onTabSelected: (_) {
                                      Navigator.pop(context);
                                    },
                                    isFromBottomNav: false,
                                  ),
                                ),
                              );
                            },
                            child: const Text('Shop All'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget bulletPoint(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• ",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
