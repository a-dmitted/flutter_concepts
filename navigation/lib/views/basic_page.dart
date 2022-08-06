import 'package:flutter/material.dart';
import 'package:navigation_concept/models/basic_page_model.dart';

class BasicPage extends StatelessWidget {
  const BasicPage({super.key, required BasicPageModel model}) : _model = model;
  final BasicPageModel _model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                  child: BasicPageContent(model: _model),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BasicPageContent extends StatelessWidget {
  BasicPageContent({super.key, required model}) : _model = model;

  final BasicPageModel _model;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = _model.newRoute;
    return Column(children: [
      ...[
        Text(_model.title, style: Theme.of(context).textTheme.headline6),
        TextField(
          decoration: const InputDecoration(labelText: 'Enter new route'),
          controller: _controller,
        ),
        ElevatedButton(
          onPressed: () {
            _model.newRoute = _controller.text;
            _model.go();
          },
          child: const Text('Go'),
        )
      ].map((w) => Padding(padding: const EdgeInsets.all(8), child: w))
    ]);
  }
}
