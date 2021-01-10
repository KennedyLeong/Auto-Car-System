/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author asus
 */
@Entity
@Table(name = "STAFF")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Staff.findAll", query = "SELECT s FROM Staff s")
    , @NamedQuery(name = "Staff.findByStaffId", query = "SELECT s FROM Staff s WHERE s.staffId = :staffId")
    , @NamedQuery(name = "Staff.findByStaffName", query = "SELECT s FROM Staff s WHERE s.staffName = :staffName")
    , @NamedQuery(name = "Staff.findByStaffPhoneNumber", query = "SELECT s FROM Staff s WHERE s.staffPhoneNumber = :staffPhoneNumber")
    , @NamedQuery(name = "Staff.findByStaffType", query = "SELECT s FROM Staff s WHERE s.staffType = :staffType")
    , @NamedQuery(name = "Staff.findByStaffEmail", query = "SELECT s FROM Staff s WHERE s.staffEmail = :staffEmail")
    , @NamedQuery(name = "Staff.findByStaffPassword", query = "SELECT s FROM Staff s WHERE s.staffPassword = :staffPassword")
    , @NamedQuery(name = "Staff.findByStaffStatus", query = "SELECT s FROM Staff s WHERE s.staffStatus = :staffStatus")})
public class Staff implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "STAFF_ID")
    private String staffId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "STAFF_NAME")
    private String staffName;
    @Size(max = 30)
    @Column(name = "STAFF_PHONE_NUMBER")
    private String staffPhoneNumber;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "STAFF_TYPE")
    private String staffType;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "STAFF_EMAIL")
    private String staffEmail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "STAFF_PASSWORD")
    private String staffPassword;
    @Size(max = 50)
    @Column(name = "STAFF_STATUS")
    private String staffStatus;
    @OneToMany(mappedBy = "staffId")
    private Collection<Service> serviceCollection;

    public Staff() {
    }

    public Staff(String staffId) {
        this.staffId = staffId;
    }

    public Staff(String staffId, String staffName, String staffPhoneNumber, String staffType, String staffEmail, String staffPassword, String staffStatus) {
        this.staffId = staffId;
        this.staffName = staffName;
        this.staffPhoneNumber = staffPhoneNumber;
        this.staffType = staffType;
        this.staffEmail = staffEmail;
        this.staffPassword = staffPassword;
        this.staffStatus = staffStatus;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffPhoneNumber() {
        return staffPhoneNumber;
    }

    public void setStaffPhoneNumber(String staffPhoneNumber) {
        this.staffPhoneNumber = staffPhoneNumber;
    }

    public String getStaffType() {
        return staffType;
    }

    public void setStaffType(String staffType) {
        this.staffType = staffType;
    }

    public String getStaffEmail() {
        return staffEmail;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public String getStaffPassword() {
        return staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public String getStaffStatus() {
        return staffStatus;
    }

    public void setStaffStatus(String staffStatus) {
        this.staffStatus = staffStatus;
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
        hash += (staffId != null ? staffId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Staff)) {
            return false;
        }
        Staff other = (Staff) object;
        if ((this.staffId == null && other.staffId != null) || (this.staffId != null && !this.staffId.equals(other.staffId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Staff[ staffId=" + staffId + " ]";
    }
    
}
