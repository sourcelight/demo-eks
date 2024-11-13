package rick.example.demo.eks.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import rick.example.demo.eks.entity.Book;

public interface BookRepository extends JpaRepository<Book, Long> {
}