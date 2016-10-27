package com.ripperfit.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ripperfit.model.ApproveRequest;
import com.ripperfit.model.Employee;
import com.ripperfit.model.ResourceRequest;

/**
 * 
 * Repository class to handle requests approval
 */
@Repository
public class ApproveeRequestDaoImpl implements ApproveeRequestDao  {

	private SessionFactory sessionFactory;

	/**
	 * method to get SessionFactory object
	 * @return : SessionFactory object
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * method to set SessionFactory object
	 * @param sessionFactory
	 */
	@Autowired(required=true)
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * 
	 * @param approveRequest
	 * @return true if request added for approval else false
	 */
	public boolean addApproveeRequest(ApproveRequest approveRequest) {

		try {
			Session session = this.sessionFactory.getCurrentSession();
			session.save(approveRequest);
			return true;
		} catch(Exception e) {
			throw e;
		}finally{
			
		}
	}

	/**
	 * 
	 * @param approveeRequest
	 * @return true if request is updated by the approval
	 */
	public boolean updateApproveeRequestByRequestId(ApproveRequest approveeRequest){

		try{
			Session session = this.sessionFactory.getCurrentSession();
			Query q = session.createQuery("update ApproveRequest set employee= :employee,employeeToForward= :employeeToForward"
					+ " where resourceRequest= :resourceRequest");
			q.setParameter("employee", approveeRequest.getEmployee());
			q.setParameter("employeeToForward", approveeRequest.getEmployeeToForward());
			q.setParameter("resourceRequest", approveeRequest.getResourceRequest());
			q.executeUpdate();
			return true;
		}catch(Exception ex){
			throw ex;
		}finally{
			
		}
	}

	/**
	 * 
	 * @param employeeToForward
	 * @return ResourceRequest by its forward to id
	 */
	@SuppressWarnings("unchecked")
	public List<ResourceRequest> getResourceRequestListByForwardToId(Employee employeeToForward){

		try{
			Session session = this.sessionFactory.getCurrentSession();
			Query query = session.createQuery("from ApproveRequest where employeeToForward= :employeeToForward"); 
			query.setParameter("employeeToForward", employeeToForward);

			List<ApproveRequest> approveRequestList = query.list();
			List<ResourceRequest> resourceRequestList = new ArrayList<ResourceRequest>();

			for (ApproveRequest approveRequest : approveRequestList) {
				resourceRequestList.add(approveRequest.getResourceRequest());
			}
			return resourceRequestList;
		}catch(Exception ex){
			throw ex;
		}finally{
			
		}
	}

	/**
	 * 
	 * @param employee
	 * @return the request by id of the approvee
	 */
	public ApproveRequest getApproveeRequestByApproveeId(Employee employee){
		
		try{
			Session session = this.sessionFactory.getCurrentSession();
			Query query = session.createQuery("from ApproveRequest where employee= :employee"); 
			query.setParameter("employee", employee);
			return (ApproveRequest) query.uniqueResult();
		}catch(Exception ex){
			throw ex;
		}finally{
			
		}
	}

	/**
	 * 
	 * @param resourceRequest
	 * @return the request by id of the request
	 */
	public ApproveRequest getApproveeRequestByRequestId(ResourceRequest resourceRequest){
		
		try{
			Session session = this.sessionFactory.getCurrentSession();
			Query query = session.createQuery("from ApproveRequest where resourceRequest= :resourceRequest"); 
			query.setParameter("resourceRequest", resourceRequest);
			return (ApproveRequest) query.uniqueResult();
		}catch(Exception ex){
			throw ex;
		}finally{
			
		}
	}	

	/**
	 * 
	 * @param resourceRequest
	 * @return the employee which approved the request 
	 */
	public Employee getApproveeEmployeeByRequestId(ResourceRequest resourceRequest){
		
		try{
			Session session = this.sessionFactory.getCurrentSession();
			Query query = session.createQuery("from ApproveRequest where resourceRequest= :resourceRequest"); 
			query.setParameter("resourceRequest", resourceRequest);
			ApproveRequest approveeRequest = (ApproveRequest) query.uniqueResult(); 
			return approveeRequest.getEmployee();
		}catch(Exception ex){
			throw ex;
		}finally{
			
		}
	}
}
