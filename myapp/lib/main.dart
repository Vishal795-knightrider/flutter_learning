// ============================================================
// Online Course App - Flutter Single File Project
// Complete implementation with all required modules
// UPGRADED VERSION v2.0 - Premium Features Added
// ============================================================

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const OnlineCourseApp());
}

// ============================================================
// APP STATE MANAGEMENT (Simple InheritedWidget)
// ============================================================

class AppState extends ChangeNotifier {
  bool isDarkMode = false;
  List<int> enrolledCourseIds = [];
  List<int> favoriteCourseIds = [];
  Map<int, double> courseProgress = {};
  String searchQuery = '';
  String selectedCategory = 'All';

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void enrollCourse(int id) {
    if (!enrolledCourseIds.contains(id)) {
      enrolledCourseIds.add(id);
      courseProgress[id] = 0.0;
      notifyListeners();
    }
  }

  void toggleFavorite(int id) {
    if (favoriteCourseIds.contains(id)) {
      favoriteCourseIds.remove(id);
    } else {
      favoriteCourseIds.add(id);
    }
    notifyListeners();
  }

  void updateProgress(int id, double progress) {
    courseProgress[id] = progress;
    notifyListeners();
  }

  void setSearch(String q) {
    searchQuery = q;
    notifyListeners();
  }

  void setCategory(String cat) {
    selectedCategory = cat;
    notifyListeners();
  }
}

// Global app state
final AppState appState = AppState();

// ============================================================
// COLOR PALETTE & THEME
// ============================================================

class AppColors {
  static const Color primary = Color(0xFF6C63FF);
  static const Color secondary = Color(0xFF3ECFCF);
  static const Color accent = Color(0xFFFF6584);
  static const Color gold = Color(0xFFFFB703);
  static const Color success = Color(0xFF06D6A0);
  static const Color cardLight = Colors.white;
  static const Color bgLight = Color(0xFFF4F6FF);
  static const Color bgDark = Color(0xFF12122A);
  static const Color cardDark = Color(0xFF1E1E3A);

