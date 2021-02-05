import 'package:flutter_bloc_pattern/models/product.dart';

class ProductService{
  static List<Product> products= List<Product>();
  ProductService._internal();//Constructer
  static ProductService _singLeton=ProductService._internal();//SingLeton contructer'ı çalıştırıyor.
  //SingLeton bellekte her zaman aynı referansı vermesini sağlar.
  factory ProductService(){
    return _singLeton;//Contructer'ı çağırmak istediğimiz sadece ProductService() yazmamız yeterli hale geldi.
  }

  static List<Product> getAll(){
    products.add(Product(1,"Acer Laptop",6000));
    products.add(Product(1,"Asus Laptop",7000));
    products.add(Product(1,"Hp Laptop",8000));
    return products;
  }
}

/*
NOT: HotRestart yaptığımız stream yenilenmiyor.Hot Restart state yapılarını normalde sıfırlıyor fakat fake dataları sıfırlamıyor.
Değişmeyen yapıya add() dediğimiz için hot restart dediğimizde yeniden ekleme yapıyor.
StreamBuilder initialData()'da ilk kez oluşturduğu zaman getAll() çağırdığı için o da iki kere tetiklenme anlamına geliyor.
Fake data ile çalıştığımız için ve her hot restart'da referansa tekrar ekliyor.
Böyle bir durumla karşılaşmamız normal.

 */