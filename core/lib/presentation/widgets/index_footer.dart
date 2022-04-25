import 'package:core/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexFooter extends StatelessWidget {
  const IndexFooter({
    required TextEditingController textController,
    Key? key,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, categoryState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              child: TextButton(
                onPressed: () {
                  if (categoryState.page != 1) {
                    if (categoryState.category == 'User') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedUser(_textController.text, 1));
                    } else if (categoryState.category == 'Issues') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedIssues(_textController.text, 1));
                    } else {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedRepo(_textController.text, 1));
                    }
                  }
                },
                child: Text(
                  '<-',
                  style: kHeading6,
                ),
              ),
            ),
            Container(
              width: 50,
              child: TextButton(
                onPressed: () {
                  if (categoryState.page != 1) {
                    if (categoryState.category == 'User') {
                      context.read<CategoryBloc>().add(OnSubmittedUser(
                          _textController.text, categoryState.page - 1));
                    } else if (categoryState.category == 'Issues') {
                      context.read<CategoryBloc>().add(OnSubmittedIssues(
                          _textController.text, categoryState.page - 1));
                    } else {
                      context.read<CategoryBloc>().add(OnSubmittedRepo(
                          _textController.text, categoryState.page - 1));
                    }
                  }
                },
                child: Text(
                  '1',
                  style: kHeading6,
                ),
              ),
            ),
            Container(
              width: 50,
              child: TextButton(
                onPressed: () {
                  if (categoryState.page <= 4 && categoryState.page != 2) {
                    if (categoryState.category == 'User') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedUser(_textController.text, 2));
                    } else if (categoryState.category == 'Issues') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedIssues(_textController.text, 2));
                    } else {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedRepo(_textController.text, 2));
                    }
                  }
                },
                child: Text(
                  (categoryState.page <= 4) ? '2' : '.',
                  style: kHeading6,
                ),
              ),
            ),
            Container(
              width: 50,
              child: TextButton(
                onPressed: () {
                  if (categoryState.page <= 4) {
                    if (categoryState.category == 'User') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedUser(_textController.text, 3));
                    } else if (categoryState.category == 'Issues') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedIssues(_textController.text, 3));
                    } else {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedRepo(_textController.text, 3));
                    }
                  } else {
                    if (categoryState.category == 'User') {
                      context.read<CategoryBloc>().add(OnSubmittedUser(
                          _textController.text, (categoryState.page - 1)));
                    } else if (categoryState.category == 'Issues') {
                      context.read<CategoryBloc>().add(OnSubmittedIssues(
                          _textController.text, (categoryState.page - 1)));
                    } else {
                      context.read<CategoryBloc>().add(OnSubmittedRepo(
                          _textController.text, (categoryState.page - 1)));
                    }
                  }
                },
                child: Text(
                  (categoryState.page <= 4)
                      ? '3'
                      : (categoryState.page - 1).toString(),
                  style: kHeading6,
                ),
              ),
            ),
            Container(
              width: 50,
              child: TextButton(
                onPressed: () {
                  if (categoryState.page < 4) {
                    if (categoryState.category == 'User') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedUser(_textController.text, 4));
                    } else if (categoryState.category == 'Issues') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedIssues(_textController.text, 4));
                    } else {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedRepo(_textController.text, 4));
                    }
                  }
                },
                child: Text(
                  (categoryState.page <= 4)
                      ? '4'
                      : categoryState.page.toString(),
                  style: kHeading6,
                ),
              ),
            ),
            Container(
              width: 50,
              child: TextButton(
                onPressed: () {
                  if (categoryState.page <= 4) {
                    if (categoryState.category == 'User') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedUser(_textController.text, 5));
                    } else if (categoryState.category == 'Issues') {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedIssues(_textController.text, 5));
                    } else {
                      context
                          .read<CategoryBloc>()
                          .add(OnSubmittedRepo(_textController.text, 5));
                    }
                  } else {
                    if (categoryState.category == 'User') {
                      context.read<CategoryBloc>().add(OnSubmittedUser(
                          _textController.text, (categoryState.page + 1)));
                    } else if (categoryState.category == 'Issues') {
                      context.read<CategoryBloc>().add(OnSubmittedIssues(
                          _textController.text, (categoryState.page + 1)));
                    } else {
                      context.read<CategoryBloc>().add(OnSubmittedRepo(
                          _textController.text, (categoryState.page + 1)));
                    }
                  }
                },
                child: Text(
                  (categoryState.page <= 4)
                      ? '5'
                      : (categoryState.page + 1).toString(),
                  style: kHeading6,
                ),
              ),
            ),
            Container(
              width: 50,
              child: TextButton(
                onPressed: () {
                  if (categoryState.category == 'User') {
                    context.read<CategoryBloc>().add(OnSubmittedUser(
                        _textController.text, categoryState.page + 1));
                  } else if (categoryState.category == 'Issues') {
                    context.read<CategoryBloc>().add(OnSubmittedIssues(
                        _textController.text, categoryState.page + 1));
                  } else {
                    context.read<CategoryBloc>().add(OnSubmittedRepo(
                        _textController.text, categoryState.page + 1));
                  }
                },
                child: Text(
                  '->',
                  style: kHeading6,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