  static LinearGradient get primaryGradient => const LinearGradient(
        colors: [Color(0xFF6C63FF), Color(0xFF3ECFCF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient get accentGradient => const LinearGradient(
        colors: [Color(0xFFFF6584), Color(0xFFFF9A3C)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient get goldGradient => const LinearGradient(
        colors: [Color(0xFFFFB703), Color(0xFFFF9500)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient get deepPurpleGradient => const LinearGradient(
        colors: [Color(0xFF7B2FF7), Color(0xFFF107A3)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}

// ============================================================
// DATA MODEL
// ============================================================

class Course {
  final int id;
  final String name;
  final String instructor;
  final String duration;
  final String level;
  final String description;
  final List<String> learnings;
  final double rating;
  final double price;
  final IconData icon;
  final List<Color> gradientColors;
  final int studentsEnrolled;
  final String category;

  const Course({
    required this.id,
    required this.name,
    required this.instructor,
    required this.duration,
    required this.level,
    required this.description,
    required this.learnings,
    required this.rating,
    required this.price,
    required this.icon,
    required this.gradientColors,
    required this.studentsEnrolled,
    required this.category,
  });
}

// ============================================================
// DEMO DATA
// ============================================================

final List<Course> allCourses = [
  Course(
    id: 1,
    name: 'Flutter & Dart Masterclass',
    instructor: 'Arjun Sharma',
    duration: '42 Hours',
    level: 'Beginner to Advanced',
    description:
        'Master Flutter from scratch. Build real-world apps for iOS, Android, Web & Desktop using Dart. '
        'Covers state management, animations, Firebase integration, and app deployment.',
    learnings: [
      'Build cross-platform mobile apps',
      'Master Dart programming',
      'State management with Provider & Riverpod',
      'Firebase & REST API integration',
      'Publish to Play Store & App Store',
      'Advanced animations & custom UI',
    ],
    rating: 4.9,
    price: 1299,
    icon: Icons.phone_android_rounded,
    gradientColors: [Color(0xFF6C63FF), Color(0xFF3ECFCF)],
    studentsEnrolled: 18420,
    category: 'Programming',
  ),
  Course(
    id: 2,
    name: 'Machine Learning with Python',
    instructor: 'Priya Patel',
    duration: '55 Hours',
    level: 'Intermediate',
    description:
        'Dive into Machine Learning algorithms, neural networks, and real-world AI projects. '
        'Use scikit-learn, TensorFlow, and Keras to build intelligent systems.',
    learnings: [
      'Supervised & Unsupervised Learning',
      'Neural Networks & Deep Learning',
      'Natural Language Processing',
      'Model deployment with Flask',
      'Data preprocessing & visualization',
      'Kaggle competition strategies',
    ],
    rating: 4.8,
    price: 1799,
    icon: Icons.psychology_rounded,
    gradientColors: [Color(0xFFFF6584), Color(0xFFFF9A3C)],
    studentsEnrolled: 23150,
    category: 'AI',
  ),
  Course(
    id: 3,
    name: 'Full Stack Web Development',
    instructor: 'Rahul Verma',
    duration: '80 Hours',
    level: 'Beginner',
    description:
        'Become a full-stack web developer using React, Node.js, Express, and MongoDB. '
        'Build complete web applications from front-end to back-end with real projects.',
    learnings: [
      'HTML5, CSS3 & modern JavaScript',
      'React.js with Hooks & Redux',
      'Node.js & Express REST APIs',
      'MongoDB & Mongoose ORM',
      'Authentication & JWT tokens',
      'Deploy on AWS & Vercel',
    ],
    rating: 4.7,
    price: 1499,
    icon: Icons.web_rounded,
    gradientColors: [Color(0xFF11998E), Color(0xFF38EF7D)],
    studentsEnrolled: 31200,
    category: 'Web',
  ),
  Course(
    id: 4,
    name: 'UI/UX Design Pro',
    instructor: 'Sneha Kapoor',
    duration: '30 Hours',
    level: 'Beginner',
    description:
        'Learn the fundamentals and advanced techniques of UI/UX design using Figma. '
        'Understand design thinking, wireframing, prototyping, and user research.',
    learnings: [
      'Design thinking & empathy mapping',
      'Figma from basics to advanced',
      'Wireframing & prototyping',
      'Color theory & typography',
      'Design systems & components',
      'Portfolio building',
    ],
    rating: 4.9,
    price: 999,
    icon: Icons.design_services_rounded,
    gradientColors: [Color(0xFFFC5C7D), Color(0xFF6A82FB)],
    studentsEnrolled: 14800,
    category: 'Design',
  ),
  Course(
    id: 5,
    name: 'Cloud Computing & DevOps',
    instructor: 'Vikram Singh',
    duration: '48 Hours',
    level: 'Advanced',
    description:
        'Master AWS, Docker, Kubernetes, and CI/CD pipelines. Learn to architect scalable '
        'cloud solutions and implement DevOps best practices in enterprise environments.',
    learnings: [
      'AWS core services (EC2, S3, RDS)',
      'Docker containerization',
      'Kubernetes orchestration',
      'CI/CD with Jenkins & GitHub Actions',
      'Infrastructure as Code with Terraform',
      'Monitoring with Prometheus & Grafana',
    ],
    rating: 4.6,
    price: 2199,
    icon: Icons.cloud_rounded,
    gradientColors: [Color(0xFF4776E6), Color(0xFF8E54E9)],
    studentsEnrolled: 9630,
    category: 'Programming',
  ),
  Course(
    id: 6,
    name: 'Ethical Hacking & Cybersecurity',
    instructor: 'Ananya Gupta',
    duration: '65 Hours',
    level: 'Intermediate',
    description:
        'Learn penetration testing, vulnerability assessment, and how to secure systems. '
        'Covers network security, web app hacking, and industry-standard tools like Metasploit.',
    learnings: [
      'Network scanning & reconnaissance',
      'Web application penetration testing',
      'Metasploit framework',
      'Social engineering techniques',
      'CTF challenges & practice labs',
      'Security certifications preparation',
    ],
    rating: 4.8,
    price: 1699,
    icon: Icons.security_rounded,
    gradientColors: [Color(0xFF232526), Color(0xFF414345)],
    studentsEnrolled: 11540,
    category: 'Security',
  ),
  Course(
    id: 7,
    name: 'Data Science & Analytics',
    instructor: 'Rohan Mehta',
    duration: '50 Hours',
    level: 'Intermediate',
    description:
        'Master data analysis, visualization, and storytelling using Python, Pandas, and Tableau. '
        'Build a strong foundation in statistics and business intelligence.',
    learnings: [
      'Python for data analysis',
      'Pandas & NumPy mastery',
      'Data visualization with Matplotlib & Seaborn',
      'SQL for data querying',
      'Tableau dashboards',
      'Statistical analysis & hypothesis testing',
    ],
    rating: 4.7,
    price: 1399,
    icon: Icons.bar_chart_rounded,
    gradientColors: [Color(0xFFf7971e), Color(0xFFffd200)],
    studentsEnrolled: 16700,
    category: 'AI',
  ),
  Course(
    id: 8,
    name: 'Blockchain & Web3 Development',
    instructor: 'Kavya Nair',
    duration: '38 Hours',
    level: 'Advanced',
    description:
        'Build decentralized applications on Ethereum. Learn Solidity, smart contracts, '
        'NFTs, DeFi protocols, and integrate with MetaMask and Web3.js.',
    learnings: [
      'Blockchain fundamentals',
      'Solidity smart contracts',
      'NFT development & minting',
      'DeFi protocol design',
      'Web3.js & ethers.js',
      'IPFS & decentralized storage',
    ],
    rating: 4.5,
    price: 2499,
    icon: Icons.currency_bitcoin_rounded,
    gradientColors: [Color(0xFFf953c6), Color(0xFFb91d73)],
    studentsEnrolled: 7890,
    category: 'Web',
  ),
];

// ============================================================
// CERTIFICATE DATA
// ============================================================

final List<Map<String, String>> certificates = [
  {
    'student': 'Amit Rajput',
    'course': 'Flutter & Dart Masterclass',
    'date': '15 March 2024',
    'id': 'CERT-FLT-2024-001',
  },
  {
    'student': 'Amit Rajput',
    'course': 'UI/UX Design Pro',
    'date': '28 January 2024',
    'id': 'CERT-UX-2024-042',
  },
  {
    'student': 'Amit Rajput',
    'course': 'Full Stack Web Development',
    'date': '5 November 2023',
    'id': 'CERT-WEB-2023-119',
  },
];

// ============================================================
// CATEGORY DATA
// ============================================================

const List<Map<String, dynamic>> categories = [
  {'label': 'All', 'icon': Icons.grid_view_rounded},
  {'label': 'Programming', 'icon': Icons.code_rounded},
  {'label': 'Design', 'icon': Icons.brush_rounded},
  {'label': 'AI', 'icon': Icons.auto_awesome_rounded},
  {'label': 'Web', 'icon': Icons.language_rounded},
  {'label': 'Security', 'icon': Icons.shield_rounded},
];

// ============================================================
// RECOMMENDED COURSES (first 2 highlighted)
// ============================================================

final List<Course> recommendedCourses = [allCourses[0], allCourses[1]];

// ============================================================
// MAIN APP WIDGET
// ============================================================

class OnlineCourseApp extends StatefulWidget {
  const OnlineCourseApp({super.key});

  @override
  State<OnlineCourseApp> createState() => _OnlineCourseAppState();
}

class _OnlineCourseAppState extends State<OnlineCourseApp> {
  @override
  void initState() {
    super.initState();
    appState.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Course App',
      debugShowCheckedModeBanner: false,
      themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // Light Theme
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: AppColors.primary,
        scaffoldBackgroundColor: AppColors.bgLight,
        fontFamily: 'Roboto',
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.primary),
        ),
      ),

      // Dark Theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: AppColors.primary,
        scaffoldBackgroundColor: AppColors.bgDark,
        fontFamily: 'Roboto',
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),

      // Named Routes — splash is now initial
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const HomeScreen(),
        '/learning': (context) => const MyLearningScreen(),
        '/certificates': (context) => const CertificatesScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final course = settings.arguments as Course;
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => CourseDetailScreen(course: course),
            transitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (_, animation, __, child) {
              final curved = CurvedAnimation(
                  parent: animation, curve: Curves.easeOutCubic);
              return FadeTransition(
                opacity: curved,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.06),
                    end: Offset.zero,
                  ).animate(curved),
                  child: child,
                ),
              );
            },
          );
        }
        return null;
      },
    );
  }
}

