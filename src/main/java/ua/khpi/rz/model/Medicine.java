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
public class Medicine {
    @Id
    private long visitId;

    private Date visitDate;
    private Date recoveryDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ref_diag_id")
    private RefDiag refDiag;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "worker_id")
    private Workers worker;
}
