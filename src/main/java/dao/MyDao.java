package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import dto.Doctor;
import dto.Patient;
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
	
	public Staff fetchStaff(long mobile){
		List<Staff> list = manager.createQuery("select x from Staff x where mobile=?1").setParameter(1, mobile).getResultList();
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}
	}
	
	public Staff fetchStaff(String email){
		List<Staff> list = manager.createNativeQuery("select * from staff  where email=?1").setParameter(1, email).getResultList();
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}
	}
	
	public Doctor fetchDoctor(long mobile){
		List<Doctor> list = manager.createQuery("select x from Doctor x where mobile=?1").setParameter(1, mobile).getResultList();
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}
	}
	
	public Doctor fetchDoctor(String email){
		List<Doctor> list = manager.createNativeQuery("select * from doctor where email=?1").setParameter(1, email).getResultList();
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}
	}
//	since id is primarykey we can use find method r else it is not a primary key we use above method
	
	public Staff fetchStaff(int id){
		return manager.find(Staff.class,id);
	}
	public Doctor fetchDoctor(int id){
		return manager.find(Doctor.class,id);
	}
	

	public void updateStaff(Staff staff){
		transcation.begin();
		manager.merge(staff);
		transcation.commit();
	}
    
	public void updateDoctor(Doctor doctor){
		transcation.begin();
		manager.merge(doctor);
		transcation.commit();
		
	
	}
	
	public List<Doctor> fetchalldoctor(){
		return manager.createQuery("select x from Doctor x").getResultList();
	}
	public List<Staff> fetchallstaff(){
		return manager.createQuery("select x from Staff x").getResultList();
	}
	
	public void savePatient(Patient patient){
		transcation.begin();
		manager.persist(patient);
		transcation.commit();
		
	}
	
}