// ============================================================
// SPLASH SCREEN
// ============================================================

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeIn),
    );

    _scaleAnim = Tween<double>(begin: 0.75, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut),
    );

    _ctrl.forward();

    Future.delayed(const Duration(milliseconds: 2400), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/');
      }
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6C63FF), Color(0xFF3ECFCF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnim,
            child: ScaleTransition(
              scale: _scaleAnim,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Logo
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.5), width: 2.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 30,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.school_rounded,
                        color: Colors.white, size: 58),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Online Course App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Learn. Grow. Succeed.',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.4,
                    ),
                  ),
                  const SizedBox(height: 56),
                  SizedBox(
                    width: 36,
                    height: 36,
                    child: CircularProgressIndicator(
                      color: Colors.white.withOpacity(0.85),
                      strokeWidth: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// BOTTOM NAV SCAFFOLD (shared shell)
// ============================================================

class MainScaffold extends StatefulWidget {
  final Widget body;
  final int currentIndex;
  const MainScaffold(
      {super.key, required this.body, required this.currentIndex});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  void _navigate(int index) {
    final routes = ['/', '/learning', '/certificates', '/profile'];
    if (index != widget.currentIndex) {
      Navigator.pushReplacementNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDarkMode;
    return Scaffold(
      body: widget.body,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.cardDark : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              blurRadius: 24,
              offset: const Offset(0, -6),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                    icon: Icons.home_rounded,
                    label: 'Home',
                    index: 0,
                    current: widget.currentIndex,
                    onTap: _navigate),
                _NavItem(
                    icon: Icons.play_circle_rounded,
                    label: 'My Learning',
                    index: 1,
                    current: widget.currentIndex,
                    onTap: _navigate),
                _NavItem(
                    icon: Icons.workspace_premium_rounded,
                    label: 'Certificates',
                    index: 2,
                    current: widget.currentIndex,
                    onTap: _navigate),
                _NavItem(
                    icon: Icons.person_rounded,
                    label: 'Profile',
                    index: 3,
                    current: widget.currentIndex,
                    onTap: _navigate),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int current;
  final Function(int) onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = index == current;
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          gradient: isActive ? AppColors.primaryGradient : null,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                color: isActive ? Colors.white : Colors.grey, size: 22),
            if (isActive) ...[
              const SizedBox(width: 6),
              Text(label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700)),
            ],
          ],
        ),
      ),
    );
  }
}

