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
@Table(name = "APPOINTMENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Appointment.findAll", query = "SELECT a FROM Appointment a")
    , @NamedQuery(name = "Appointment.findByAppointmentId", query = "SELECT a FROM Appointment a WHERE a.appointmentId = :appointmentId")
    , @NamedQuery(name = "Appointment.findByAppointmentDate", query = "SELECT a FROM Appointment a WHERE a.appointmentDate = :appointmentDate")
    , @NamedQuery(name = "Appointment.findByAppointmentTime", query = "SELECT a FROM Appointment a WHERE a.appointmentTime = :appointmentTime")
    , @NamedQuery(name = "Appointment.findByAppointmentRequesttype", query = "SELECT a FROM Appointment a WHERE a.appointmentRequesttype = :appointmentRequesttype")
    , @NamedQuery(name = "Appointment.findByAppointmentServicestr", query = "SELECT a FROM Appointment a WHERE a.appointmentServicestr = :appointmentServicestr")
    , @NamedQuery(name = "Appointment.findByAppointmentTotalprice", query = "SELECT a FROM Appointment a WHERE a.appointmentTotalprice = :appointmentTotalprice")
    , @NamedQuery(name = "Appointment.findByAppointmentStatus", query = "SELECT a FROM Appointment a WHERE a.appointmentStatus = :appointmentStatus")})
public class Appointment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "APPOINTMENT_ID")
    private String appointmentId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "APPOINTMENT_DATE")
    @Temporal(TemporalType.DATE)
    private Date appointmentDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "APPOINTMENT_TIME")
    @Temporal(TemporalType.TIME)
    private Date appointmentTime;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "APPOINTMENT_REQUESTTYPE")
    private String appointmentRequesttype;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 300)
    @Column(name = "APPOINTMENT_SERVICESTR")
    private String appointmentServicestr;
    @Basic(optional = false)
    @NotNull
    @Column(name = "APPOINTMENT_TOTALPRICE")
    private int appointmentTotalprice;
    @Size(max = 30)
    @Column(name = "APPOINTMENT_STATUS")
    private String appointmentStatus;
    @OneToMany(mappedBy = "appointmentId")
    private Collection<Vehicle> vehicleCollection;
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "CUSTOMER_ID")
    @ManyToOne
    private Customer customerId;
    @JoinColumn(name = "VEHICLE_ID", referencedColumnName = "VEHICLE_ID")
    @ManyToOne
    private Vehicle vehicleId;
    @OneToMany(mappedBy = "appointmentId")
    private Collection<Service> serviceCollection;

    public Appointment() {
    }

    public Appointment(String appointmentId) {
        this.appointmentId = appointmentId;
    }

    public Appointment(String appointmentId, Date appointmentDate, Date appointmentTime, String appointmentRequesttype, String appointmentServicestr, int appointmentTotalprice, String appointmentStatus, Customer customerId, Vehicle vehicleId) {
        this.appointmentId = appointmentId;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.appointmentRequesttype = appointmentRequesttype;
        this.appointmentServicestr = appointmentServicestr;
        this.appointmentTotalprice = appointmentTotalprice;
        this.appointmentStatus = appointmentStatus;
        this.customerId = customerId;
        this.vehicleId = vehicleId;
    }

    public String getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(String appointmentId) {
        this.appointmentId = appointmentId;
    }

    public Date getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(Date appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public Date getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(Date appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getAppointmentRequesttype() {
        return appointmentRequesttype;
    }

    public void setAppointmentRequesttype(String appointmentRequesttype) {
        this.appointmentRequesttype = appointmentRequesttype;
    }

    public String getAppointmentServicestr() {
        return appointmentServicestr;
    }

    public void setAppointmentServicestr(String appointmentServicestr) {
        this.appointmentServicestr = appointmentServicestr;
    }

    public int getAppointmentTotalprice() {
        return appointmentTotalprice;
    }

    public void setAppointmentTotalprice(int appointmentTotalprice) {
        this.appointmentTotalprice = appointmentTotalprice;
    }

    public String getAppointmentStatus() {
        return appointmentStatus;
    }

    public void setAppointmentStatus(String appointmentStatus) {
        this.appointmentStatus = appointmentStatus;
    }

    @XmlTransient
    public Collection<Vehicle> getVehicleCollection() {
        return vehicleCollection;
    }

    public void setVehicleCollection(Collection<Vehicle> vehicleCollection) {
        this.vehicleCollection = vehicleCollection;
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }

    public Vehicle getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(Vehicle vehicleId) {
        this.vehicleId = vehicleId;
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
        hash += (appointmentId != null ? appointmentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Appointment)) {
            return false;
        }
        Appointment other = (Appointment) object;
        if ((this.appointmentId == null && other.appointmentId != null) || (this.appointmentId != null && !this.appointmentId.equals(other.appointmentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Appointment[ appointmentId=" + appointmentId + " ]";
    }
    
}
