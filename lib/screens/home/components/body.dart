import 'package:case_study/models/user_pagination_model.dart';
import 'package:case_study/screens/home/components/user_menu.dart';
import 'package:case_study/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userPaginationModelProvider = FutureProvider<UserPaginationModel>((ref) async {
  final userService = UserService();
  return userService.getUserWithPagination(1);
});

class Body extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<UserPaginationModel> userPaginationModelAsync = ref.watch(userPaginationModelProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: userPaginationModelAsync.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => Center(
                child: Text('Error: $error'),
              ),
              data: (userPaginationModel) => ListView.builder(
                shrinkWrap: true,
                itemCount: userPaginationModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: UserMenu(
                      firstName: userPaginationModel.data?[index].firstName ?? "Unknown",
                      lastName: userPaginationModel.data?[index].lastName ?? "Unknown",
                      avatar: userPaginationModel.data?[index].avatar ?? "Unknown",
                      email: userPaginationModel.data?[index].email ?? "Unknown",
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

}
