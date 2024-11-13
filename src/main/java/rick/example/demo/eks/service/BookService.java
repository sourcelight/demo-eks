/**
 * @author: Riccardo_Bruno
 * @project: demo-eks
 */


package rick.example.demo.eks.service;


import org.springframework.stereotype.Service;
import rick.example.demo.eks.entity.Book;
import rick.example.demo.eks.repository.BookRepository;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {

    private final BookRepository bookRepository;

    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    public Optional<Book> getBookById(Long id) {
        return bookRepository.findById(id);
    }

    public Book saveBook(Book book) {
        return bookRepository.save(book);
    }

    public void deleteBook(Long id) {
        bookRepository.deleteById(id);
    }
}