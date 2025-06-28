import 'package:flutter/material.dart';
import 'package:flutter_application_gym/cart_bag_pack.dart';
import 'package:flutter_application_gym/cart_finger_gloves.dart';
import 'package:flutter_application_gym/cart_roller.dart';
import 'package:flutter_application_gym/cart_wrist_band.dart';

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

class accessories extends StatefulWidget {
  const accessories({super.key});

  @override
  State<accessories> createState() => _accessoriesState();
}

class _accessoriesState extends State<accessories> {
  late List<Product> _products;
  late List<Product> _originalProducts;
  String _selectedSortOption = 'Default Sorting';
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

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
    _applyFilters();
  }

  void _initializeProducts() {
    _products = [
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
    ];
    _originalProducts = List.from(_products);
  }

  void _onSortChanged(String? newValue) {
    if (newValue != null) {
      setState(() {
        _selectedSortOption = newValue;
        _applyFilters();
      });
    }
  }

  void _applyFilters({String? query}) {
    setState(() {
      _products = List.from(_originalProducts);
      if (query != null && query.isNotEmpty) {
        _products = _products
            .where(
              (product) =>
                  product.title.toLowerCase().contains(query.toLowerCase()) ||
                  product.price.toString().contains(query),
            )
            .toList();
      }
      switch (_selectedSortOption) {
        case 'Price: Low to High':
          _products.sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'Price: High to Low':
          _products.sort((a, b) => b.price.compareTo(a.price));
          break;
        case 'Newest First':
          _products = _products.reversed.toList();
          break;
        default:
          break;
      }
    });
  }

  void _filterProducts(String query) {
    _applyFilters(query: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3DB2FF), Color(0xFF1D5D9B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: AppBar(
            title: _isSearching
                ? TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Search products...',
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                    onChanged: _filterProducts,
                    autofocus: true,
                  )
                : const Text('Accessories'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(_isSearching ? Icons.close : Icons.search),
                onPressed: () {
                  setState(() {
                    _isSearching = !_isSearching;
                    if (!_isSearching) {
                      _searchController.clear();
                      _applyFilters();
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/gym_accessories.jpg',
              width: double.infinity,
              height: 330,
              fit: BoxFit.cover,
            ),
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
              padding: const EdgeInsets.symmetric(horizontal: 12),
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
          padding: const EdgeInsets.all(8),
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

  Widget _buildSectionText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        height: 1.5,
        color: Color(0xFF1A2E35),
        fontFamily: 'Poppins',
      ),
    );
  }

  Widget _buildSectionHeader(String header) {
    return Text(
      header,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A2E35),
        fontFamily: 'Poppins',
      ),
    );
  }
}