// ============================================================
// HOME SCREEN
// ============================================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    appState.addListener(() {
      if (mounted) setState(() {});
    });
    _searchController.addListener(() {
      appState.setSearch(_searchController.text);
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Course> get filteredCourses {
    final q = _searchController.text.toLowerCase();
    final cat = appState.selectedCategory;
    return allCourses.where((c) {
      final matchesSearch = q.isEmpty ||
          c.name.toLowerCase().contains(q) ||
          c.instructor.toLowerCase().contains(q) ||
          c.level.toLowerCase().contains(q);
      final matchesCategory = cat == 'All' || c.category == cat;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 900));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.refresh_rounded, color: Colors.white, size: 18),
              SizedBox(width: 10),
              Text('Courses Updated!',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(12),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDarkMode;
    final courses = filteredCourses;

    return MainScaffold(
      currentIndex: 0,
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: AppColors.primary,
        backgroundColor: isDark ? AppColors.cardDark : Colors.white,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // ---- HEADER ----
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.32),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Online Course App 🎓',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: -0.6,
                                    )),
                                const SizedBox(height: 3),
                                Text('Welcome back, Amit! 👋',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.85),
                                      fontSize: 13,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                // Notification Bell
                                _NotificationBell(),
                                const SizedBox(width: 10),
                                // Enrolled badge
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.school_rounded,
                                          color: Colors.white, size: 15),
                                      const SizedBox(width: 5),
                                      Text(
                                        '${appState.enrolledCourseIds.length} Enrolled',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),

                        // Search Bar
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.12),
                                blurRadius: 14,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search courses, instructors...',
                              hintStyle:
                                  TextStyle(color: Colors.grey[400], fontSize: 14),
                              prefixIcon: const Icon(Icons.search_rounded,
                                  color: AppColors.primary),
                              suffixIcon: _searchController.text.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.clear_rounded,
                                          color: Colors.grey),
                                      onPressed: () {
                                        _searchController.clear();
                                        setState(() {});
                                      },
                                    )
                                  : null,
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Stats row
                        Row(
                          children: [
                            _StatChip(
                                icon: Icons.menu_book_rounded,
                                label: '${allCourses.length} Courses'),
                            const SizedBox(width: 8),
                            _StatChip(
                                icon: Icons.people_rounded,
                                label: '1.5L+ Students'),
                            const SizedBox(width: 8),
                            _StatChip(
                                icon: Icons.star_rounded,
                                label: 'Top Rated'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            // ---- RECOMMENDED SECTION ----
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 4,
                          height: 20,
                          decoration: BoxDecoration(
                            gradient: AppColors.accentGradient,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Recommended For You ✨',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: isDark ? Colors.white : Colors.black87,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: recommendedCourses.length,
                      itemBuilder: (_, i) =>
                          _RecommendedCard(course: recommendedCourses[i]),
                    ),
                  ),
                ],
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 22)),

            // ---- CATEGORY FILTER CHIPS ----
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Browse by Category',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : Colors.black87,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 44,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: categories.length,
                      itemBuilder: (_, i) {
                        final cat = categories[i];
                        final isSelected =
                            appState.selectedCategory == cat['label'];
                        return _CategoryChip(
                          label: cat['label'] as String,
                          icon: cat['icon'] as IconData,
                          isSelected: isSelected,
                          onTap: () {
                            appState.setCategory(cat['label'] as String);
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 18)),

            // ---- ALL COURSES HEADER ----
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      courses.length == allCourses.length
                          ? 'All Courses'
                          : '${courses.length} Result${courses.length == 1 ? '' : 's'}',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${courses.length} courses',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 12)),

            // ---- COURSES LIST or EMPTY STATE ----
            if (courses.isEmpty)
              SliverToBoxAdapter(
                child: _EmptyState(
                  icon: Icons.search_off_rounded,
                  title: 'No courses found',
                  subtitle:
                      'Try a different keyword\nor change the category filter',
                ),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final course = courses[index];
                    return _FadeInCourseCard(
                      course: course,
                      index: index,
                    );
                  },
                  childCount: courses.length,
                ),
              ),

            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// NOTIFICATION BELL WIDGET
// ============================================================

