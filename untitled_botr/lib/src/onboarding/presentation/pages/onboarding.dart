import 'package:flutter/material.dart';

import '../../../../shared/presentation/router.dart';
import '../../../auth/presentation/pages/phone_auth.dart';
import '../widgets/animatedText.dart';
import '../widgets/background.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            buildBackground(),
            _buildLogo(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return const Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 50,
        child: Image(
          image: AssetImage('assets/static/botr_logo_white_text.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildAnimatedText(
            controller: _controller1,
            text: 'Welcome to BOTR',
            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
          buildAnimatedText(
            controller: _controller2,
            text:
                'Nurturing Hearts, Renewing Minds: A Journey to Wholeness in Faith and Wellness.',
            textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 12),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PhoneAuthPage(),
                ),
              ),
              child: const Text('Start'),
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
