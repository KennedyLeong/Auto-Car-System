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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "VEHICLE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Vehicle.findAll", query = "SELECT v FROM Vehicle v")
    , @NamedQuery(name = "Vehicle.findByVehicleId", query = "SELECT v FROM Vehicle v WHERE v.vehicleId = :vehicleId")
    , @NamedQuery(name = "Vehicle.findByVehicleNumber", query = "SELECT v FROM Vehicle v WHERE v.vehicleNumber = :vehicleNumber")
    , @NamedQuery(name = "Vehicle.findByVehicleBrand", query = "SELECT v FROM Vehicle v WHERE v.vehicleBrand = :vehicleBrand")
    , @NamedQuery(name = "Vehicle.findByVehicleType", query = "SELECT v FROM Vehicle v WHERE v.vehicleType = :vehicleType")
    , @NamedQuery(name = "Vehicle.findByVehicleColor", query = "SELECT v FROM Vehicle v WHERE v.vehicleColor = :vehicleColor")
    , @NamedQuery(name = "Vehicle.findByVehicleMileage", query = "SELECT v FROM Vehicle v WHERE v.vehicleMileage = :vehicleMileage")})
public class Vehicle implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "VEHICLE_ID")
    private String vehicleId;
    @Size(max = 50)
    @Column(name = "VEHICLE_NUMBER")
    private String vehicleNumber;
    @Size(max = 30)
    @Column(name = "VEHICLE_BRAND")
    private String vehicleBrand;
    @Size(max = 50)
    @Column(name = "VEHICLE_TYPE")
    private String vehicleType;
    @Size(max = 50)
    @Column(name = "VEHICLE_COLOR")
    private String vehicleColor;
    @Column(name = "VEHICLE_MILEAGE")
    private Integer vehicleMileage;
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "CUSTOMER_ID")
    @ManyToOne
    private Customer customerId;

    public Vehicle() {
    }

    public Vehicle(String vehicleId) {
        this.vehicleId = vehicleId;
    }

    public Vehicle(String vehicleId, String vehicleNumber, String vehicleBrand, String vehicleType, String vehicleColor, int vehicleMileage, Customer customerId) {
        this.vehicleId = vehicleId;
        this.vehicleNumber = vehicleNumber;
        this.vehicleBrand = vehicleBrand;
        this.vehicleType = vehicleType;
        this.vehicleColor = vehicleColor;
        this.vehicleMileage = vehicleMileage;
        this.customerId = customerId;
    }

    public String getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(String vehicleId) {
        this.vehicleId = vehicleId;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public String getVehicleBrand() {
        return vehicleBrand;
    }

    public void setVehicleBrand(String vehicleBrand) {
        this.vehicleBrand = vehicleBrand;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getVehicleColor() {
        return vehicleColor;
    }

    public void setVehicleColor(String vehicleColor) {
        this.vehicleColor = vehicleColor;
    }

    public Integer getVehicleMileage() {
        return vehicleMileage;
    }

    public void setVehicleMileage(Integer vehicleMileage) {
        this.vehicleMileage = vehicleMileage;
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (vehicleId != null ? vehicleId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Vehicle)) {
            return false;
        }
        Vehicle other = (Vehicle) object;
        if ((this.vehicleId == null && other.vehicleId != null) || (this.vehicleId != null && !this.vehicleId.equals(other.vehicleId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Vehicle[ vehicleId=" + vehicleId + " ]";
    }
    
}