class _NotificationBell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.notifications_off_rounded,
                    color: Colors.white, size: 18),
                SizedBox(width: 10),
                Text('No new notifications',
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.all(12),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.notifications_rounded,
                color: Colors.white, size: 22),
          ),
          // Red badge
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withOpacity(0.4),
                    blurRadius: 6,
                  )
                ],
              ),
              child: const Center(
                child: Text('3',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w900)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CATEGORY CHIP
// ============================================================

class _CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDarkMode;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutCubic,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          gradient: isSelected ? AppColors.primaryGradient : null,
          color: isSelected
              ? null
              : (isDark ? AppColors.cardDark : Colors.white),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : (isDark
                    ? Colors.white.withOpacity(0.1)
                    : Colors.grey.withOpacity(0.25)),
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: isSelected
                  ? Colors.white
                  : (isDark ? Colors.white60 : Colors.grey[600]),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: isSelected
                    ? Colors.white
                    : (isDark ? Colors.white70 : Colors.grey[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// RECOMMENDED CARD (horizontal premium card)
// ============================================================

class _RecommendedCard extends StatelessWidget {
  final Course course;
  const _RecommendedCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, '/details', arguments: course),
      child: Container(
        width: 240,
        margin: const EdgeInsets.only(right: 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: course.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: course.gradientColors.first.withOpacity(0.35),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: _CirclePatternPainter()),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.22),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(course.icon,
                            color: Colors.white, size: 22),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.22),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('⭐ Recommended',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    course.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: Colors.amber, size: 13),
                      const SizedBox(width: 3),
                      Text(
                        course.rating.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Text(
                        '₹${course.price.toInt()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
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
  }
}

// ============================================================
// FADE-IN COURSE CARD WRAPPER
// ============================================================

class _FadeInCourseCard extends StatefulWidget {
  final Course course;
  final int index;
  const _FadeInCourseCard({required this.course, required this.index});

  @override
  State<_FadeInCourseCard> createState() => _FadeInCourseCardState();
}

class _FadeInCourseCardState extends State<_FadeInCourseCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOut),
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    Future.delayed(Duration(milliseconds: widget.index * 60), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: _CourseCard(course: widget.course),
      ),
    );
  }
}

// ============================================================
// EMPTY STATE WIDGET
// ============================================================

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _EmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDarkMode;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(28),
            ),
            child:
                Icon(icon, size: 52, color: AppColors.primary.withOpacity(0.6)),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey[500], height: 1.5),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// STAT CHIP WIDGET
// ============================================================

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _StatChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 13),
          const SizedBox(width: 5),
          Text(label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// ============================================================
// COURSE CARD WIDGET
// ============================================================

class _CourseCard extends StatefulWidget {
  final Course course;
  const _CourseCard({required this.course});

  @override
  State<_CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<_CourseCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _pressCtrl;
  late Animation<double> _pressAnim;

  @override
  void initState() {
    super.initState();
    appState.addListener(() {
      if (mounted) setState(() {});
    });
    _pressCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _pressAnim = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pressCtrl.dispose();
    super.dispose();
  }

  void _enroll() {
    appState.enrollCourse(widget.course.id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded,
                color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Enrolled in ${widget.course.name}! 🎉',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(12),
        duration: const Duration(seconds: 3),
      ),
    );
    showDialog(
      context: context,
      builder: (_) => _PaymentSuccessDialog(course: widget.course),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDarkMode;
    final isEnrolled = appState.enrolledCourseIds.contains(widget.course.id);
    final isFav = appState.favoriteCourseIds.contains(widget.course.id);

    return ScaleTransition(
      scale: _pressAnim,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: isDark ? AppColors.cardDark : AppColors.cardLight,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.28 : 0.07),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            // Course Header with gradient
            Container(
              height: 134,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.course.gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(painter: _CirclePatternPainter()),
                  ),
                  Center(
                    child: Hero(
                      tag: 'course_icon_${widget.course.id}',
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.4), width: 2),
                        ),
                        child: Icon(widget.course.icon,
                            color: Colors.white, size: 38),
                      ),
                    ),
                  ),
                  // Favorite button
                  Positioned(
                    top: 12,
                    right: 12,
                    child: GestureDetector(
                      onTap: () => appState.toggleFavorite(widget.course.id),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          isFav
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isFav ? AppColors.accent : Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  // Enrolled badge
                  if (isEnrolled)
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.success,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check_rounded,
                                color: Colors.white, size: 12),
                            SizedBox(width: 4),
                            Text('Enrolled',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  // Level badge
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.28),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.course.level,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  // Duration badge
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.28),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.access_time_rounded,
                              color: Colors.white, size: 11),
                          const SizedBox(width: 4),
                          Text(
                            widget.course.duration,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Course Info
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.course.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: isDark ? Colors.white : Colors.black87,
                      letterSpacing: -0.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      const Icon(Icons.person_rounded,
                          size: 14, color: AppColors.primary),
                      const SizedBox(width: 4),
                      Text(
                        widget.course.instructor,
                        style: TextStyle(
                          fontSize: 13,
                          color: isDark ? Colors.white60 : Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.people_rounded,
                          size: 13, color: Colors.grey),
                      const SizedBox(width: 3),
                      Text(
                        '${(widget.course.studentsEnrolled / 1000).toStringAsFixed(1)}K',
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 11),
                  // Rating & Price Row
                  Row(
                    children: [
                      ...List.generate(5, (i) {
                        return Icon(
                          i < widget.course.rating.floor()
                              ? Icons.star_rounded
                              : (i < widget.course.rating
                                  ? Icons.star_half_rounded
                                  : Icons.star_outline_rounded),
                          color: AppColors.gold,
                          size: 16,
                        );
                      }),
                      const SizedBox(width: 5),
                      Text(
                        widget.course.rating.toString(),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.gold,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 5),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '₹${widget.course.price.toInt()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            '/details',
                            arguments: widget.course,
                          ),
                          icon: const Icon(Icons.info_outline_rounded, size: 16),
                          label: const Text('Details',
                              style: TextStyle(fontSize: 13)),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.primary,
                            side: const BorderSide(
                                color: AppColors.primary, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 11),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTapDown: (_) => _pressCtrl.forward(),
                          onTapUp: (_) =>
                              _pressCtrl.reverse().then((_) {
                                if (!isEnrolled) _enroll();
                              }),
                          onTapCancel: () => _pressCtrl.reverse(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 11),
                            decoration: BoxDecoration(
                              gradient: isEnrolled
                                  ? LinearGradient(
                                      colors: [
                                        AppColors.success,
                                        AppColors.success.withOpacity(0.7)
                                      ],
                                    )
                                  : AppColors.primaryGradient,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.primary.withOpacity(0.28),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  isEnrolled
                                      ? Icons.check_rounded
                                      : Icons.add_rounded,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  isEnrolled ? 'Enrolled' : 'Enroll',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
  }
}

// ============================================================
// BACKGROUND PATTERN PAINTER
// ============================================================

class _CirclePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.07)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width * 0.85, size.height * 0.2), 50, paint);
    canvas.drawCircle(
        Offset(size.width * 0.1, size.height * 0.8), 40, paint);
    canvas.drawCircle(
        Offset(size.width * 0.5, size.height * 1.2), 60, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}

