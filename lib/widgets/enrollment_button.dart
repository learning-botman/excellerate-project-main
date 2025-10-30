import 'package:flutter/material.dart';
import '../models/program.dart';

class EnrollmentService {
  // This would typically be connected to a backend service
  static Future<bool> enrollInProgram(String programId) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}

class EnrollmentButton extends StatefulWidget {
  final Program program;

  const EnrollmentButton({Key? key, required this.program}) : super(key: key);

  @override
  State<EnrollmentButton> createState() => _EnrollmentButtonState();
}

class _EnrollmentButtonState extends State<EnrollmentButton> {
  bool _isLoading = false;

  Future<void> _handleEnrollment() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final success = await EnrollmentService.enrollInProgram(widget.program.id);
      if (success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Successfully enrolled in ${widget.program.title}!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to enroll. Please try again later.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading ? null : _handleEnrollment,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: _isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : const Text(
              'Enroll Now',
              style: TextStyle(fontSize: 18),
            ),
    );
  }
}