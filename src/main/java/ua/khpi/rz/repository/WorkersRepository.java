package ua.khpi.rz.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ua.khpi.rz.model.Workers;
import java.util.List;

@Repository
public interface WorkersRepository extends CrudRepository<Workers, Long> {

    @Query(value = "SELECT * FROM public.workers WHERE first_name LIKE '%ROY%'", nativeQuery = true)
    List<Workers> findAllRoys();
}
