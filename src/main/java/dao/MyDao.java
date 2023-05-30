package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import dto.Doctor;
import dto.Staff;

public class MyDao {
  
	EntityManagerFactory factory=Persistence.createEntityManagerFactory("dev");
	EntityManager manager=factory.createEntityManager();
	EntityTransaction transcation=manager.getTransaction();
	
	public void saveStaff(Staff staff){
		transcation.begin();
		manager.persist(staff);
		transcation.commit();
	}
    
	public void saveDoctor(Doctor doctor){
		transcation.begin();
		manager.persist(doctor);
		transcation.commit();
		
	}
	
	
}
