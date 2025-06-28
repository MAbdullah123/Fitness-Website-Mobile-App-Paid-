import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class BlogPost {
  final String title;
  final String category;
  final String excerpt;
  final String content;
  final String imageUrl;
  final String author;
  final String date;

  BlogPost({
    required this.title,
    required this.category,
    required this.excerpt,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.date,
  });
}

class blog extends StatefulWidget {
  const blog({super.key});

  @override
  State<blog> createState() => _blogState();
}

class _blogState extends State<blog> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> categories = [
    'All',
    'Workout Tips',
    'Nutrition',
    'Mental Health',
    'Equipment Guide',
  ];

  final List<BlogPost> blogPosts = [
    BlogPost(
      title: 'Best Exercises for Core Strength',
      category: 'Workout Tips',
      excerpt:
          'Discover the most effective exercises to build a strong core...',
      content: '''
Build a stronger core with these proven exercises:

1. Planks - The foundation of core strength
• Start with 30 seconds
• Progress to 1-2 minutes
• Keep proper form throughout

2. Russian Twists
• Works obliques
• Use weight for added difficulty
• Control the movement

3. Dead Bug Exercise
• Great for beginners
• Focuses on stability
• Protects lower back

4. Bird Dog
• Improves balance
• Strengthens lower back
• Perfect for all levels

Remember to:
• Breathe properly
• Maintain form
• Progress gradually
''',
      imageUrl: 'assets/b1.jpg',
      author: 'John Smith',
      date: 'March 15, 2024',
    ),
    BlogPost(
      title: 'Nutrition Guide for Muscle Gain',
      category: 'Nutrition',
      excerpt: 'Learn the essential nutrients needed for muscle growth...',
      content: '''
Essential Nutrition Guide for Muscle Growth:

1. Protein Requirements
• 1.6-2.2g per kg of body weight
• Quality protein sources
• Timing your intake

2. Carbohydrates
• Complex carbs for energy
• Pre and post workout timing
• Best sources

3. Healthy Fats
• Essential fatty acids
• Hormone production
• Recovery support

4. Meal Timing
• Pre-workout nutrition
• Post-workout window
• Daily meal spacing

Plus supplement recommendations and meal plans!
''',
      imageUrl: 'assets/b2.jpg',
      author: 'Sarah Johnson',
      date: 'March 14, 2024',
    ),
    BlogPost(
      title: 'Mental Health Benefits of Exercise',
      category: 'Mental Health',
      excerpt: 'Understanding how exercise improves mental wellbeing...',
      content: '''
How Exercise Boosts Mental Health:

1. Stress Reduction
• Cortisol regulation
• Endorphin release
• Better sleep quality

2. Anxiety Management
• Physical activity benefits
• Mindful movement
• Breathing techniques

3. Depression Prevention
• Neurotransmitter balance
• Social interaction
• Goal achievement

4. Cognitive Function
• Brain plasticity
• Memory improvement
• Focus enhancement

Plus practical tips for starting your journey!
''',
      imageUrl: 'assets/b3.jpg',
      author: 'Dr. Michael Brown',
      date: 'March 13, 2024',
    ),
    BlogPost(
      title: 'Choosing the Right Weight Plates',
      category: 'Equipment Guide',
      excerpt:
          'A comprehensive guide to selecting weight plates for your training...',
      content: '''
Weight Plate Selection Guide:

1. Types of Weight Plates
• Olympic Plates
• Standard Plates
• Bumper Plates
• Competition Plates

2. Material Considerations
• Cast Iron
• Rubber Coated
• Urethane
• Steel

3. Important Features
• Grip Design
• Thickness
• Accuracy
• Durability

4. Maintenance Tips
• Proper Storage
• Cleaning Methods
• Damage Prevention
• Regular Inspection

Make an informed decision for your gym setup!
''',
      imageUrl: 'assets/b4.jpg',
      author: 'Mike Wilson',
      date: 'March 12, 2024',
    ),
    BlogPost(
      title: 'HIIT Workout for Fat Loss',
      category: 'Workout Tips',
      excerpt: 'Maximize your fat burning with these HIIT protocols...',
      content: '''
High-Intensity Interval Training Guide:

1. Workout Structure
• 30 seconds work
• 15 seconds rest
• 8-12 rounds
• Total 20 minutes

2. Best HIIT Exercises
• Burpees
• Mountain Climbers
• Jump Squats
• Sprints

3. Progressive Overload
• Increase intensity
• Reduce rest time
• Add complexity
• Track progress

4. Recovery Tips
• Proper cool-down
• Hydration
• Sleep quality
• Active recovery

Get ready to transform your body!
''',
      imageUrl: 'assets/b5.jpg',
      author: 'Emma Davis',
      date: 'March 11, 2024',
    ),
    BlogPost(
      title: 'Pre-Workout Nutrition Essentials',
      category: 'Nutrition',
      excerpt: 'Fuel your workouts with the right pre-workout nutrition...',
      content: '''
Pre-Workout Nutrition Guide:

1. Timing Your Meals
• 2-3 hours before - full meal
• 1 hour before - light snack
• 30 minutes before - quick energy

2. Optimal Nutrients
• Complex carbohydrates
• Lean protein
• Moderate fats
• Hydration

3. Food Suggestions
• Oatmeal with banana
• Greek yogurt with berries
• Toast with eggs
• Protein smoothie

4. What to Avoid
• Heavy fats
• Excess fiber
• New foods
• Dairy (if sensitive)

Power up your performance!
''',
      imageUrl: 'assets/b6.jpg',
      author: 'Dr. Lisa Chen',
      date: 'March 10, 2024',
    ),
    BlogPost(
      title: 'Choosing the Perfect Resistance Bands',
      category: 'Equipment Guide',
      excerpt: 'Everything you need to know about resistance bands...',
      content: '''
Resistance Band Selection Guide:

1. Types of Bands
• Loop Bands
• Therapy Bands
• Power Bands
• Figure 8 Bands

2. Resistance Levels
• Light (2-4 kg)
• Medium (5-8 kg)
• Heavy (9-14 kg)
• Extra Heavy (15+ kg)

3. Material Quality
• Natural latex vs synthetic
• Thickness considerations
• Durability factors
• Safety features

4. Usage Tips
• Proper storage
• Inspection before use
• Cleaning methods
• Replacement timing

Choose the right band for your goals!
''',
      imageUrl: 'assets/b7.jpg',
      author: 'Tom Richards',
      date: 'March 9, 2024',
    ),
    BlogPost(
      title: 'Meditation for Athletes',
      category: 'Mental Health',
      excerpt: 'Enhance your athletic performance through meditation...',
      content: '''
Athletic Meditation Guide:

1. Benefits for Athletes
• Improved focus
• Stress reduction
• Better recovery
• Enhanced performance

2. Types of Meditation
• Mindfulness
• Visualization
• Body scanning
• Breathing exercises

3. Implementation
• Pre-workout routine
• Post-workout recovery
• Competition preparation
• Daily practice

4. Getting Started
• 5-minute sessions
• Guided apps
• Quiet space
• Consistent timing

Transform your mental game!
''',
      imageUrl: 'assets/b8.jpg',
      author: 'Dr. Sarah White',
      date: 'March 8, 2024',
    ),
    BlogPost(
      title: 'Home Gym Essentials Guide',
      category: 'Equipment Guide',
      excerpt: 'Build your perfect home gym with these must-have items...',
      content: '''
Home Gym Equipment Guide:

1. Basic Equipment
• Adjustable dumbbells
• Resistance bands
• Exercise mat
• Pull-up bar

2. Intermediate Additions
• Adjustable bench
• Kettlebells
• Foam roller
• Power rack

3. Space Considerations
• Room dimensions
• Flooring options
• Storage solutions
• Ventilation

4. Budget Planning
• Essential items first
• Quality vs cost
• Multi-use equipment
• Future expansions

Create your ideal workout space!
''',
      imageUrl: 'assets/b9.jpg',
      author: 'Alex Thompson',
      date: 'March 7, 2024',
    ),
  ];

  List<BlogPost> filteredPosts = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    filteredPosts = List.from(blogPosts);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        if (_tabController.index == 0) {
          filteredPosts = List.from(blogPosts);
        } else {
          filteredPosts = blogPosts
              .where(
                (post) => post.category == categories[_tabController.index],
              )
              .toList();
        }
      });
    }
  }

  void _sharePost(BlogPost post) {
    Share.share(
      '${post.title}\n\n${post.excerpt}\n\nRead more at Fitness Fusion Blog!',
      subject: post.title,
    );
  }

  void _showFullArticle(BuildContext context, BlogPost post) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(post.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1D5D9B),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            post.author,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '• ${post.date}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        post.content,
                        style: const TextStyle(fontSize: 16, height: 1.6),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: const Color(0xFF3DB2FF),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.transparent,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFF3DB2FF).withOpacity(0.1),
                ),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.only(right: 2),
                physics: const BouncingScrollPhysics(),
                tabs: categories.map((category) {
                  return Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 4,
                      ),
                      child: Text(category),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: filteredPosts.map((post) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () => _showFullArticle(context, post),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              post.imageUrl,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0xFF3DB2FF,
                                        ).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        post.category,
                                        style: const TextStyle(
                                          color: Color(0xFF3DB2FF),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      icon: const Icon(Icons.share),
                                      onPressed: () => _sharePost(post),
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  post.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1D5D9B),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  post.excerpt,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person_outline,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      post.author,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    const Icon(
                                      Icons.calendar_today,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      post.date,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
