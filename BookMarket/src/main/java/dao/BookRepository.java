package dao;

import java.util.ArrayList;

import dto.Book;
import dto.Book;

public class BookRepository {
	
	private static BookRepository instance =new BookRepository();
	public static BookRepository getInstance() {
		return instance;
	}
	private ArrayList<Book> listOfBooks = new ArrayList<Book>();
	
	
	public BookRepository() {
		Book book1 =new Book("B1234","HTML5+CSS3",15000);
		book1.setDescription("워드나 PPT 문서를 만들 수 있나요? 그러면 문제 없습니다. 지금 바로 웹 페이지 제작에 도전하세요. 지금 당장 컴퓨터가 없어도 괜찮습니다. 코드와 실행화면이 바로 보여서 눈으로만 읽어도 어떻게 작동하는지 쉽게 파악할 수 있는 것은 기본이고, 중간중간 퀴즈를 추가하여 재미있게 게임하듯 복습할 수 있습니다. ");
		book1.setAuthor("황재호");
		book1.setPublisher("한빛 미디어");
		book1.setCategory("Hello Coding");
		book1.setUnitsInStock(1000);
		book1.setTotalPages(700);
		book1.setReleaseDate("8월/22년");
		book1.setCondition("New");
		book1.setFilename("ISBN1234.jpg");
		
		
		Book book2 =new Book("B1235","쉽게 배우는 자바 프로그래밍",15000);
		book2.setDescription("객체지향의 핵심과 자바의 현대적 기능을 충실히 다루면서도 초보자들이 쉽게 학습할 수 있게 구현했습니다. 시각화 도구를 활용한 개념 설명과 군더더기 없는 핵심 코드를 통해 개념과 구현..");
		book2.setAuthor("우종중");
		book2.setPublisher("한빛 미디어");
		book2.setCategory("IT 모바일");
		book2.setUnitsInStock(1000);
		book2.setTotalPages(700);
		book2.setReleaseDate("8월/22년");
		book2.setCondition("New");
		book2.setFilename("ISBN1235.jpg");
		
		Book book3 =new Book("B1236","스프링4 입문",27000);
		book3.setDescription("스프링은 단순히 사용 방법만 익히는 것보다 아키텍처를 어떻게 이해하고 설계하는지가 더 중요합니다. 예제를 복사에서 붙여넣는 식으로는 실제 개발에서 스스로 활용할수 없습니다.");
		book3.setAuthor("하세가와 유이치, 오오노 와타루, 토키 코헤이 (권은철, 전민수)");
		book3.setPublisher("한빛 미디어");
		book3.setCategory("IT 모바일");
		book3.setUnitsInStock(1000);
		book3.setTotalPages(700);
		book3.setReleaseDate("8월/22년");
		book3.setCondition("New");
		book3.setFilename("ISBN1236.jpg");
		
		listOfBooks.add(book1);
		listOfBooks.add(book2);
		listOfBooks.add(book3);
	}
		public ArrayList<Book> getAllBooks() {
			return listOfBooks;
	}
		public Book getBookById(String bookId) {
			Book bookById = null;
			for(int i =0; i < listOfBooks.size(); i++ ) {
				Book book = listOfBooks.get(i);
				if(book != null && book.getBookId() != null && book.getBookId().equals(bookId)) {
					bookById = book;
					break;
				}
			}
			return bookById;
		}	
		
		public void addBook(Book book) {
			listOfBooks.add(book);
		}
}