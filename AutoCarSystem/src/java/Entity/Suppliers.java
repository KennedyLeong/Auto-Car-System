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
@Table(name = "SUPPLIERS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Suppliers.findAll", query = "SELECT s FROM Suppliers s")
    , @NamedQuery(name = "Suppliers.findBySupplierid", query = "SELECT s FROM Suppliers s WHERE s.supplierid = :supplierid")
    , @NamedQuery(name = "Suppliers.findBySuppliername", query = "SELECT s FROM Suppliers s WHERE s.suppliername = :suppliername")
    , @NamedQuery(name = "Suppliers.findBySupplieraddress", query = "SELECT s FROM Suppliers s WHERE s.supplieraddress = :supplieraddress")
    , @NamedQuery(name = "Suppliers.findBySuppliercontact", query = "SELECT s FROM Suppliers s WHERE s.suppliercontact = :suppliercontact")
    , @NamedQuery(name = "Suppliers.findBySuppliertype", query = "SELECT s FROM Suppliers s WHERE s.suppliertype = :suppliertype")})
public class Suppliers implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "SUPPLIERID")
    private String supplierid;
    @Size(max = 50)
    @Column(name = "SUPPLIERNAME")
    private String suppliername;
    @Size(max = 50)
    @Column(name = "SUPPLIERADDRESS")
    private String supplieraddress;
    @Size(max = 50)
    @Column(name = "SUPPLIERCONTACT")
    private String suppliercontact;
    @Size(max = 20)
    @Column(name = "SUPPLIERTYPE")
    private String suppliertype;
    @OneToMany(mappedBy = "supplierid")
    private Collection<Stocks> stocksCollection;

    public Suppliers() {
    }

    public Suppliers(String supplierid) {
        this.supplierid = supplierid;
    }
    
    public Suppliers(String supplierid, String suppliername, String supplieraddress, String suppliercontact, String suppliertype) {
        this.supplierid = supplierid;
        this.suppliername = suppliername;
        this.supplieraddress = supplieraddress;
        this.suppliercontact = suppliercontact;
        this.suppliertype = suppliertype;
    }

    public String getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(String supplierid) {
        this.supplierid = supplierid;
    }

    public String getSuppliername() {
        return suppliername;
    }

    public void setSuppliername(String suppliername) {
        this.suppliername = suppliername;
    }

    public String getSupplieraddress() {
        return supplieraddress;
    }

    public void setSupplieraddress(String supplieraddress) {
        this.supplieraddress = supplieraddress;
    }

    public String getSuppliercontact() {
        return suppliercontact;
    }

    public void setSuppliercontact(String suppliercontact) {
        this.suppliercontact = suppliercontact;
    }

    public String getSuppliertype() {
        return suppliertype;
    }

    public void setSuppliertype(String suppliertype) {
        this.suppliertype = suppliertype;
    }

    @XmlTransient
    public Collection<Stocks> getStocksCollection() {
        return stocksCollection;
    }

    public void setStocksCollection(Collection<Stocks> stocksCollection) {
        this.stocksCollection = stocksCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (supplierid != null ? supplierid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Suppliers)) {
            return false;
        }
        Suppliers other = (Suppliers) object;
        if ((this.supplierid == null && other.supplierid != null) || (this.supplierid != null && !this.supplierid.equals(other.supplierid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Suppliers[ supplierid=" + supplierid + " ]";
    }
    
}
