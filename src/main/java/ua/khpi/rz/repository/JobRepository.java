package ua.khpi.rz.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ua.khpi.rz.model.Job;
import java.util.List;

@Repository
public interface JobRepository extends CrudRepository<Job, Long> {

    @Query(value = "SELECT * FROM public.job", nativeQuery = true)
    List<Job> findAllRecords();

    @Query(value = "SELECT * FROM public.job LIMIT 1", nativeQuery = true)
    Job findFirstRecord();

    @Query(value = "SELECT DISTINCT position FROM public.job", nativeQuery = true)
    List<String> findDistinctPosition();

    @Query(value = "SELECT * FROM public.job WHERE position = 'QA ENGINEER'", nativeQuery = true)
    List<Job> findAllQAEngineers();

    @Query(value = "SELECT DISTINCT office FROM public.job WHERE manager_id = 0", nativeQuery = true)
    List<String> findAllOfficesWithoutManager();
}
