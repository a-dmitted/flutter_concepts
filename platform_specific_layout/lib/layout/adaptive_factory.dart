import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFactory {
  static late WidgetDesign _widgetDesign;
  static late ThemeData _materialTheme;
  static late CupertinoThemeData _cupertinoTheme;
  static bool _initialized = false;

  AdaptiveFactory({
    required ThemeData materialTheme,
    required CupertinoThemeData cupertinoTheme,
  }) {
    _materialTheme = materialTheme;
    _cupertinoTheme = cupertinoTheme;
    switch (materialTheme.platform) {
      case TargetPlatform.iOS:
        _widgetDesign = WidgetDesign.cupertino;
        break;
      case TargetPlatform.macOS:
        _widgetDesign = WidgetDesign.cupertino;
        break;
      default:
        _widgetDesign = WidgetDesign.material;
    }
    _initialized = true;
  }

  static Widget buildTextButton({
    required VoidCallback onPressed,
    required Widget child,
  }) {
    _checkInitialized();
    return _buildSpecific(
      material: () => TextButton(
        onPressed: onPressed,
        child: child,
      ),
      cupertino: () => CupertinoButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }

  static Widget buildSwitch({
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    _checkInitialized();
    return _buildSpecific(
      material: () => Switch(
        value: value,
        onChanged: onChanged,
      ),
      cupertino: () => CupertinoSwitch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  static Widget buildApp({
    Widget? home,
    String title = '',
  }) {
    _checkInitialized();
    return _buildSpecific(
      material: () => MaterialApp(
        home: home,
        title: title,
        theme: _materialTheme,
      ),
      cupertino: () => CupertinoApp(
        home: home,
        title: title,
        theme: _cupertinoTheme,
      ),
    );
  }

  static Widget buildScaffold({
    required Widget body,
    Widget? title,
  }) {
    _checkInitialized();
    return _buildSpecific(
      material: () => Scaffold(
        appBar: buildAppBar(title: title) as PreferredSizeWidget,
        body: body,
      ),
      cupertino: () => CupertinoPageScaffold(
        navigationBar:
            buildAppBar(title: title) as ObstructingPreferredSizeWidget,
        child: body,
      ),
    );
  }

  static Widget buildAppBar({Widget? title}) {
    _checkInitialized();
    return _buildSpecific(
      material: () => AppBar(
        title: title,
      ),
      cupertino: () => CupertinoNavigationBar(
        middle: title,
      ),
    );
  }

  static Widget buildDropDown({
    required BuildContext context,
    required int value,
    required void Function(int?) onChanged,
    List<DropdownMenuItem<int>>? items,
    required List<TargetPlatform> valuesList,
  }) {
    _checkInitialized();
    const double kItemExtent = 32.0;
    void saveFinal() => onChanged.call(value);
    return _buildSpecific(
      material: () => DropdownButton<int>(
        value: value,
        onChanged: onChanged,
        items: items,
        focusColor: Colors.transparent,
        underline: const SizedBox(),
      ),
      cupertino: () => CupertinoButton(
        padding: EdgeInsets.zero,
        // Display a CupertinoPicker with list of fruits.
        onPressed: () => _showDialog(
            context,
            CupertinoPicker(
              magnification: 1.22,
              squeeze: 1.2,
              useMagnifier: true,
              itemExtent: kItemExtent,
              scrollController: FixedExtentScrollController(initialItem: value),
              // This is called when selected item is changed.
              onSelectedItemChanged: (selectedValue) => value = selectedValue, //onChanged,
              children: List<Widget>.generate(valuesList.length, (int index) {
                return Center(
                  child: Text(
                    valuesList[index].toString(),
                  ),
                );
              }),
            ),
            saveFinal),
        // This displays the selected fruit name.
        child: Text(
          valuesList[value!].toString(),
          style: const TextStyle(
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }

  static Future<void> _showDialog(
      BuildContext context, Widget child, void Function() saveFinal) async {
    await showCupertinoModalPopup<void>(
      semanticsDismissible: true,
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
    saveFinal.call();
  }

  static Widget _buildSpecific({
    required WidgetProvider material,
    required WidgetProvider cupertino,
  }) {
    switch (_widgetDesign) {
      case WidgetDesign.cupertino:
        return cupertino.call();
      case WidgetDesign.material:
        return material.call();
    }
  }

  static void _checkInitialized() {
    if (!_initialized) {
      throw StateError("Even AdaptiveFactory is a static class, "
          "the constructur must be called at least once to init static members");
    }
  }
}

typedef WidgetProvider = Widget Function();

enum WidgetDesign { material, cupertino }
