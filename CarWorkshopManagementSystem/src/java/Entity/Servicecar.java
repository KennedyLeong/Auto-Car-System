/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author asus
 */
@Entity
@Table(name = "SERVICECAR")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Servicecar.findAll", query = "SELECT s FROM Servicecar s")
    , @NamedQuery(name = "Servicecar.findByServiceId", query = "SELECT s FROM Servicecar s WHERE s.serviceId = :serviceId")
    , @NamedQuery(name = "Servicecar.findByServiceDate", query = "SELECT s FROM Servicecar s WHERE s.serviceDate = :serviceDate")
    , @NamedQuery(name = "Servicecar.findByServiceDescription", query = "SELECT s FROM Servicecar s WHERE s.serviceDescription = :serviceDescription")
    , @NamedQuery(name = "Servicecar.findByServiceStatus", query = "SELECT s FROM Servicecar s WHERE s.serviceStatus = :serviceStatus")})
public class Servicecar implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "SERVICE_ID")
    private String serviceId;
    @Column(name = "SERVICE_DATE")
    @Temporal(TemporalType.DATE)
    private Date serviceDate;
    @Size(max = 100)
    @Column(name = "SERVICE_DESCRIPTION")
    private String serviceDescription;
    @Size(max = 50)
    @Column(name = "SERVICE_STATUS")
    private String serviceStatus;

    public Servicecar() {
    }

    public Servicecar(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public Date getServiceDate() {
        return serviceDate;
    }

    public void setServiceDate(Date serviceDate) {
        this.serviceDate = serviceDate;
    }

    public String getServiceDescription() {
        return serviceDescription;
    }

    public void setServiceDescription(String serviceDescription) {
        this.serviceDescription = serviceDescription;
    }

    public String getServiceStatus() {
        return serviceStatus;
    }

    public void setServiceStatus(String serviceStatus) {
        this.serviceStatus = serviceStatus;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (serviceId != null ? serviceId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Servicecar)) {
            return false;
        }
        Servicecar other = (Servicecar) object;
        if ((this.serviceId == null && other.serviceId != null) || (this.serviceId != null && !this.serviceId.equals(other.serviceId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Servicecar[ serviceId=" + serviceId + " ]";
    }
    
}
