package ua.khpi.rz.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ua.khpi.rz.model.Contact;

@Repository
public interface ContactRepository extends CrudRepository<Contact, Double> {

}