// ============================================================
// PAYMENT SUCCESS DIALOG
// ============================================================

class _PaymentSuccessDialog extends StatelessWidget {
  final Course course;
  const _PaymentSuccessDialog({required this.course});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: appState.isDarkMode ? AppColors.cardDark : Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.2),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.payment_rounded,
                    color: Colors.white, size: 42),
              ),
              const SizedBox(height: 18),
              const Text('Payment Successful! 🎉',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3)),
              const SizedBox(height: 8),
              Text(
                'You are now enrolled in\n${course.name}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.5),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.currency_rupee_rounded,
                        color: AppColors.success, size: 16),
                    Text(
                      '${course.price.toInt()} paid successfully',
                      style: const TextStyle(
                        color: AppColors.success,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text('Start Learning →',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 15)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// COURSE DETAIL SCREEN
// ============================================================

class CourseDetailScreen extends StatefulWidget {
  final Course course;
  const CourseDetailScreen({super.key, required this.course});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    appState.addListener(() {
      if (mounted) setState(() {});
    });
    _animController = AnimationController(
      duration: const Duration(milliseconds: 280),
      vsync: this,
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.94).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _enroll() {
    _animController.forward().then((_) => _animController.reverse());
    appState.enrollCourse(widget.course.id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded,
                color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Text('Enrolled in ${widget.course.name}!'),
          ],
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    showDialog(
      context: context,
      builder: (_) => _PaymentSuccessDialog(course: widget.course),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDarkMode;
    final isEnrolled = appState.enrolledCourseIds.contains(widget.course.id);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Custom App Bar
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.arrow_back_rounded,
                    color: Colors.white),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: widget.course.gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CustomPaint(painter: _CirclePatternPainter()),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
                          Hero(
                            tag: 'course_icon_${widget.course.id}',
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(26),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.5),
                                    width: 2),
                              ),
                              child: Icon(widget.course.icon,
                                  color: Colors.white, size: 48),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              widget.course.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                shadows: [
                                  Shadow(
                                      blurRadius: 8,
                                      color: Colors.black26,
                                      offset: Offset(0, 2))
                                ],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _InfoChip(
                          icon: Icons.person_rounded,
                          label: widget.course.instructor,
                          color: AppColors.primary),
                      _InfoChip(
                          icon: Icons.access_time_rounded,
                          label: widget.course.duration,
                          color: AppColors.secondary),
                      _InfoChip(
                          icon: Icons.bar_chart_rounded,
                          label: widget.course.level,
                          color: AppColors.accent),
                      _InfoChip(
                          icon: Icons.people_rounded,
                          label:
                              '${(widget.course.studentsEnrolled / 1000).toStringAsFixed(1)}K students',
                          color: AppColors.gold),
                    ],
                  ),
                  const SizedBox(height: 22),

                  // Rating
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.cardDark : Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ...List.generate(
                            5,
                            (i) => Icon(
                                  i < widget.course.rating.floor()
                                      ? Icons.star_rounded
                                      : Icons.star_outline_rounded,
                                  color: AppColors.gold,
                                  size: 22,
                                )),
                        const SizedBox(width: 8),
                        Text(
                          widget.course.rating.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: AppColors.gold,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 9),
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Text(
                            '₹${widget.course.price.toInt()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),

                  _SectionTitle('About this Course'),
                  const SizedBox(height: 10),
                  Text(
                    widget.course.description,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.65,
                      color: isDark ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 22),

                  _SectionTitle('What You\'ll Learn'),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.cardDark : Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: widget.course.learnings.map((item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 11),
                          child: Row(
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  gradient: AppColors.primaryGradient,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.check_rounded,
                                    color: Colors.white, size: 16),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(item,
                                    style: TextStyle(
                                      fontSize: 13,
                                      height: 1.4,
                                      color: isDark
                                          ? Colors.white70
                                          : Colors.grey[800],
                                    )),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Animated Enroll Button
                  ScaleTransition(
                    scale: _scaleAnim,
                    child: GestureDetector(
                      onTap: isEnrolled ? null : _enroll,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 17),
                        decoration: BoxDecoration(
                          gradient: isEnrolled
                              ? LinearGradient(
                                  colors: [
                                    AppColors.success,
                                    AppColors.success.withOpacity(0.7)
                                  ],
                                )
                              : AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.4),
                              blurRadius: 18,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isEnrolled
                                  ? Icons.check_circle_rounded
                                  : Icons.play_circle_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              isEnrolled
                                  ? '✓ Already Enrolled'
                                  : 'Enroll Now — ₹${widget.course.price.toInt()}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDarkMode;
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: isDark ? Colors.white : Colors.black87,
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _InfoChip(
      {required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 5),
          Text(label,
              style: TextStyle(
                  fontSize: 12, color: color, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// ============================================================
// MY LEARNING SCREEN
// ============================================================

class MyLearningScreen extends StatefulWidget {
  const MyLearningScreen({super.key});

  @override
  State<MyLearningScreen> createState() => _MyLearningScreenState();
}

class _MyLearningScreenState extends State<MyLearningScreen> {
  @override
  void initState() {
    super.initState();
    appState.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDarkMode;
    final enrolledCourses = allCourses
        .where((c) => appState.enrolledCourseIds.contains(c.id))
        .toList();

    return MainScaffold(
      currentIndex: 1,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('My Learning 📚',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900)),
                  const SizedBox(height: 4),
                  Text(
                    '${enrolledCourses.length} courses in progress',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Course list
            Expanded(
              child: enrolledCourses.isEmpty
                  ? _EmptyState(
                      icon: Icons.school_outlined,
                      title: 'No courses enrolled yet!',
                      subtitle:
                          'Go back home and enroll\nin a course to get started',
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: enrolledCourses.length,
                      itemBuilder: (_, index) {
                        final course = enrolledCourses[index];
                        final progress =
                            appState.courseProgress[course.id] ?? 0.0;
                        return _LearningCard(
                          course: course,
                          progress: progress,
                          onContinue: () {
                            final rng = Random();
                            final newProgress =
                                (progress + 0.05 + rng.nextDouble() * 0.15)
                                    .clamp(0.0, 1.0);
                            appState.updateProgress(course.id, newProgress);
                          },
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

class _LearningCard extends StatelessWidget {
  final Course course;
  final double progress;
  final VoidCallback onContinue;

  const _LearningCard({
    required this.course,
    required this.progress,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDarkMode;
    final percent = (progress * 100).toInt();

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: course.gradientColors),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(course.icon, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      course.instructor,
                      style: TextStyle(
                          fontSize: 12, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              Text(
                '$percent%',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  foreground: Paint()
                    ..shader = AppColors.primaryGradient.createShader(
                      const Rect.fromLTWH(0, 0, 60, 30),
                    ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor:
                  isDark ? Colors.white10 : Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                  course.gradientColors.first),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                progress == 0
                    ? 'Not started'
                    : progress >= 1.0
                        ? '🎉 Completed!'
                        : '${(progress * 100).toInt()}% complete',
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
              const Spacer(),
              GestureDetector(
                onTap: progress >= 1.0 ? null : onContinue,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: progress >= 1.0
                        ? const LinearGradient(
                            colors: [AppColors.success, AppColors.success])
                        : AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    progress >= 1.0 ? '✓ Done' : 'Continue →',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CERTIFICATES SCREEN
// ============================================================

class CertificatesScreen extends StatelessWidget {
  const CertificatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 2,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
              decoration: BoxDecoration(
                gradient: AppColors.goldGradient,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gold.withOpacity(0.32),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.workspace_premium_rounded,
                          color: Colors.white, size: 28),
                      SizedBox(width: 10),
                      Text('My Certificates',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w900)),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text('Your earned achievements 🏆',
                      style: TextStyle(color: Colors.white70, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: certificates.length,
                itemBuilder: (_, index) =>
                    _CertificateCard(cert: certificates[index], index: index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CertificateCard extends StatelessWidget {
  final Map<String, String> cert;
  final int index;
  const _CertificateCard({required this.cert, required this.index});

  static const List<List<Color>> gradients = [
    [Color(0xFFFFB703), Color(0xFFFF9500)],
    [Color(0xFF6C63FF), Color(0xFF3ECFCF)],
    [Color(0xFF11998E), Color(0xFF38EF7D)],
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDarkMode;
    final grad = gradients[index % gradients.length];

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: grad[0].withOpacity(0.22),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Certificate Header
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: grad),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.workspace_premium_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Certificate of Completion',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 11)),
                          SizedBox(height: 2),
                          Text('Online Course App',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.verified_rounded,
                          color: Colors.white, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: List.generate(
                    40,
                    (i) => Expanded(
                      child: Container(
                        height: 1,
                        color: i % 2 == 0
                            ? Colors.white.withOpacity(0.5)
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  cert['student']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 4),
                const Text('has successfully completed',
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
                const SizedBox(height: 8),
                Text(
                  cert['course']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),

          // Certificate Footer
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Completion Date',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 2),
                    Text(cert['date']!,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: isDark ? Colors.white : Colors.black87)),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Certificate ID',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 2),
                    Text(cert['id']!,
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: grad[0])),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            const Text('📥 Certificate downloading...'),
                        backgroundColor: grad[0],
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 9),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: grad),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.download_rounded,
                            color: Colors.white, size: 14),
                        SizedBox(width: 5),
                        Text('Download',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROFILE SCREEN
// ============================================================

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    appState.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDarkMode;
    final enrolled = appState.enrolledCourseIds.length;
    final favorites = appState.favoriteCourseIds.length;
    final completed = appState.courseProgress.values
        .where((p) => p >= 1.0)
        .length;

    return MainScaffold(
      currentIndex: 3,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 32),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(44),
                  bottomRight: Radius.circular(44),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.32),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: AppColors.accentGradient,
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 16,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text('AR',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w900)),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: AppColors.success,
                            shape: BoxShape.circle,
                            border: Border.fromBorderSide(
                                BorderSide(color: Colors.white, width: 2)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text('Amit Rajput',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(height: 4),
                  const Text('amit.rajput@gmail.com',
                      style:
                          TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Text('🎓 Pro Learner',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),

            // Stats Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _ProfileStat(
                      value: enrolled.toString(),
                      label: 'Enrolled',
                      icon: Icons.play_lesson_rounded,
                      colors: [AppColors.primary, AppColors.secondary]),
                  const SizedBox(width: 10),
                  _ProfileStat(
                      value: completed.toString(),
                      label: 'Completed',
                      icon: Icons.check_circle_rounded,
                      colors: [
                        AppColors.success,
                        const Color(0xFF00B09B)
                      ]),
                  const SizedBox(width: 10),
                  _ProfileStat(
                      value: favorites.toString(),
                      label: 'Wishlist',
                      icon: Icons.favorite_rounded,
                      colors: [
                        AppColors.accent,
                        const Color(0xFFFF9A3C)
                      ]),
                ],
              ),
            ),
            const SizedBox(height: 22),

            // Settings
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? AppColors.cardDark : Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 14,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _SettingTile(
                      icon: Icons.dark_mode_rounded,
                      title: 'Dark Mode',
                      subtitle: 'Switch app theme',
                      trailing: Switch.adaptive(
                        value: appState.isDarkMode,
                        onChanged: (_) => appState.toggleDarkMode(),
                        activeColor: AppColors.primary,
                      ),
                    ),
                    _Divider(),
                    _SettingTile(
                      icon: Icons.notifications_rounded,
                      title: 'Notifications',
                      subtitle: 'Manage alerts',
                      trailing: const Icon(Icons.chevron_right_rounded,
                          color: Colors.grey),
                    ),
                    _Divider(),
                    _SettingTile(
                      icon: Icons.lock_rounded,
                      title: 'Privacy & Security',
                      subtitle: 'Manage your data',
                      trailing: const Icon(Icons.chevron_right_rounded,
                          color: Colors.grey),
                    ),
                    _Divider(),
                    _SettingTile(
                      icon: Icons.help_outline_rounded,
                      title: 'Help & Support',
                      subtitle: '24/7 assistance',
                      trailing: const Icon(Icons.chevron_right_rounded,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22),

            // Sign Out
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('👋 Logged out successfully'),
                      backgroundColor: AppColors.accent,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    gradient: AppColors.accentGradient,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accent.withOpacity(0.32),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_rounded, color: Colors.white),
                      SizedBox(width: 8),
                      Text('Sign Out',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final List<Color> colors;

  const _ProfileStat({
    required this.value,
    required this.label,
    required this.icon,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: colors[0].withOpacity(0.32),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(height: 7),
            Text(value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900)),
            Text(label,
                style:
                    const TextStyle(color: Colors.white70, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget trailing;

  const _SettingTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDarkMode;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isDark ? Colors.white : Colors.black87)),
                Text(subtitle,
                    style: TextStyle(
                        fontSize: 11, color: Colors.grey[500])),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Divider(height: 1, color: Colors.grey.withOpacity(0.15)),
    );
  }
}