import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import '../models/program.dart';
import '../services/program_service.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/program_card.dart';
import 'program_details_screen.dart';

class ProgramListingScreen extends StatefulWidget {
  const ProgramListingScreen({super.key});

  @override
  State<ProgramListingScreen> createState() => _ProgramListingScreenState();
}

class _ProgramListingScreenState extends State<ProgramListingScreen> {
  final ProgramService _programService = ProgramService();
  late Future<List<Program>> _programsFuture;
  final TextEditingController _searchController = TextEditingController();
  String _selectedLevel = 'All Levels';
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _programsFuture = _programService.getPrograms();
    _searchController.addListener(_filterPrograms);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterPrograms() {
    setState(() {
      _isSearching = _searchController.text.isNotEmpty;
    });
  }

  List<Program> _getFilteredPrograms(List<Program> programs) {
    return programs.where((program) {
      final matchesSearch = _searchController.text.isEmpty ||
          program.title.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          program.description.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          program.instructor.toLowerCase().contains(_searchController.text.toLowerCase());

      final matchesLevel = _selectedLevel == 'All Levels' || program.level == _selectedLevel;

      return matchesSearch && matchesLevel;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        title: 'Programs',
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search programs...',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                suffixIcon: _isSearching
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.white70),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.white70),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.white70),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _searchController.clear();
                }
                _isSearching = !_isSearching;
              });
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (String level) {
              setState(() {
                _selectedLevel = level;
              });
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'All Levels',
                  child: Text('All Levels'),
                ),
                const PopupMenuItem<String>(
                  value: 'Beginner',
                  child: Text('Beginner'),
                ),
                const PopupMenuItem<String>(
                  value: 'Intermediate',
                  child: Text('Intermediate'),
                ),
                const PopupMenuItem<String>(
                  value: 'Advanced',
                  child: Text('Advanced'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green, Colors.greenAccent],
          ),
        ),
        child: FutureBuilder<List<Program>>(
          future: _programsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.white,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _programsFuture = _programService.getPrograms();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.green,
                      ),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            final allPrograms = snapshot.data!;
            final programs = _getFilteredPrograms(allPrograms);
            
            if (programs.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.search_off,
                      color: Colors.white,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'No programs found',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: programs.length,
              itemBuilder: (context, index) {
                final program = programs[index];
                return OpenContainer(
                  transitionType: ContainerTransitionType.fadeThrough,
                  openBuilder: (context, _) => ProgramDetailsScreen(),
                  closedElevation: 0,
                  closedColor: Colors.transparent,
                  closedBuilder: (context, openContainer) => ProgramCard(
                    program: program,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/program_details',
                        arguments: program,
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}