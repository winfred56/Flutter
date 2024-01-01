import 'package:flutter/material.dart';

import '../../shared/presentation/extensions.dart';
import '../../shared/presentation/router.dart';
import '../home/presentation/pages/home.dart';

class CongratsPage extends StatefulWidget {
  const CongratsPage({super.key});

  @override
  State<CongratsPage> createState() => _CongratsPageState();
}

class _CongratsPageState extends State<CongratsPage> {
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  @override
  void dispose() {
    _isLoading.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Center(child: Icon(Icons.verified, color: theme.colorScheme.primary, size: 80,),),
              Text('Congratulations', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
              Text('Congratulations! Your request to join Church G has been submitted successfully. We will notify you when your request is approved.', textAlign: TextAlign.center, style: theme.textTheme.bodySmall,),
            const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButtonWithLoading.createWithLoading(
                    onPressed: () async {
                      // Start your logic here
                      _isLoading.value = true;

                      // Simulate some async operation
                      await Future.delayed(
                          const Duration(seconds: 2));

                      // End your logic here
                      _isLoading.value = false;
                      // CustomPageRouteBuilder(const ListPage());
                      if (mounted) {
                        Navigator.push(
                            context,
                            CustomPageRouteBuilder(
                                const HomePage()));
                        //CustomPageRouteBuilder(const ListPage());
                      }
                    },
                    isLoading: _isLoading,
                    child: const Text('Continue')),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 4))
            ]
          ),
        ),
      ),
    );
  }
}
