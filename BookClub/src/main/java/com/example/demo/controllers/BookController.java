package com.example.demo.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.example.demo.models.Book;
import com.example.demo.services.*;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/books")
	public String home(Model model, HttpSession session) {
		if (session.getAttribute("user_id")==null) {
			return "redirect:/";
		}
		model.addAttribute("user", userService.getUser((Long)session.getAttribute("user_id")));
		model.addAttribute("books", bookService.allBooks());
		return "books.jsp";
	}
	@GetMapping("/books/{id}")
	public String view(@PathVariable("id") Long id,Model model, HttpSession session) {
		if(session.getAttribute("user_id")== null) {
			return "redirect:/";
		}
		model.addAttribute("user_id",session.getAttribute("user_id"));
		model.addAttribute("book", bookService.getBook(id));
		return "view.jsp";
	}
	@GetMapping("/books/new")
	public String create(@ModelAttribute("book") Book book, Model model,HttpSession session) {
		model.addAttribute("user", userService.getUser((Long) session.getAttribute("user_id")));
		return "new.jsp";
	}
	@PostMapping("/books/new")
	public String newBook(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model,HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute("user", userService.getUser((Long) session.getAttribute("user_id")));
			return "new.jsp";
		}else {
			bookService.createBook(book);
			return "redirect:/books";
		}
	}
	@GetMapping("/books/edit/{id}")
	public String edit(Model model,@PathVariable("id")Long id,HttpSession session) {
		if(session.getAttribute("user_id")== null) {
			return "redirect:/";
		}
		model.addAttribute("book", bookService.getBook(id));
		return "edit.jsp";
	}
	
	@PostMapping("/books/edit/{id}")
	public String updateBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if(result.hasErrors()) return "editBook.jsp";
		else {
			bookService.update(book);
			return "redirect:/books";
		}
	}
}
