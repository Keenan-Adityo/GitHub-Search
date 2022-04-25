import 'package:core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Server Error',
            style: kHeading5.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'Please Slow Down',
            style: kHeading5.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()));
  }
}

class EmptyIndicator extends StatelessWidget {
  const EmptyIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        child: Center(
            child: Text(
      'Empty',
      style: kHeading5.copyWith(fontWeight: FontWeight.bold),
    )));
  }
}
