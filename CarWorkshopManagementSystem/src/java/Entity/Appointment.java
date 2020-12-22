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
@Table(name = "APPOINTMENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Appointment.findAll", query = "SELECT a FROM Appointment a")
    , @NamedQuery(name = "Appointment.findByAppointmentId", query = "SELECT a FROM Appointment a WHERE a.appointmentId = :appointmentId")
    , @NamedQuery(name = "Appointment.findByAppointmentDate", query = "SELECT a FROM Appointment a WHERE a.appointmentDate = :appointmentDate")
    , @NamedQuery(name = "Appointment.findByAppointmentStatus", query = "SELECT a FROM Appointment a WHERE a.appointmentStatus = :appointmentStatus")
    , @NamedQuery(name = "Appointment.findByAppointmentDescription", query = "SELECT a FROM Appointment a WHERE a.appointmentDescription = :appointmentDescription")
    , @NamedQuery(name = "Appointment.findByAppointmentVehicleNumber", query = "SELECT a FROM Appointment a WHERE a.appointmentVehicleNumber = :appointmentVehicleNumber")
    , @NamedQuery(name = "Appointment.findByAppointmentVehicleType", query = "SELECT a FROM Appointment a WHERE a.appointmentVehicleType = :appointmentVehicleType")
    , @NamedQuery(name = "Appointment.findByAppointmentCustomerName", query = "SELECT a FROM Appointment a WHERE a.appointmentCustomerName = :appointmentCustomerName")
    , @NamedQuery(name = "Appointment.findByAppointmentCustomerPhoneNo", query = "SELECT a FROM Appointment a WHERE a.appointmentCustomerPhoneNo = :appointmentCustomerPhoneNo")})
public class Appointment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "APPOINTMENT_ID")
    private String appointmentId;
    @Column(name = "APPOINTMENT_DATE")
    @Temporal(TemporalType.DATE)
    private Date appointmentDate;
    @Size(max = 50)
    @Column(name = "APPOINTMENT_STATUS")
    private String appointmentStatus;
    @Size(max = 100)
    @Column(name = "APPOINTMENT_DESCRIPTION")
    private String appointmentDescription;
    @Size(max = 10)
    @Column(name = "APPOINTMENT_VEHICLE_NUMBER")
    private String appointmentVehicleNumber;
    @Size(max = 20)
    @Column(name = "APPOINTMENT_VEHICLE_TYPE")
    private String appointmentVehicleType;
    @Size(max = 50)
    @Column(name = "APPOINTMENT_CUSTOMER_NAME")
    private String appointmentCustomerName;
    @Size(max = 30)
    @Column(name = "APPOINTMENT_CUSTOMER_PHONE_NO")
    private String appointmentCustomerPhoneNo;

    public Appointment() {
    }

    public Appointment(String appointmentId) {
        this.appointmentId = appointmentId;
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

    public String getAppointmentStatus() {
        return appointmentStatus;
    }

    public void setAppointmentStatus(String appointmentStatus) {
        this.appointmentStatus = appointmentStatus;
    }

    public String getAppointmentDescription() {
        return appointmentDescription;
    }

    public void setAppointmentDescription(String appointmentDescription) {
        this.appointmentDescription = appointmentDescription;
    }

    public String getAppointmentVehicleNumber() {
        return appointmentVehicleNumber;
    }

    public void setAppointmentVehicleNumber(String appointmentVehicleNumber) {
        this.appointmentVehicleNumber = appointmentVehicleNumber;
    }

    public String getAppointmentVehicleType() {
        return appointmentVehicleType;
    }

    public void setAppointmentVehicleType(String appointmentVehicleType) {
        this.appointmentVehicleType = appointmentVehicleType;
    }

    public String getAppointmentCustomerName() {
        return appointmentCustomerName;
    }

    public void setAppointmentCustomerName(String appointmentCustomerName) {
        this.appointmentCustomerName = appointmentCustomerName;
    }

    public String getAppointmentCustomerPhoneNo() {
        return appointmentCustomerPhoneNo;
    }

    public void setAppointmentCustomerPhoneNo(String appointmentCustomerPhoneNo) {
        this.appointmentCustomerPhoneNo = appointmentCustomerPhoneNo;
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
