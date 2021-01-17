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
    , @NamedQuery(name = "Appointment.findByAppointmentRequesttype", query = "SELECT a FROM Appointment a WHERE a.appointmentRequesttype = :appointmentRequesttype")
    , @NamedQuery(name = "Appointment.findByAppointmentServicestr", query = "SELECT a FROM Appointment a WHERE a.appointmentServicestr = :appointmentServicestr")
    , @NamedQuery(name = "Appointment.findByAppointmentStatus", query = "SELECT a FROM Appointment a WHERE a.appointmentStatus = :appointmentStatus")
    , @NamedQuery(name = "Appointment.findByAppointmentTime", query = "SELECT a FROM Appointment a WHERE a.appointmentTime = :appointmentTime")
    , @NamedQuery(name = "Appointment.findByAppointmentTotalprice", query = "SELECT a FROM Appointment a WHERE a.appointmentTotalprice = :appointmentTotalprice")
    , @NamedQuery(name = "Appointment.findByCustomerId", query = "SELECT a FROM Appointment a WHERE a.customerId = :customerId")
    , @NamedQuery(name = "Appointment.findByVehicleId", query = "SELECT a FROM Appointment a WHERE a.vehicleId = :vehicleId")})
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
    @Size(min = 1, max = 30)
    @Column(name = "APPOINTMENT_REQUESTTYPE")
    private String appointmentRequesttype;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 300)
    @Column(name = "APPOINTMENT_SERVICESTR")
    private String appointmentServicestr;
    @Size(max = 30)
    @Column(name = "APPOINTMENT_STATUS")
    private String appointmentStatus;
    @Size(max = 20)
    @Column(name = "APPOINTMENT_TIME")
    private String appointmentTime;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "APPOINTMENT_TOTALPRICE")
    private Double appointmentTotalprice;
    @OneToMany(mappedBy = "appointmentId")
    private Collection<Vehicle> vehicleCollection;
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "CUSTOMER_ID")
    @ManyToOne
    private Customer customerId;
    @JoinColumn(name = "STAFF_ID", referencedColumnName = "STAFF_ID")
    @ManyToOne
    private Staff staffId;
    @JoinColumn(name = "VEHICLE_ID", referencedColumnName = "VEHICLE_ID")
    @ManyToOne
    private Vehicle vehicleId;

    public Appointment() {
    }

    public Appointment(String appointmentId) {
        this.appointmentId = appointmentId;
    }

    public Appointment(String appointmentId, Date appointmentDate, String appointmentRequesttype, String appointmentServicestr, String appointmentStatus, Vehicle vehicleId, Customer customerId, String appointmentTime,   double appointmentTotalprice   ) {
        this.appointmentId = appointmentId;
        this.appointmentDate = appointmentDate;
        this.appointmentRequesttype = appointmentRequesttype;
        this.appointmentServicestr = appointmentServicestr;
        this.appointmentStatus = appointmentStatus;
        this.vehicleId = vehicleId;
        this.customerId = customerId;
        this.appointmentTime = appointmentTime;  
        this.appointmentTotalprice = appointmentTotalprice;     
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

    public String getAppointmentStatus() {
        return appointmentStatus;
    }

    public void setAppointmentStatus(String appointmentStatus) {
        this.appointmentStatus = appointmentStatus;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public Double getAppointmentTotalprice() {
        return appointmentTotalprice;
    }

    public void setAppointmentTotalprice(Double appointmentTotalprice) {
        this.appointmentTotalprice = appointmentTotalprice;
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
