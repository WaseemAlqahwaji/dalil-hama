import 'package:core_package/core_package.dart';
import 'package:core_package/generated/core_translation/core_translations.dart';
import 'package:dalil_hama/features/auth/domain/repository/auth_repository.dart';
import 'package:dalil_hama/features/auth/presentation/page/auth_login_page.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/core/presentation/widgets/bloc_consumers/user_builder.dart';
import 'package:dalil_hama/features/core/presentation/widgets/dialogs/dialog_util.dart';
import 'package:dalil_hama/injection.dart';
import 'package:dalil_hama/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserProfileCard extends StatefulWidget {
  const UserProfileCard({super.key});

  @override
  State<UserProfileCard> createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  @override
  Widget build(BuildContext context) {
    return UserBuilder(
      unAuthWidget: Column(
        children: [
          InkWellWithoutFeedback(
            onTap: () {
              context.push(AuthLoginPage.path);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).appSchema.shapeColor.borderColor,
                ),
              ),
              child: Text(
                context.translation.login,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ],
      ),
      builder: (context, user) {
        return CustomCardWidget(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ListTile(
                  title: Text(context.translation.username),
                  subtitle: Text(user.username),
                ),
                ListTile(
                  title: Text(context.translation.email),
                  subtitle: Text(user.email),
                ),
                ElevatedButton(
                  onPressed: () {
                    PopUps(
                      context: context,
                      onAccept: () {
                        getIt<AuthRepository>().logout();
                      },
                    ).showConfirmDialog(
                      description: CoreTranslations.of(
                        context,
                      )!.doUWantToLogOut,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).appSchema.red,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: Text(context.translation.logOut)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
