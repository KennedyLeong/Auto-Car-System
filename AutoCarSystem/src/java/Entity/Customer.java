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
@Table(name = "CUSTOMER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customer.findAll", query = "SELECT c FROM Customer c")
    , @NamedQuery(name = "Customer.findByCustomerId", query = "SELECT c FROM Customer c WHERE c.customerId = :customerId")
    , @NamedQuery(name = "Customer.findByCustomerName", query = "SELECT c FROM Customer c WHERE c.customerName = :customerName")
    , @NamedQuery(name = "Customer.findByCustomerPhoneNumber", query = "SELECT c FROM Customer c WHERE c.customerPhoneNumber = :customerPhoneNumber")
    , @NamedQuery(name = "Customer.findByCustomerAddress", query = "SELECT c FROM Customer c WHERE c.customerAddress = :customerAddress")
    , @NamedQuery(name = "Customer.findByCustomerEmail", query = "SELECT c FROM Customer c WHERE c.customerEmail = :customerEmail")
    , @NamedQuery(name = "Customer.findByCustomerPassword", query = "SELECT c FROM Customer c WHERE c.customerPassword = :customerPassword")})
public class Customer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "CUSTOMER_ID")
    private String customerId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "CUSTOMER_NAME")
    private String customerName;
    @Size(max = 15)
    @Column(name = "CUSTOMER_PHONE_NUMBER")
    private String customerPhoneNumber;
    @Size(max = 99)
    @Column(name = "CUSTOMER_ADDRESS")
    private String customerAddress;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "CUSTOMER_EMAIL")
    private String customerEmail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "CUSTOMER_PASSWORD")
    private String customerPassword;
    @OneToMany(mappedBy = "customerId")
    private Collection<Vehicle> vehicleCollection;
    @OneToMany(mappedBy = "customerId")
    private Collection<Appointment> appointmentCollection;

    public Customer() {
    }

    public Customer(String customerId) {
        this.customerId = customerId;
    }

    public Customer(String customerId, String customerName, String customerPhoneNumber, String customerAddress, String customerEmail, String customerPassword) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.customerPhoneNumber = customerPhoneNumber;
        this.customerAddress = customerAddress;
        this.customerEmail = customerEmail;
        this.customerPassword = customerPassword;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPhoneNumber() {
        return customerPhoneNumber;
    }

    public void setCustomerPhoneNumber(String customerPhoneNumber) {
        this.customerPhoneNumber = customerPhoneNumber;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    @XmlTransient
    public Collection<Vehicle> getVehicleCollection() {
        return vehicleCollection;
    }

    public void setVehicleCollection(Collection<Vehicle> vehicleCollection) {
        this.vehicleCollection = vehicleCollection;
    }

    @XmlTransient
    public Collection<Appointment> getAppointmentCollection() {
        return appointmentCollection;
    }

    public void setAppointmentCollection(Collection<Appointment> appointmentCollection) {
        this.appointmentCollection = appointmentCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (customerId != null ? customerId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customer)) {
            return false;
        }
        Customer other = (Customer) object;
        if ((this.customerId == null && other.customerId != null) || (this.customerId != null && !this.customerId.equals(other.customerId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Customer[ customerId=" + customerId + " ]";
    }
    
}
