import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomePage(
        title: "Demo",
      ),
    );
  }
}

class Order {
  DateTime _dt;
  String _description;
  double _total;
  Order(this._dt, this._description, this._total);

  double get total => _total;
  String get description => _description;
  DateTime get dt => _dt;
}

class Customer {
  String _name;
  String _location;
  List<Order> _orders;

  Customer(this._name, this._location, this._orders);

  String get name => _name;
  String get location => _location;
  List<Order> get orders => _orders;
}

class HomePage extends StatelessWidget {
  HomePage({Key? key, this.title = ""}) : super(key: key);
  final String title;

  List<Customer> _customerList = [
    Customer("Bike Corp", "Atlanta", [
      Order(DateTime(2018, 11, 17), "Bicycle parts", 197.02),
      Order(DateTime(2018, 12, 1), "Bicycle parts", 107.45),
    ]),
    Customer("Trust Corp", "Atlanta", [
      Order(DateTime(2017, 1, 3), "Shredder parts", 97.02),
      Order(DateTime(2018, 3, 13), "Shredder blade", 7.45),
      Order(DateTime(2018, 5, 2), "Shredder blade", 7.45),
    ]),
    Customer("Jilly Boutique", "Birmingham", [
      Order(DateTime(2018, 1, 3), "Display unit", 97.01),
      Order(DateTime(2018, 3, 3), "Desk unit", 12.25),
      Order(DateTime(2018, 3, 21), "Clothes rack", 97.15),
    ]),
  ];

  void navigateToCustomer(BuildContext context, Customer customer) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CustomerWidget(customer)),
    );
  }

  ListTile createCustomerWidget(BuildContext context, Customer customer) {
    return ListTile(
      title: Text(customer.name),
      subtitle: Text(customer.location),
      trailing: Icon(Icons.arrow_right),
      onTap: () {
        navigateToCustomer(context, customer);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> customerList = List.from(_customerList
        .map((Customer customer) => createCustomerWidget(context, customer)));
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView(
        children: customerList,
      ),
    );
  }
}

class CustomerWidget extends StatelessWidget {
  Customer _customer;
  CustomerWidget(this._customer);

  ListTile createOrderListWidget(
      BuildContext context, Customer customer, Order order) {
    return ListTile(
      title: Text(order.description),
      subtitle: Text(
          "${order.dt.month}/${order.dt.day}/${order.dt.year}: \$${order.total}"),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = List.from(_customer.orders.map(
        (Order order) => createOrderListWidget(context, _customer, order)));
    widgetList.insert(
        0,
        Container(
          child: Column(
            children: [
              Text(
                _customer.name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                _customer.location,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "${_customer.orders.length} Orders",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          padding: EdgeInsets.all(20),
        ));
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: ListView(
        children: widgetList,
      ),
    );
  }
}
