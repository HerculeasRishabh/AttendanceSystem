package servletPckg;

import java.io.IOException;


import java.io.*;
import dbQueries.DB_Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DB_Queries
 */
//@WebServlet("/DB_Queries")
public class DB_Queries extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   /* public DB_Queries() {
        super();
        // TODO Auto-generated constructor stub
    }*/

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	    
	    response.setContentType("text/html");
	    
	    PrintWriter out = response.getWriter();
	    
	    String enroll = request.getParameter("Enroll_no");
	    String batch = request.getParameter("Batch");
	    String date = request.getParameter("Date");
	    
	    int lect_no = Integer.parseInt(request.getParameter("Lecture"));
	    
	    String atndnc = request.getParameter("Attendance");
	    
	    //Passing these values to the DB_Connection file
	    DB_Connection obj = new DB_Connection();
	    
	    obj.insert_Atdnc(enroll, batch, date, lect_no, atndnc);
	    
	    out.println("<h1>DONE!!!</h1>");
	}*/

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	    //Function to store value in TEMP_ATDNC
	    insertIntoTEMP_ATDNC(request, response);
	}
	
	
	/*
	 * Function definition
	 * 
	 * @input parm:
	 *     request, response
	 * @output parm:
	 *     void
	 *     
	 * Process:
	 *     1. Delete everything from TEMP_ATDNC.
	 *     2. Set Auto_Increment to 1.
	 *     3. Insert new values.
	 */
	protected void insertIntoTEMP_ATDNC(HttpServletRequest request, HttpServletResponse response) throws IOException{
	    response.setContentType("text/html; charset = UTF-8");
	    
	    HttpSession session = request.getSession();
	    
	    PrintWriter out = response.getWriter();
	    int i, lect_no;
	    String date;
	    String QUERY;
	    try{
	        //Creation of object of class DB_Connection
	        DB_Connection stu_obj = new DB_Connection();
	        
	        //Establishing Connection with the DataBase
            stu_obj.STMT = stu_obj.CONN.createStatement();
            
            //Execution query to Empty the TEMP_ATDNC table
            QUERY = "DELETE FROM TEMP_ATDNC WHERE S_NO IS NOT NULL;";
            
            stu_obj.STMT.executeUpdate(QUERY);
            
            //Execution query to reset the Auto_Increment of TEMP_ATDNC table to 1
            QUERY = "ALTER TABLE TEMP_ATDNC AUTO_INCREMENT = 1;";
            
            stu_obj.STMT.execute(QUERY);
	        
	        String [] Attendance = request.getParameterValues("Attendance");
	        
	        for (int j = 0; j < Attendance.length; j++){
	            
	            //Execution of Insert Query to the DataBase table TEMP_ATDNC
	            QUERY = "INSERT INTO TEMP_ATDNC (ATTENDANCE) VALUES ("
	                         + " '"+Attendance[j]+"'); ";
	            i = stu_obj.STMT.executeUpdate(QUERY);        
	        }
	        
	        date = (String) session.getAttribute("date1");
	        lect_no = Integer.parseInt((String) session.getAttribute("lect_no1"));
	        
	        System.out.println(date +" "+ lect_no);

	        
	        /*
	         * This is the query to merge the data stored in TEMP_STUDENT and
	         * TEMP_ATDNC table and storing the result in 
	         * the table ATTENDANCE
	         */
            QUERY = "INSERT INTO ATTENDANCE "
                    +"( "
                    +"ENROLL_NUM, BATCH_NO, ATDNC_DATE, LECT_NO, ATTENDANCE "
                    +") "
                    +"SELECT T1.ENROLL_NO, T1.BATCH, '"+date+"', "+lect_no+", T2.ATTENDANCE "
                    +"FROM TEMP_STUDENT T1 INNER JOIN TEMP_ATDNC T2 ON T1.S_NO = T2.S_NO;";
            
            i = stu_obj.STMT.executeUpdate(QUERY);
	        
            response.sendRedirect("http://localhost:8080/Minor_Project/FINAL%20PROJECT/Atdnc_Inserted_msg.jsp");
	        
	    }catch(Exception e){
	        out.println(e);
	    }finally{
	        out.close();
	    }
	}
}
