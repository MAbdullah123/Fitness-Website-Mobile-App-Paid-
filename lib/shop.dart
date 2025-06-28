import 'package:flutter/material.dart';
import 'package:flutter_application_gym/accessories.dart';
import 'package:flutter_application_gym/cart_bag_pack.dart';
import 'package:flutter_application_gym/cart_benchpress.dart';
import 'package:flutter_application_gym/cart_body_shaper.dart';
import 'package:flutter_application_gym/cart_dumbbells20Kg.dart';
import 'package:flutter_application_gym/cart_dumbbells5kg.dart';
import 'package:flutter_application_gym/cart_weight.dart';
import 'package:flutter_application_gym/cart_finger_gloves.dart';
import 'package:flutter_application_gym/cart_fitness_cycle.dart';
import 'package:flutter_application_gym/cart_fitted_short.dart';
import 'package:flutter_application_gym/cart_gym_tshirt.dart';
import 'package:flutter_application_gym/cart_legs_strenghtner.dart';
import 'package:flutter_application_gym/cart_roller.dart';
import 'package:flutter_application_gym/cart_trouser.dart';
import 'package:flutter_application_gym/cart_wrist_band.dart';
import 'package:flutter_application_gym/clothing.dart';
import 'package:flutter_application_gym/workout_equipment.dart';

class Product {
  final String imagePath;
  final String title;
  final double price;
  final VoidCallback onTap;

  Product({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.onTap,
  });
}

class Shop extends StatefulWidget {
  const Shop({
    super.key,
    required this.onTabSelected,
    required isFromBottomNav,
  });
  final void Function(int) onTabSelected;

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  double _price = 500.0;
  late List<Product> _products;
  late List<Product> _originalProducts;
  String _selectedSortOption = 'Default Sorting';

  final List<String> _sortOptions = [
    'Default Sorting',
    'Price: Low to High',
    'Price: High to Low',
    'Newest First',
  ];

  @override
  void initState() {
    super.initState();
    _initializeProducts();
  }

