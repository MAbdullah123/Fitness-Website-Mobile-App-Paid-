import 'package:flutter/material.dart';
import 'package:flutter_application_gym/cart_benchpress.dart';
import 'package:flutter_application_gym/cart_dumbbells20Kg.dart';
import 'package:flutter_application_gym/cart_dumbbells5kg.dart';
import 'package:flutter_application_gym/cart_weight.dart';

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

class workout_equipment extends StatefulWidget {
  const workout_equipment({super.key});

  @override
  State<workout_equipment> createState() => _workout_equipmentState();
}

class _workout_equipmentState extends State<workout_equipment> {
  late List<Product> _products;
  late List<Product> _originalProducts;
  List<Product> _filteredProducts = [];
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
    _originalProducts = [
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
        imagePath: 'assets/9.jpg',
        title: 'Dumbbels',
        price: 30.99,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_weight()),
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
    _products = List.from(_originalProducts);
  }

  void _onSortChanged(String? newValue) {
    if (newValue != null) {
      setState(() {
        _selectedSortOption = newValue;
        _applyFilters();
      });
    }
  }

  void _filterProducts(String query) {
    setState(() {
      _applyFilters(query: query);
    });
  }

  void _applyFilters({String? query}) {
    _products = List.from(_originalProducts);

    // Sort
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

    if (query != null && query.isNotEmpty) {
      _filteredProducts = _products
          .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      _filteredProducts = _products;
    }
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
                  )
                : const Text('Workout Equipment'),
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
          children: [
            Image.asset(
              'assets/equipment.jpg',
              width: double.infinity,
              height: 320,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: const EdgeInsets.symmetric(vertical: 12),
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
                    'Sort by:',
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
                    items: _sortOptions.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontFamily: 'Poppins'),
                        ),
                      );
                    }).toList(),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFF1A2E35),
                    ),
                    underline: Container(),
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
                children: _filteredProducts.map((product) {
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
}
