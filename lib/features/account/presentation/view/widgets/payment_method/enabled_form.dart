import 'package:flutter/material.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/payment_method/add_new_card_form.dart';
import 'package:snap_shot/features/account/presentation/view/widgets/payment_method/add_new_card_tile.dart';

class ExpandableForm extends StatefulWidget {
  const ExpandableForm({super.key});

  @override
  State<ExpandableForm> createState() => _ExpandableFormState();
}

class _ExpandableFormState extends State<ExpandableForm>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _arrowRotation;
  late Animation<double> _expandAnimation;
  late Animation<double> _fadeAnimation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _arrowRotation = Tween<double>(
      begin: 0,
      end: 0.25,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),

      child: Column(
        children: [
          InkWell(
            onTap: _toggleExpand,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: AddNewCardTile(
                isExpanded: _isExpanded,
                turns: _arrowRotation,
              ),
            ),
          ),
          AppSpace.instance.v12,
          SizeTransition(
            sizeFactor: _expandAnimation,
            axisAlignment: -1,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: AddNewCardForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
