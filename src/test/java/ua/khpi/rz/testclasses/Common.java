package ua.khpi.rz.testclasses;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import ua.khpi.rz.repository.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@SpringBootTest
public class Common {
    @Autowired
    protected ContactRepository contactRepository;

    @Autowired
    protected JobRepository jobRepository;

    @Autowired
    protected MedicineRepository medicineRepository;

    @Autowired
    protected RefDiagRepository refDiagRepository;

    @Autowired
    protected WorkersRepository workersRepository;

    @PersistenceContext
    protected EntityManager entityManager;
}
