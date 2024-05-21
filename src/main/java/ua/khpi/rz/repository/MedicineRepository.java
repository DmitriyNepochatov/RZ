package ua.khpi.rz.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ua.khpi.rz.model.Medicine;

@Repository
public interface MedicineRepository extends CrudRepository<Medicine, Long> {

}
