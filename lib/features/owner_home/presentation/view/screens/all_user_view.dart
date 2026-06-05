import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_shot/core/constants/space.dart';
import 'package:snap_shot/features/owner_home/presentation/manager/cubit/get_all_users_cubit.dart';
import 'package:snap_shot/features/owner_home/presentation/view/widgets/all_users_view_widgets/all_users_sliver_list.dart';
import 'package:snap_shot/features/owner_home/presentation/view/widgets/all_users_view_widgets/pagination_indicator.dart';
import 'package:snap_shot/shared/widgets/page_header.dart';
import 'package:snap_shot/shared/widgets/page_padding.dart';

class AllUserView extends StatefulWidget {
  const AllUserView({super.key});

  @override
  State<AllUserView> createState() => _AllUserViewState();
}

class _AllUserViewState extends State<AllUserView> {
  final ScrollController _scrollController = ScrollController();
  bool _isActionFired = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final currentScroll = _scrollController.position.pixels;
    final maxScroll = _scrollController.position.maxScrollExtent;

    if (maxScroll == 0) return;

    final scrollPercentage = (currentScroll / maxScroll) * 100;

    if (scrollPercentage >= 70 && !_isActionFired) {
      final cubit = context.read<GetAllUsersCubit>();

      if (cubit.state is! GetAllUsersPaginationLoading) {
        setState(() {
          _isActionFired = true;
        });

        cubit.getAllUsers(isPagination: true);
      }
    }

    if (scrollPercentage < 65 && _isActionFired) {
      setState(() {
        _isActionFired = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PagePadding(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    AppSpace.instance.topPageSpace,
                    const AppPageTitle(pageTitle: 'All Users', arrowBack: true),
                    AppSpace.instance.v24,
                  ],
                ),
              ),
              const AllUsersSliverList(),
              const AllUsersPaginationCircleIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
