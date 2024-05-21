package ua.khpi.rz.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RefDiag {
    @Id
    private long diagId;

    private String descr;
    private Date timeEst;

    @OneToMany(mappedBy = "refDiag", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Medicine> medicines;
}
