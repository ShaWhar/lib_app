import 'package:flutter/material.dart';
import 'package:lib_app/utils/extension.dart';
import '../constant/strings.dart';
import '../pages/search_list_page.dart';

class SearchBarWithMic extends StatelessWidget {
  const SearchBarWithMic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:
      context.getSearchPageBlocInstance().getTextController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: kSearch,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      onChanged: (text) {
        if (text.isNotEmpty) {
          context.getSearchPageBlocInstance().getDebouncer.run(() {
            context
                .getSearchPageBlocInstance()
                .getSearchItemFromNetwork(text, isSubmitted: false);
            context
                .getSearchPageBlocInstance()
                .updateIsSearchingValue();
          });
        }
      },
      onSubmitted: (text) {
        if (text.isNotEmpty) {
          context.navigateToNextScreen(
              context,
              SearchListPage(
                searchTitle: text,
              ));
        }
      },
    );
  }
}