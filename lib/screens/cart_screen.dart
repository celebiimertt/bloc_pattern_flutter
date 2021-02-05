import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/blocs/cart_bloc.dart';


class CartScreen extends StatelessWidget{
  //Stream ile çalıştığımız için gerekli olan noktaları build eder.Bu yüzden StatalessWidget ile çalışabiliriz.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Sepet"),
      ),
      body: StreamBuilder(
        stream: cartBloc.getStream,
        initialData:cartBloc.getCart(),
        builder: (context,snapshot){
          return buildCart(snapshot);
        },
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context,index){
          final cart =snapshot.data;
          return ListTile(
            title: Text(cart[index].product.name),
            subtitle: Text(cart[index].product.price.toString()),
            trailing: IconButton(
              icon:Icon(Icons.remove_shopping_cart),
              onPressed: (){
                cartBloc.RemoveFromCart(cart[index]);
              },
            ),
          );
        });
  }



}