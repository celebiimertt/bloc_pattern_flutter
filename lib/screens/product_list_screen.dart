import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/blocs/cart_bloc.dart';
import 'package:flutter_bloc_pattern/blocs/product_bloc.dart';
import 'package:flutter_bloc_pattern/models/cart.dart';

class ProductListScreen extends StatelessWidget{
  //Stream ile çalıştığımız için gerekli olan noktaları build eder.Bu yüzden StatalessWidget ile çalışabiliriz.
  //Stream her değiştiğinde,tetiklendiğinde build tekrar çalışır.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş"),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: ()=>Navigator.pushNamed(context, "/cart")
          )
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
      initialData: productBloc.getAll(),//Başlangıç datamız
      stream: productBloc.getStream,
      builder: (context,snapshot){//snapshot streamden gelen son görüntüdür

        return snapshot.data.length>0?buildProductListItems(snapshot):Center(child: Text("Data yok")); //Gelen data 0'dan büyükse yani data varsa
      },

    );
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder:(BuildContext context, index){
          final list = snapshot.data; //Sonradan referansını değiştirmeyeceğimiz için final olarak verebiliriz.
          return ListTile(
            title:Text(list[index].name),
            subtitle:Text(list[index].price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed:(){cartBloc.addToCart(Cart(list[index],1));}
            ),
          );
        }
    );
  }



}