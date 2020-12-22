/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author asus
 */
@Entity
@Table(name = "EMPLOYEE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Employee.findAll", query = "SELECT e FROM Employee e")
    , @NamedQuery(name = "Employee.findByStaffId", query = "SELECT e FROM Employee e WHERE e.staffId = :staffId")
    , @NamedQuery(name = "Employee.findByStaffPassword", query = "SELECT e FROM Employee e WHERE e.staffPassword = :staffPassword")
    , @NamedQuery(name = "Employee.findByStaffName", query = "SELECT e FROM Employee e WHERE e.staffName = :staffName")
    , @NamedQuery(name = "Employee.findByStaffPhoneNo", query = "SELECT e FROM Employee e WHERE e.staffPhoneNo = :staffPhoneNo")
    , @NamedQuery(name = "Employee.findByStaffEmail", query = "SELECT e FROM Employee e WHERE e.staffEmail = :staffEmail")
    , @NamedQuery(name = "Employee.findByStaffStatus", query = "SELECT e FROM Employee e WHERE e.staffStatus = :staffStatus")})
public class Employee implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "STAFF_ID")
    private String staffId;
    @Size(max = 50)
    @Column(name = "STAFF_PASSWORD")
    private String staffPassword;
    @Size(max = 50)
    @Column(name = "STAFF_NAME")
    private String staffName;
    @Size(max = 30)
    @Column(name = "STAFF_PHONE_NO")
    private String staffPhoneNo;
    @Size(max = 50)
    @Column(name = "STAFF_EMAIL")
    private String staffEmail;
    @Size(max = 50)
    @Column(name = "STAFF_STATUS")
    private String staffStatus;

    public Employee() {
    }

    public Employee(String staffId) {
        this.staffId = staffId;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getStaffPassword() {
        return staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffPhoneNo() {
        return staffPhoneNo;
    }

    public void setStaffPhoneNo(String staffPhoneNo) {
        this.staffPhoneNo = staffPhoneNo;
    }

    public String getStaffEmail() {
        return staffEmail;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public String getStaffStatus() {
        return staffStatus;
    }

    public void setStaffStatus(String staffStatus) {
        this.staffStatus = staffStatus;
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
        if (!(object instanceof Employee)) {
            return false;
        }
        Employee other = (Employee) object;
        if ((this.staffId == null && other.staffId != null) || (this.staffId != null && !this.staffId.equals(other.staffId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Employee[ staffId=" + staffId + " ]";
    }
    
}
