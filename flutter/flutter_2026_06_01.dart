import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const AIButtonWidget(),
    );
  }
}

class AIButtonWidget extends StatefulWidget {
  const AIButtonWidget({Key? key}) : super(key: key);

  @override
  State<AIButtonWidget> createState() => _AIButtonWidgetState();
}

class _AIButtonWidgetState extends State<AIButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  String _responseText = 'Tap the button to get AI response';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _generateResponse() async {
    setState(() => _isLoading = true);
    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    final apiKey = 'AIzaSyDz7fMJrLNqQWx5Z2tLqJ8K5r9K5L5K5L5K';
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

    try {
      final content = [Content.text('Tell me a short joke')];
      final response = await model.generateContent(content);
      setState(
          () => _responseText = response.text ?? 'No response generated');
    } catch (e) {
      setState(() => _responseText = 'Error: Could not connect to AI');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Button Demo'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue[50]!, Colors.purple[50]!],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: Tween<double>(begin: 1.0, end: 1.1)
                    .animate(_animationController),
                child: GestureDetector(
                  onTap: _isLoading ? null : _generateResponse,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _isLoading
                            ? [Colors.grey[400]!, Colors.grey[600]!]
                            : [Colors.blue[400]!, Colors.purple[400]!],
                      ),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: Circ