  void _initializeProducts() {
    _products = [
      Product(
        imagePath: 'assets/22.jpg',
        title: 'Fitted Shorts',
        price: 20.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_fitted_short()),
          );
        },
      ),
      Product(
        imagePath: 'assets/9.jpg',
        title: 'Dumbbells',
        price: 50.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_weight()),
          );
        },
      ),
      Product(
        imagePath: 'assets/49.jpg',
        title: 'Fitness Cycle',
        price: 340.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_fitness_cycle()),
          );
        },
      ),
      Product(
        imagePath: 'assets/50.jpg',
        title: 'Legs Strenghtner',
        price: 23.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const cart_legs_strenghtner(),
            ),
          );
        },
      ),
      Product(
        imagePath: 'assets/23.jpg',
        title: 'Body Shaper',
        price: 30.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_body_shaper()),
          );
        },
      ),
      Product(
        imagePath: 'assets/24.jpg',
        title: 'Gym T-shirt',
        price: 25.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_gym_tshirt()),
          );
        },
      ),
      Product(
        imagePath: 'assets/25.jpg',
        title: 'Trouser',
        price: 35.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_trouser()),
          );
        },
      ),
      Product(
        imagePath: 'assets/38.jpg',
        title: 'Bag Pack',
        price: 40.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_bag_pack()),
          );
        },
      ),
      Product(
        imagePath: 'assets/39.jpg',
        title: 'Wrist Bands',
        price: 13.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_wrist_band()),
          );
        },
      ),
      Product(
        imagePath: 'assets/40.jpg',
        title: 'Roller',
        price: 22.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_roller()),
          );
        },
      ),
      Product(
        imagePath: 'assets/41.jpg',
        title: 'Finger Covering Gloves',
        price: 20.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_finger_gloves()),
          );
        },
      ),
      Product(
        imagePath: 'assets/8.jpg',
        title: 'Inclined Bench',
        price: 70.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_benchpress()),
          );
        },
      ),
      Product(
        imagePath: 'assets/10.jpg',
        title: 'Dumbbels 20Kg',
        price: 35.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const cart_gym_dumbbellsKg(),
            ),
          );
        },
      ),
      Product(
        imagePath: 'assets/11.jpg',
        title: 'Dumbbels 5Kg',
        price: 20.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_dumbbells_Kg()),
          );
        },
      ),
    ];
    _originalProducts = List.from(_products);
  }

  void _onSortChanged(String? newValue) {
    if (newValue != null) {
      setState(() {
        _selectedSortOption = newValue;
        switch (_selectedSortOption) {
          case 'Price: Low to High':
            _products.sort((a, b) => a.price.compareTo(b.price));
            break;
          case 'Price: High to Low':
            _products.sort((a, b) => b.price.compareTo(a.price));
            break;
          case 'Newest First':
            _products = List.from(_products.reversed);
            break;
          default:
            _products = List.from(_originalProducts);
            break;
        }
      });
      print('Sorting by: $_selectedSortOption');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 6, 99, 145),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 40),
            const Text(
              'Search Products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: const TextStyle(
                  color: Colors.white70,
                  fontFamily: 'Poppins',
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.black.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Product Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 10),
            _buildCategoryTile(
              icon: Icons.watch,
              title: 'Accessories',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const accessories()),
              ),
            ),
            _buildCategoryTile(
              icon: Icons.checkroom,
              title: 'Clothing',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const clothing()),
              ),
            ),
            _buildCategoryTile(
              icon: Icons.fitness_center,
              title: 'Workout Equipment',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const workout_equipment(),
                ),
              ),
            ),
            const Divider(height: 30, thickness: 1, color: Colors.white24),
            const Text(
              'Filter by Price',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Min: \$0',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Max: \$500',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Slider(
              value: 500 - _price,
              min: 0,
              max: 500,
              divisions: 100,
              label: '\$${_price.round()}',
              onChanged: (value) {
                setState(() {
                  _price = 500 - value;
                });
              },
              activeColor: Colors.black,
              inactiveColor: Colors.white24,
            ),
            Text(
              'Selected Price: \$${_price.toStringAsFixed(0)}',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Filtered under \$${_price.toStringAsFixed(0)}',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.filter_alt),
              label: const Text('Apply Filter'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            widget.onTabSelected(0);
          },
        ),
        backgroundColor: Color(0xFF8CAFC2),
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              decoration: BoxDecoration(
                color: const Color(0xFF1A2E35),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'HOME\nYOUR ONE-STOP SHOP FOR WORKOUT HEALTH PRODUCTS, GYM GEAR & FITNESS APPAREL',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'OUR\nPRODUCTS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      height: 1.2,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionHeader(
              'Your One-Stop Shop for Workout Health Products, Gym Gear & Fitness Apparel',
            ),
            const SizedBox(height: 3),
            _buildSectionText(
              '• Feel strong\n'
              '• Look great\n'
              '• Stay motivated on your fitness journey',
            ),
            const SizedBox(height: 8),
            _buildSectionHeader(
              'Workout Health Products That Help You Perform at Your Best',
            ),
            const SizedBox(height: 0),
            _buildSectionText('''
• Wide variety of workout equipment  
• Premium apparel and accessories 
• Nutrition supplements for all goals  
• Expert-curated fitness products  
• Stylish and functional gear  
'''),
            const SizedBox(height: 0),
            _buildSectionHeader(
              'Gym Gear & Apparel to Keep You Moving in Style',
            ),
            const SizedBox(height: 3),
            _buildSectionText(
              '• Look and feel great while working out\n'
              '• Choose the right gym gear\n'
              '• Boost performance with the right outfit\n'
              '• Stay confident and comfortable',
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Sort by: ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xFF1A2E35),
                    ),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: _selectedSortOption,
                    onChanged: _onSortChanged,
                    items: _sortOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      );
                    }).toList(),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFF1A2E35),
                    ),
                    underline: Container(),
                    dropdownColor: Colors.white,
                    style: const TextStyle(color: Color(0xFF1A2E35)),
                    borderRadius: BorderRadius.circular(12),
                    elevation: 2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: GridView.count(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 11,
                mainAxisSpacing: 15,
                children: _products.map((product) {
                  return _buildProductCard(
                    imagePath: product.imagePath,
                    title: product.title,
                    price: '\$${product.price.toStringAsFixed(2)}',
                    onTap: product.onTap,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      leading: Icon(icon, color: Colors.white, size: 24),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontSize: 16,
        ),
      ),
      onTap: onTap,
      hoverColor: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0xFF1A2E35),
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: Colors.black.withOpacity(0.7),
        fontFamily: 'Poppins',
        height: 1.6,
      ),
    );
  }

  Widget _buildProductCard({
    required String imagePath,
    required String title,
    required String price,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: Color(0xFF1A2E35),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Color(0xFF4CAF50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
