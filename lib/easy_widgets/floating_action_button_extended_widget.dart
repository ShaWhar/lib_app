import 'package:flutter/material.dart';
import 'package:lib_app/utils/extension.dart';
import '../constant/strings.dart';
import 'easy_text_widget.dart';

class FloatingActionButtonExtended extends StatelessWidget {
  const FloatingActionButtonExtended({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        isExtended: true,
        backgroundColor: Colors.grey,
        label:  const Row(
          children: [
            Icon(Icons.collections_bookmark),
            SizedBox(
              width: 10,
            ),
            EasyTextWidget(
              text: 'Create new',
              color: Colors.white,
            ),
          ],
        ),
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return AlertDialog(
                  backgroundColor: Colors.grey[850],
                  title: const EasyTextWidget(
                    text: 'create' ,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  content: Form(
                    key: context.getShelvesTabBlocInstance().globalFormKey,
                    child: TextFormField(
                      controller: context
                          .getShelvesTabBlocInstance().textEditingController,
                      autofocus: true,
                      validator: (text) {
                        if (text?.isEmpty??true) {
                          return kEmptyCollectionNameWarning;
                        }
                        return null;
                      },
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      color: Colors.amber,
                      onPressed: () {
                        context.navigateBack(context);
                      },
                      child: const EasyTextWidget(text:kCancelText ),
                    ),
                    MaterialButton(
                      color: Colors.white,
                      onPressed: () {
                        if (context
                            .getShelvesTabBlocInstance().globalFormKey
                            .currentState
                            ?.validate() ??
                            false) {
                          context
                              .getShelvesTabBlocInstance()
                              .createShelfBooks(context
                              .getShelvesTabBlocInstance().textEditingController
                              .text);
                          context.navigateBack(context);
                          context.getShelvesTabBlocInstance().textEditingController.clear();

                          // context.navigateBack(context);
                        }
                      },
                      child: const EasyTextWidget(text: kCreateText),
                    ),
                  ],
                );
              });
        }

    );
  }
}
