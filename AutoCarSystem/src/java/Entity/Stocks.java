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
@Table(name = "STOCKS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Stocks.findAll", query = "SELECT s FROM Stocks s")
    , @NamedQuery(name = "Stocks.findByStockid", query = "SELECT s FROM Stocks s WHERE s.stockid = :stockid")
    , @NamedQuery(name = "Stocks.findByStocktype", query = "SELECT s FROM Stocks s WHERE s.stocktype = :stocktype")
    , @NamedQuery(name = "Stocks.findByStockdesc", query = "SELECT s FROM Stocks s WHERE s.stockdesc = :stockdesc")
    , @NamedQuery(name = "Stocks.findByTotalamount", query = "SELECT s FROM Stocks s WHERE s.totalamount = :totalamount")
    , @NamedQuery(name = "Stocks.findByUnitprice", query = "SELECT s FROM Stocks s WHERE s.unitprice = :unitprice")})
public class Stocks implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "STOCKID")
    private String stockid;
    @Size(max = 50)
    @Column(name = "STOCKTYPE")
    private String stocktype;
    @Size(max = 50)
    @Column(name = "STOCKDESC")
    private String stockdesc;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "TOTALAMOUNT")
    private Double totalamount;
    @Column(name = "UNITPRICE")
    private Double unitprice;
    @JoinColumn(name = "SUPPLIERID", referencedColumnName = "SUPPLIERID")
    @ManyToOne
    private Suppliers supplierid;

    public Stocks() {
    }

    public Stocks(String stockid) {
        this.stockid = stockid;
    }
    
    public Stocks(String stockid, String stocktype, double totalamount, double unitprice) {
        this.stockid = stockid;
        this.stocktype = stocktype;
        this.totalamount = totalamount;
        this.unitprice = unitprice;
    }

    public String getStockid() {
        return stockid;
    }

    public void setStockid(String stockid) {
        this.stockid = stockid;
    }

    public String getStocktype() {
        return stocktype;
    }

    public void setStocktype(String stocktype) {
        this.stocktype = stocktype;
    }

    public String getStockdesc() {
        return stockdesc;
    }

    public void setStockdesc(String stockdesc) {
        this.stockdesc = stockdesc;
    }

    public Double getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(Double totalamount) {
        this.totalamount = totalamount;
    }

    public Double getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Double unitprice) {
        this.unitprice = unitprice;
    }

    public Suppliers getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Suppliers supplierid) {
        this.supplierid = supplierid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (stockid != null ? stockid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Stocks)) {
            return false;
        }
        Stocks other = (Stocks) object;
        if ((this.stockid == null && other.stockid != null) || (this.stockid != null && !this.stockid.equals(other.stockid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Stocks[ stockid=" + stockid + " ]";
    }
    
}
