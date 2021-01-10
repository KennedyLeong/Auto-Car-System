/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author asus
 */
@Entity
@Table(name = "LOADINGBAY")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Loadingbay.findAll", query = "SELECT l FROM Loadingbay l")
    , @NamedQuery(name = "Loadingbay.findByBayId", query = "SELECT l FROM Loadingbay l WHERE l.bayId = :bayId")
    , @NamedQuery(name = "Loadingbay.findByBayDesc", query = "SELECT l FROM Loadingbay l WHERE l.bayDesc = :bayDesc")
    , @NamedQuery(name = "Loadingbay.findByBayStarttime", query = "SELECT l FROM Loadingbay l WHERE l.bayStarttime = :bayStarttime")
    , @NamedQuery(name = "Loadingbay.findByBayEndtime", query = "SELECT l FROM Loadingbay l WHERE l.bayEndtime = :bayEndtime")
    , @NamedQuery(name = "Loadingbay.findByBayStatus", query = "SELECT l FROM Loadingbay l WHERE l.bayStatus = :bayStatus")})
public class Loadingbay implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "BAY_ID")
    private String bayId;
    @Size(max = 50)
    @Column(name = "BAY_DESC")
    private String bayDesc;
    @Column(name = "BAY_STARTTIME")
    @Temporal(TemporalType.TIME)
    private Date bayStarttime;
    @Column(name = "BAY_ENDTIME")
    @Temporal(TemporalType.TIME)
    private Date bayEndtime;
    @Size(max = 30)
    @Column(name = "BAY_STATUS")
    private String bayStatus;
    @OneToMany(mappedBy = "bayId")
    private Collection<Service> serviceCollection;

    public Loadingbay() {
    }

    public Loadingbay(String bayId, String bayDesc, Date bayStarttime, Date bayEndtime, String bayStatus) {
        this.bayId = bayId;
        this.bayDesc = bayDesc;
        this.bayStarttime = bayStarttime;
        this.bayEndtime = bayEndtime;
        this.bayStatus = bayStatus;
    }

    public String getBayId() {
        return bayId;
    }

    public void setBayId(String bayId) {
        this.bayId = bayId;
    }

    public String getBayDesc() {
        return bayDesc;
    }

    public void setBayDesc(String bayDesc) {
        this.bayDesc = bayDesc;
    }

    public Date getBayStarttime() {
        return bayStarttime;
    }

    public void setBayStarttime(Date bayStarttime) {
        this.bayStarttime = bayStarttime;
    }

    public Date getBayEndtime() {
        return bayEndtime;
    }

    public void setBayEndtime(Date bayEndtime) {
        this.bayEndtime = bayEndtime;
    }

    public String getBayStatus() {
        return bayStatus;
    }

    public void setBayStatus(String bayStatus) {
        this.bayStatus = bayStatus;
    }

    @XmlTransient
    public Collection<Service> getServiceCollection() {
        return serviceCollection;
    }

    public void setServiceCollection(Collection<Service> serviceCollection) {
        this.serviceCollection = serviceCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bayId != null ? bayId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Loadingbay)) {
            return false;
        }
        Loadingbay other = (Loadingbay) object;
        if ((this.bayId == null && other.bayId != null) || (this.bayId != null && !this.bayId.equals(other.bayId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Loadingbay[ bayId=" + bayId + " ]";
    }
    
}
