import 'package:flutter/material.dart';
import '../models/program.dart';
import '../services/program_service.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/program_card.dart';

class MyProgramsScreen extends StatefulWidget {
  const MyProgramsScreen({super.key});

  @override
  State<MyProgramsScreen> createState() => _MyProgramsScreenState();
}

class _MyProgramsScreenState extends State<MyProgramsScreen> {
  final ProgramService _programService = ProgramService();
  late Future<List<Program>> _enrolledProgramsFuture;

  @override
  void initState() {
    super.initState();
    // TODO: Replace with actual enrolled programs fetch
    _enrolledProgramsFuture = _programService.getPrograms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(
        title: 'My Programs',
        centerTitle: false,
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
          future: _enrolledProgramsFuture,
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
                          _enrolledProgramsFuture = _programService.getPrograms();
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

            final programs = snapshot.data!;
            
            if (programs.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.school_outlined,
                      color: Colors.white,
                      size: 64,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'No enrolled programs yet',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Explore our programs and start learning!',
                      style: TextStyle(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/program_listing');
                      },
                      icon: const Icon(Icons.search),
                      label: const Text('Browse Programs'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
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
                return ProgramCard(
                  program: program,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/program_details',
                      arguments: program,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}