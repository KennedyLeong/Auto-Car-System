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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "SERVICE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Service.findAll", query = "SELECT s FROM Service s")
    , @NamedQuery(name = "Service.findByServiceId", query = "SELECT s FROM Service s WHERE s.serviceId = :serviceId")
    , @NamedQuery(name = "Service.findByServiceDate", query = "SELECT s FROM Service s WHERE s.serviceDate = :serviceDate")
    , @NamedQuery(name = "Service.findByServiceTime", query = "SELECT s FROM Service s WHERE s.serviceTime = :serviceTime")
    , @NamedQuery(name = "Service.findByServiceRequesttype", query = "SELECT s FROM Service s WHERE s.serviceRequesttype = :serviceRequesttype")
    , @NamedQuery(name = "Service.findByServiceStr", query = "SELECT s FROM Service s WHERE s.serviceStr = :serviceStr")
    , @NamedQuery(name = "Service.findByServiceTotalprice", query = "SELECT s FROM Service s WHERE s.serviceTotalprice = :serviceTotalprice")
    , @NamedQuery(name = "Service.findByServiceStatus", query = "SELECT s FROM Service s WHERE s.serviceStatus = :serviceStatus")})
public class Service implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "SERVICE_ID")
    private String serviceId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "SERVICE_DATE")
    @Temporal(TemporalType.DATE)
    private Date serviceDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "SERVICE_TIME")
    @Temporal(TemporalType.TIME)
    private Date serviceTime;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "SERVICE_REQUESTTYPE")
    private String serviceRequesttype;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 300)
    @Column(name = "SERVICE_STR")
    private String serviceStr;
    @Basic(optional = false)
    @NotNull
    @Column(name = "SERVICE_TOTALPRICE")
    private int serviceTotalprice;
    @Size(max = 30)
    @Column(name = "SERVICE_STATUS")
    private String serviceStatus;
    @OneToMany(mappedBy = "serviceId")
    private Collection<Vehicle> vehicleCollection;
    @JoinColumn(name = "APPOINTMENT_ID", referencedColumnName = "APPOINTMENT_ID")
    @ManyToOne
    private Appointment appointmentId;
    @JoinColumn(name = "BAY_ID", referencedColumnName = "BAY_ID")
    @ManyToOne
    private Loadingbay bayId;
    @JoinColumn(name = "STAFF_ID", referencedColumnName = "STAFF_ID")
    @ManyToOne
    private Staff staffId;
    @JoinColumn(name = "VEHICLE_ID", referencedColumnName = "VEHICLE_ID")
    @ManyToOne
    private Vehicle vehicleId;

    public Service() {
    }

    public Service(String serviceId) {
        this.serviceId = serviceId;
    }

    public Service(String serviceId, Date serviceDate, Date serviceTime, String serviceRequesttype, String serviceStr, int serviceTotalprice, String serviceStatus, Loadingbay bayId, Vehicle vehicleId, Staff staffId) {
        this.serviceId = serviceId;
        this.serviceDate = serviceDate;
        this.serviceTime = serviceTime;
        this.serviceRequesttype = serviceRequesttype;
        this.serviceStr = serviceStr;
        this.serviceTotalprice = serviceTotalprice;
        this.serviceStatus = serviceStatus;
        this.bayId = bayId;
        this.vehicleId = vehicleId;
        this.staffId = staffId;
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

    public Date getServiceTime() {
        return serviceTime;
    }

    public void setServiceTime(Date serviceTime) {
        this.serviceTime = serviceTime;
    }

    public String getServiceRequesttype() {
        return serviceRequesttype;
    }

    public void setServiceRequesttype(String serviceRequesttype) {
        this.serviceRequesttype = serviceRequesttype;
    }

    public String getServiceStr() {
        return serviceStr;
    }

    public void setServiceStr(String serviceStr) {
        this.serviceStr = serviceStr;
    }

    public int getServiceTotalprice() {
        return serviceTotalprice;
    }

    public void setServiceTotalprice(int serviceTotalprice) {
        this.serviceTotalprice = serviceTotalprice;
    }

    public String getServiceStatus() {
        return serviceStatus;
    }

    public void setServiceStatus(String serviceStatus) {
        this.serviceStatus = serviceStatus;
    }

    @XmlTransient
    public Collection<Vehicle> getVehicleCollection() {
        return vehicleCollection;
    }

    public void setVehicleCollection(Collection<Vehicle> vehicleCollection) {
        this.vehicleCollection = vehicleCollection;
    }

    public Appointment getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(Appointment appointmentId) {
        this.appointmentId = appointmentId;
    }

    public Loadingbay getBayId() {
        return bayId;
    }

    public void setBayId(Loadingbay bayId) {
        this.bayId = bayId;
    }

    public Staff getStaffId() {
        return staffId;
    }

    public void setStaffId(Staff staffId) {
        this.staffId = staffId;
    }

    public Vehicle getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(Vehicle vehicleId) {
        this.vehicleId = vehicleId;
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
        if (!(object instanceof Service)) {
            return false;
        }
        Service other = (Service) object;
        if ((this.serviceId == null && other.serviceId != null) || (this.serviceId != null && !this.serviceId.equals(other.serviceId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Service[ serviceId=" + serviceId + " ]";
    }
    
}
