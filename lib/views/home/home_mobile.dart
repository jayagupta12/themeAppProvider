part of home_view;

class _HomeMobile extends StatefulWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  @override
  __HomeMobileState createState() => __HomeMobileState();
}

class __HomeMobileState extends State<_HomeMobile> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times: ',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              '${widget.viewModel.counter}',
              style: Theme.of(context).textTheme.display1,
            ),
            Checkbox(
                value: themeChange.darkTheme,
                onChanged: (bool value) {
                  themeChange.darkTheme = value;
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: widget.viewModel.increment,
        backgroundColor: Colors.black,
      ),
    );
  }
}
