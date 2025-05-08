package com.messtrackerSpring.entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "messfood", // Aapke table ka naam
uniqueConstraints = {
    @UniqueConstraint(columnNames = {"date", "login_id"}) // <<< YEH LINE ADD KAREIN
}
)
public class messEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column (name="date")
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate date;
	
	@Column (name="status", length = 255)
	private String status;
	
	@Column (name="mealtype", length = 255)
	private String mealType;
	
	@Column (name="notype", length = 255)
	private String notype;
	
	  @ManyToOne
	    @JoinColumn(name = "login_id") // foreign key column
	    private loginEntity entity;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMealType() {
		return mealType;
	}

	public void setMealType(String mealType) {
		this.mealType = mealType;
	}

	public String getNotype() {
		return notype;
	}

	public void setNotype(String notype) {
		this.notype = notype;
	}

	public loginEntity getEntity() {
		return entity;
	}

	public void setEntity(loginEntity entity) {
		this.entity = entity;
	}	
	
	
	

}
