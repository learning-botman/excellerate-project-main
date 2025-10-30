import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/program.dart';

class ProgramService {
  // Singleton pattern
  static final ProgramService _instance = ProgramService._internal();
  factory ProgramService() => _instance;
  ProgramService._internal();

  Future<List<Program>> getPrograms() async {
    try {
      // Load JSON file from assets
      final String response = await rootBundle.loadString('assets/data/programs.json');
      final List<dynamic> data = json.decode(response) as List<dynamic>;
      
      // Convert JSON to List<Program>
      return data.map((json) => Program.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to load programs: $e');
    }
  }

  Future<Program> getProgramById(String id) async {
    try {
      final programs = await getPrograms();
      return programs.firstWhere(
        (program) => program.id == id,
        orElse: () => throw Exception('Program not found'),
      );
    } catch (e) {
      throw Exception('Failed to load program details: $e');
    }
  }
}