package dao;
/*DTO(Data Transfer Object)
계층간 데이터 교환을 하기 위해 사용하는 객체 
로직을 가지지 않는 순수한 데이터 객체. getter, setter만을 가진 클래스*/

/*VO(Value Object)
데이터 값을 위해 쓰는 객체
read-only 읽기만 가능하도록 만드는 특징*/ 

/*DAO(Data Access Object),Repository
비지니스 로직을 처리하는 클래스 
DB에서 데이터를 가지고 오는 역할 및
데이터를 수정하는 역할
*/

import java.util.ArrayList;
import dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
public ProductRepository() {
	Product phone = new Product("P1234", "iPhone 6s" , 800000);
	phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
	phone.setCategory("Smart Phone");
	phone.setManufacturer("Apple");
	phone.setUnitsInStock(1000);
	phone.setCondition("NEW");
	phone.setFilename("P1234.PNG");
	
	Product laptop = new Product("P1235", "LG PC그램" , 1500000);
	laptop.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
	laptop.setCategory("Laptop");
	laptop.setManufacturer("LG");
	laptop.setUnitsInStock(1000);
	laptop.setCondition("Refurbished");
	laptop.setFilename("P1235.PNG");
	
	Product tablet = new Product("P1236", "Galaxy Tab S" , 900000);
	tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor");
	tablet.setCategory("Tablet");
	tablet.setManufacturer("SAMSUNG");
	tablet.setUnitsInStock(1000);
	tablet.setCondition("Old");
	tablet.setFilename("P1236.PNG");
	
	listOfProducts.add(phone);
	listOfProducts.add(laptop);
	listOfProducts.add(tablet);
		
}
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	//아이디를 이용하여 상품객체 반환
	public Product getProductById(String productId) {
		Product productById = null;
		for(int i =0; i < listOfProducts.size(); i++ ) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
}






















