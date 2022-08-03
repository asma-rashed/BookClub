package com.example.demo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.models.Book;
import com.example.demo.repositories.BookRepository;

@Service
public class BookService {
	private final BookRepository bookRepository;
	public BookService(BookRepository bookRepository) {
		this.bookRepository = bookRepository;
	}
	public List<Book> allBooks(){
		return bookRepository.findAll();
	}
	public Book getBook(Long id) {
		Optional<Book> optionalBook = bookRepository.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		}else {
			return null;
		}
	}
	public Book createBook(Book book) {
		return bookRepository.save(book);
	}
	public Book update(Book book) {
		return bookRepository.save(book);
	}
}
