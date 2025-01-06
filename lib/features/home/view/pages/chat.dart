import 'package:chateo/core/constants/constants.dart';
import 'package:chateo/core/themes/app_theme.dart';
import 'package:chateo/core/widgets/textfield_widget.dart';
import 'package:chateo/features/auth/controller/auth_controller.dart';
import 'package:chateo/features/home/view/widgets/user_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Chat extends ConsumerWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(constantsProvider);
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spacer = AppTheme.of(context).spaces;
    return Scaffold(
      backgroundColor: colors.secondary,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width / 28),
          child: Text(
            constants.txtChat,
            style: typography.h800,
          ),
        ),
        backgroundColor: colors.secondary,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width / 13),
        child: Column(
          children: [
            // const Divider(),
            const SizedBox(
              height: 10,
            ),
            TextfieldWidget(
              label: constants.txtSearchHintText,
              icon:
                  const Image(image: AssetImage("assets/icons/ic_search.png")),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 500,
              child: StreamBuilder(
                  stream:
                      ref.read(authControllerProvider.notifier).getUserStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("An error occured"),
                      );
                    }
                    if (!snapshot.hasData) {
                      const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return  UserListWidget(
                          user: snapshot.data![index],
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
