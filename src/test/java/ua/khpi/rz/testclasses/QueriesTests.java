package ua.khpi.rz.testclasses;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import ua.khpi.rz.RzApplication;
import ua.khpi.rz.config.PostgresqlContainerConfig;
import ua.khpi.rz.model.Job;
import ua.khpi.rz.model.Workers;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

@Testcontainers
@SpringBootTest(classes = RzApplication.class)
@ActiveProfiles({"tc", "tc-auto"})
public class QueriesTests extends Common {

    @Container
    public static PostgreSQLContainer<PostgresqlContainerConfig> postgreSQLContainer =
            PostgresqlContainerConfig.getInstance();

    @Test
    @Transactional
    public void testSelectAllFromJob() {
        List<Job> jobs = jobRepository.findAllRecords();
        assertThat(jobs).hasSize(43);
    }

    @Test
    @Transactional
    public void testSelectFirstJobFromJob() {
        Job job = jobRepository.findFirstRecord();
        assertThat(job.getPositionId()).isEqualTo(4001008);
    }

    @Test
    @Transactional
    public void testDistinctPositionsFromJob() {
        List<String> positions = jobRepository.findDistinctPosition();
        assertThat(positions).hasSize(10);
    }

    @Test
    @Transactional
    public void testRetrieveJobByPositionQaEngineer() {
        List<Job> qaEngineers = jobRepository.findAllQAEngineers();
        assertThat(qaEngineers).hasSize(10);
    }

    @Test
    @Transactional
    public void testAllOfficesWithoutManager() {
        List<String> offices = jobRepository.findAllOfficesWithoutManager();
        assertThat(offices).hasSize(2);
        assertThat(offices, hasItem("CRYSTALBRAIN"));
        assertThat(offices, hasItem("TIME IS MONEY"));
    }

    @Test
    @Transactional
    public void testSalaryForPosition() {
        Query nativeQuery = entityManager.createNativeQuery("SELECT worker_id, salary FROM public.job WHERE office = 'CRYSTALBRAIN' AND (position = 'WEB DESIGNER' OR position = 'C# DEVELOPER')");
        List<Object[]> result = nativeQuery.getResultList();

        assertThat(result).hasSize(7);
        assertThat(result, hasItem(arrayContaining(new BigInteger("6001038"), 678.73F)));
    }

    @Test
    @Transactional
    public void testSearchForASpecifiedString() {
        List<Workers> workers = workersRepository.findAllRoys();
        assertThat(workers).hasSize(3);
    }

    @Test
    @Transactional
    public void testSalaryForQA() {
        Query nativeQuery = entityManager.createNativeQuery("SELECT \n" +
                "            COUNT(worker_id) AS count_worker,\n" +
                "            SUM(salary) AS sum_salary,\n" +
                "            AVG(salary) AS avg_salary,\n" +
                "            MIN(salary) AS min_salary,\n" +
                "            MAX(salary) AS max_salary\n" +
                "            FROM \n" +
                "            public.job \n" +
                "            WHERE \n" +
                "            position = 'QA ENGINEER' \n" +
                "            AND office_city = 'ELECTRON'");
        List<Object[]> result = nativeQuery.getResultList();

        assertThat(result, hasItem(arrayContaining(new BigInteger("6"), 3588.26f, 598.0433451334635d, 388.21f, 815.21f)));
    }

    @Test
    @Transactional
    public void testAllGenderCountWorkers() {
        Query nativeQuery = entityManager.createNativeQuery("SELECT gender, COUNT(*) AS count_workers FROM public.workers GROUP BY gender");
        List<Object[]> result = nativeQuery.getResultList();
        assertThat(result).hasSize(4);
        assertThat(result, hasItem(arrayContaining(null, new BigInteger("3"))));
        assertThat(result, hasItem(arrayContaining("U", new BigInteger("1"))));
        assertThat(result, hasItem(arrayContaining("M", new BigInteger("30"))));
        assertThat(result, hasItem(arrayContaining("F", new BigInteger("15"))));
    }
}
