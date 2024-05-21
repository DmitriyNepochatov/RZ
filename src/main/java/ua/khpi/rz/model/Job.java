package ua.khpi.rz.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Job  {

    @Id
    private long positionId;

    private String position;
    private float salary;
    private Date fromDate;
    private String office;
    private String officeCity;
    private Date toDate;
    private String activeIndctr;
    private long managerId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "worker_id")
    private Workers worker;
}
