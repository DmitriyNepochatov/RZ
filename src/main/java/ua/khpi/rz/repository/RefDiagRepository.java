package ua.khpi.rz.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ua.khpi.rz.model.RefDiag;

@Repository
public interface RefDiagRepository extends CrudRepository<RefDiag, Long> {

}
