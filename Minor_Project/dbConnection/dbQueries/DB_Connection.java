package dbQueries;


import java.sql.*;



public class DB_Connection {
    
    public Connection CONN = null;
    public Statement STMT = null;
    public PreparedStatement PSTM;
    public ResultSet RS;
    public CallableStatement STMT2;
    
    static final String DB_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_USR = "root";
    static final String DB_PWD = "root";
    static final String CONN_STRING = "jdbc:mysql://localhost:3306/MINORPROJECT";
    String QUERY;
    int COUNTER;
    
    String batch;
    int lect_no; 
    
    /*
     * Constructor of class DB_Connectin
     * 
     * @process:
     *      Establish a new connection with the database
     *      for every object of the class
     */
    public DB_Connection(){
        try{
            //STEP-1: Register the Driver
            Class.forName(DB_DRIVER);
            
            //STEP-2: Start the Connection
            CONN = DriverManager.getConnection(CONN_STRING, DB_USR, DB_PWD);
            
        }catch(Exception e){
            e.printStackTrace();
            }
    }
    
    /*public void insert_Atdnc(String enroll, String batch, String date, int lect, String atdnc){
        try {
            STMT = CONN.createStatement();
            
            QUERY = "INSERT INTO ATTENDANCE VALUES ("
                    + "'"+enroll+"',"
                    + "'"+batch+"',"
                    + "'"+date+"',"
                    + ""+lect+","
                    + "'"+atdnc+"');";
            
            COUNTER = STMT.executeUpdate(QUERY);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }*/
    
    /*
     * retrieve_Stud_batch Function definition
     * 
     * @parm input:
     *      batch name
     *  
     * @parm output:
     *      an object of type ResultSet containing the values specified
     *      in the insert query bellow
     *      
     * @process:
     *      1. Select the specified fields from student table.
     *      2. Return these fields using the object of type ResultSet.
     */
    public ResultSet retrieve_Stud_batch(String batch){
        try {
            STMT = CONN.createStatement();
            
            QUERY = "SELECT ENROLL_NO, F_NAME, L_NAME, BATCH FROM STUDENT WHERE BATCH LIKE '"+batch+"%';";
            
            RS = STMT.executeQuery(QUERY);
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return RS;
    }
    
    /*
     * insert_Lecture_Paramters Function Definition
     * 
     * @parm input:
     *      batch, date, lecture number, code
     *      
     * @parm output:
     *      The output of this function will be the insertion
     *      of the data into the table Lecture.
     *      
     * @process:
     *         1. First it is checked whether the batch string 
     *            is the string determining both the batches A and B, 
     *            or whether the string is determining only batch A, 
     *            or only batch B.
     *          
     *         2. If (A exits OR B exist)
     *                  insert only A or B batch
     *              
     *         3. else
     *                  insert A and B batches both
     */
    public void insrt_Lecture_Parameters(String batch, String date, int lect_no, String subj_code){
        try {
            STMT = CONN.createStatement();
            
            if (batch.indexOf("A") != -1 || batch.indexOf("B") != -1){
              //This is a query to insert data into lecture table
              //Only if the batches are specified
                QUERY = "INSERT INTO LECTURE VALUES ("
                       +"'"+batch+"', "
                       +"'"+date+"', "
                       +" "+lect_no+" ,"
                       +"'"+subj_code+"' );";
            }
            
            else{
                
                //Query to insert values for batch A
                QUERY = "INSERT INTO LECTURE VALUES ("
                        +"'"+batch+""+"A"+"', "
                        +"'"+date+"', "
                        +" "+lect_no+" ,"
                        +"'"+subj_code+"' );";
                
                COUNTER = STMT.executeUpdate(QUERY);
                
              //Query to insert values for batch B 
                QUERY = "INSERT INTO LECTURE VALUES ("
                        +"'"+batch+""+"B"+"', "
                        +"'"+date+"', "
                        +" "+lect_no+" ,"
                        +"'"+subj_code+"' );";
            }
            
            
            COUNTER = STMT.executeUpdate(QUERY);
            
            /*//This is a query to empty the TEMP_STUDENT table
            QUERY = "DELETE FROM TEMP_STUDENT WHERE S_NO IS NOT NULL;";
            
            COUNTER = STMT.executeUpdate(QUERY);
            
            //This is a query to insert particular batch data into the TEMP_STUDENT table
            QUERY = "INSERT INTO TEMP_STUDENT (ENROLL_NO, BATCH) SELECT ENOLLL_NO, BATCH FROM STUDENT WHERE BATCH = '"+batch+"'";
            
            COUNTER = STMT.executeUpdate(QUERY);*/
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    
    /*
     * insert_into_TEMP_STUDENT Function Definition
     * 
     * @pram input:
     *      batch number
     *   
     * @parm output:
     *      void
     *      
     * @process:
     *      1. Empty TEMP_STUDENT table
     *      2. Set AUTO_INCREMENT to 1
     *      3.Insert data into TEMP_STUDENT from table STUDENT
     *        where the input batch = student batch
     */
    public void insert_into_TEMP_STUDENT(String batch){
        try {
            STMT = CONN.createStatement();
            
            //This is the query to empty TEMP_STUDENT table.
            QUERY = "DELETE FROM TEMP_STUDENT WHERE S_NO IS NOT NULL;";
            
            COUNTER = STMT.executeUpdate(QUERY);
            
            //This is the query to reset the AUTO_INCREMENT of TEMP_STUDENT
            //table to 1.
            QUERY = "ALTER TABLE TEMP_STUDENT AUTO_INCREMENT = 1;";
            
            COUNTER = STMT.executeUpdate(QUERY);
            
            //This is the query to insert data into TEMP_STUDENT table from
            //student table.
            QUERY =   "INSERT INTO TEMP_STUDENT "
                    + "( "
                    + "ENROLL_NO, BATCH "
                    + ") "
                    + "SELECT ENROLL_NO, BATCH FROM STUDENT "
                    + "WHERE BATCH LIKE '"+batch+"%';";
            
            COUNTER = STMT.executeUpdate(QUERY);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }             
    }
    
    /*
     * disp_Atdnc_batch Function definition
     * 
     * @parm input:
     *      batch, date_from, date_to
     *    
     * @parm output:
     *      Instance of type ResultSet
     *      
     * Process:
     *      Select the attendance details of the students of
     *      the specified batch
     *      within the given range of dates
     *      and store the result in RS instance.
     */
    public ResultSet disp_Atdnc_batch(String batch, String dateInitial, String dateEnd){
        
        try {
            STMT = CONN.createStatement();
            
            QUERY = "SELECT T2.ENROLL_NUM, T1.F_NAME, T1.L_NAME, "
                  + "T2.BATCH_NO, T3.SUBJ_CODE, T4.SUBJECT_NAME, "
                  + "T2.ATDNC_DATE, T2.LECT_NO, T2.ATTENDANCE "
                  + " "
                  + "FROM "
                  + " "
                  + "STUDENT T1 RIGHT JOIN ATTENDANCE T2 "
                  + "ON T1.ENROLL_NO = T2.ENROLL_NUM "
                  + " "
                  + "LEFT JOIN LECTURE T3 "
                  + "ON T2.BATCH_NO = T3.BATCH AND T2.ATDNC_DATE = T3.LEC_DATE AND "
                  + "T2.LECT_NO = T3.LECTURE_NO "
                  + " "
                  + "LEFT JOIN STAFF T4 "
                  + "ON T3.SUBJ_CODE = T4.SUBJECT_CODE "
                  + " "
                  + "WHERE "
                  + " "
                  + "T2.BATCH_NO LIKE '"+batch+"%' "
                  + " "
                  + "AND "
                  + " "
                  + "T2.ATDNC_DATE "
                  + "BETWEEN '"+dateInitial+"' AND '"+dateEnd+"'";
            
            RS = STMT.executeQuery(QUERY);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return RS;
    }
    
    /*
     * enroll_atdnc_A Function Definition
     * 
     * @parm input:
     *      enrollment number, initial date, final date
     *     
     * @parm output:
     *      Instance of type ResultSet
     *      
     * @process:
     *      To find the number of times @inp: enroll was absent
     */
    public ResultSet enroll_atdnc_A (String enroll, String dateInitial, String dateEnd){
        try {
            STMT = CONN.createStatement();
            
            //Query to check number of absents
            QUERY = "SELECT ENROLL_NUM, COUNT(*) "
                  + "FROM ATTENDANCE "
                  + "WHERE ENROLL_NUM = '0208"+enroll+"' AND ATTENDANCE = 'A' "
                  + "AND ATDNC_DATE BETWEEN '"+dateInitial+"' AND '"+dateEnd+"';";
            
            RS = STMT.executeQuery(QUERY);
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return RS;
    }
    
    /*
     * enroll_atdnc_P Function Definition
     * 
     * @parm input:
     *      enrollment number, initial date, final date
     *     
     * @parm output:
     *      Instance of type ResultSet
     *      
     * @process:
     *      To find the number of times @inp: enroll was present
     */
    public ResultSet enroll_atdnc_P (String enroll, String dateInitial, String dateEnd){
        try {
            STMT = CONN.createStatement();
            
            //Query to check number of absents
            QUERY =   "SELECT ENROLL_NUM, COUNT(*) "
                    + "FROM ATTENDANCE "
                    + "WHERE ENROLL_NUM = '0208"+enroll+"' AND ATTENDANCE = 'P' "
                    + "AND ATDNC_DATE BETWEEN '"+dateInitial+"' AND '"+dateEnd+"';";
            
            RS = STMT.executeQuery(QUERY);
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return RS;
    }
    
    /*
     * enroll_atdnc_M Function Definition
     * 
     * @parm input:
     *      enrollment number, initial date, final date
     *     
     * @parm output:
     *      Instance of type ResultSet
     *      
     * @process:
     *      To find the number of times @inp: enroll was on medical leave
     */
    public ResultSet enroll_atdnc_M (String enroll, String dateInitial, String dateEnd){
        try {
            STMT = CONN.createStatement();
            
            //Query to check number of absents
            QUERY = "SELECT ENROLL_NUM, COUNT(*) "
                    + "FROM ATTENDANCE "
                    + "WHERE ENROLL_NUM = '0208"+enroll+"' AND ATTENDANCE = 'M' "
                    + "AND ATDNC_DATE BETWEEN '"+dateInitial+"' AND '"+dateEnd+"';";
            
            RS = STMT.executeQuery(QUERY);
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return RS;
    }
    
    /*
     * enroll_atdnc_O Function Definition
     * 
     * @parm input:
     *      enrollment number, initial date, final date
     *     
     * @parm output:
     *      Instance of type ResultSet
     *      
     * @process:
     *      To find the number of times @inp: enroll was absent due to known reasons
     */
    public ResultSet enroll_atdnc_O (String enroll, String dateInitial, String dateEnd){
        try {
            STMT = CONN.createStatement();
            
            //Query to check number of absents
            QUERY = "SELECT ENROLL_NUM, COUNT(*) "
                    + "FROM ATTENDANCE "
                    + "WHERE ENROLL_NUM = '0208"+enroll+"' AND ATTENDANCE = 'O' "
                    + "AND ATDNC_DATE BETWEEN '"+dateInitial+"' AND '"+dateEnd+"';";
            
            RS = STMT.executeQuery(QUERY);
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return RS;
    }
    
    /*
     * enroll_name Function Definition
     * 
     * @parm input:
     *      enrollment number
     *    
     * @parm output:
     *      ResultSet instance, having stored the 
     *      value of first and last name
     *      
     * @process:
     *      This function returns the first and
     *      last name of the enrollment number
     *      provided
     */
    public ResultSet enroll_name(String enroll){
        
        try {
            STMT = CONN.createStatement();
            
            QUERY = "SELECT F_NAME, L_NAME FROM STUDENT "
                  + "WHERE ENROLL_NO = '0208"+enroll+"';";
            
            RS = STMT.executeQuery(QUERY);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return RS;        
    }
    
    /*
     * studentAtdnc_Number Function Definition
     * 
     * @parm input:
     *      batch number, date from, date to attendance
     *      
     * @parm output:
     *      ResultSet instance: having values of enrollment number,
     *      name of student, batch, and numerical values of attendance
     *      like number of days present, absent, etc
     *      
     * @process:
     *      This function will execute a query on student and attendance table
     *      to generate the output specified above.
     *      BATCH ATTENDANCE ALL SUBJECTS NUMERIC
     */
    public ResultSet studentAtdnc_Number(String batch, String dateInitial, String dateEnd){
        try {
            STMT = CONN.createStatement();
            
            QUERY = "SELECT T2.ENROLL_NUM, T1.F_NAME, T1.L_NAME, T1.BATCH, "
                  + "SUM(CASE WHEN T2.ATTENDANCE = 'P' THEN 1 ELSE 0 END) AS PRESENT, "
                  + "SUM(CASE WHEN T2.ATTENDANCE = 'A' THEN 1 ELSE 0 END) AS ABSENT, "
                  + "SUM(CASE WHEN T2.ATTENDANCE = 'M' THEN 1 ELSE 0 END) AS MEDICAL, "
                  + "SUM(CASE WHEN T2.ATTENDANCE = 'O' THEN 1 ELSE 0 END) AS OTHERS, "
                  + "SUM(1) AS TOTAL "
                  + "FROM "
                  + "ATTENDANCE T2 INNER JOIN STUDENT T1 "
                  + "ON T1.ENROLL_NO = T2.ENROLL_NUM "
                  + "WHERE "
                  + "T1.BATCH LIKE '"+batch+"%' "
                  + "AND T2.ATDNC_DATE BETWEEN "
                  + "'"+dateInitial+"' AND '"+dateEnd+"' "
                  + "GROUP BY T2.ENROLL_NUM, T1.F_NAME, T1.L_NAME, T1.BATCH;";
            
            RS = STMT.executeQuery(QUERY);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return RS;
    }
    
    /*
     * disp_Subj_Atdnc Function definition
     * 
     * @parm input:
     *      batch, subject code, initial date, final date
     *      
     * @parm output:
     *      ResultSet instance: Containing values from four tables
     *      
     * @process:
     *      On execution the query will select the specified fields using
     *      joins.
     *      And will finally generate database table displaying BATCH
     *      attendance subject wise.
     */
    public ResultSet disp_Subj_Atdnc(String batch, String subj_code, String dateInitial, String dateEnd){
        try {
            STMT = CONN.createStatement();
            
            QUERY = "SELECT T2.ENROLL_NUM, T1.F_NAME, T1.L_NAME, "
                  + "T1.BATCH, T2.ATDNC_DATE, T2.LECT_NO, "
                  + "T3.SUBJ_CODE, T4.SUBJECT_NAME, T2.ATTENDANCE "
                  + "FROM "
                  + "STUDENT T1 INNER JOIN ATTENDANCE T2 "
                  + "ON T1.ENROLL_NO = T2.ENROLL_NUM "
                  + ""
                  + "LEFT JOIN LECTURE T3 "
                  + ""
                  + "ON T1.BATCH = T3.BATCH AND T2.ATDNC_DATE = T3.LEC_DATE AND T2.LECT_NO = T3.LECTURE_NO "
                  + ""
                  + "INNER JOIN STAFF T4 ON "
                  + ""
                  + "T3.SUBJ_CODE = T4.SUBJECT_CODE "
                  + ""
                  + "WHERE "
                  + ""
                  + "T1.BATCH LIKE '"+batch+"%' AND "
                  + ""
                  + "T3.SUBJ_CODE = '"+subj_code+"' "
                  + ""
                  + "AND T2.ATDNC_DATE BETWEEN '"+dateInitial+"' AND '"+dateEnd+"';";
            
            RS = STMT.executeQuery(QUERY);
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return RS;
    }
    
    /*
     * disp_numeric_Atdnc_SubjectWise Function Definition
     * 
     * @parm input:
     *      enrollment number, subject code, initial date, and ending date
     *      
     * @parm output:
     *      ResultSet instance: Providing a one row table of subject attendance of a student
     *      
     * @process:
     *      The function executes a query to retrieve the attendance of a SUBJECT subject wise.
     *    
     */
    
    public ResultSet disp_numeric_Atdnc_SubjectWise(String enroll, String subj_code, String dateInitial, String dateEnd){
        try {
            STMT = CONN.createStatement();
            
            QUERY = "SELECT T1.ENROLL_NUM, "
                  + "SUM(CASE WHEN T1.ATTENDANCE = 'P' THEN 1 ELSE 0 END) AS PRESENT, "
                  + "SUM(CASE WHEN T1.ATTENDANCE = 'A' THEN 1 ELSE 0 END) AS ABSENT, "
                  + "SUM(CASE WHEN T1.ATTENDANCE = 'M' THEN 1 ELSE 0 END) AS MEDICAL, "
                  + "SUM(CASE WHEN T1.ATTENDANCE = 'O' THEN 1 ELSE 0 END) AS OTHERS, "
                  + "SUM(1) AS TOTAL "
                  + "FROM ATTENDANCE T1 LEFT JOIN LECTURE T2 "
                  + "ON T1.ATDNC_DATE = T2.LEC_DATE "
                  + "AND T1.LECT_NO = LECTURE_NO "
                  + "AND T1.BATCH_NO = BATCH "
                  + "WHERE "
                  + "ENROLL_NUM = '0208"+enroll+"' "
                  + "AND SUBJ_CODE = '"+subj_code+"' "
                  + "AND T1.ATDNC_DATE BETWEEN '"+dateInitial+"' AND '"+dateEnd+"' "
                  + "GROUP BY ENROLL_NUM;";
            
            RS = STMT.executeQuery(QUERY);
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return RS;
    }
    
    /*
     * subjCode_subjName Function Definition
     * 
     * @parm input:
     *      subject code
     *      
     * @parm output:
     *      ResultSet instance: subject name, subject code, and professor
     *      
     * @process:
     *      The function bellow provides the details of the staff table.
     */
    
    public ResultSet subjCode_subjName(String subj_code){
        try {
            STMT = CONN.createStatement();
            
            QUERY = "SELECT * FROM STAFF WHERE SUBJECT_CODE = '"+subj_code+"';";
            
            RS = STMT.executeQuery(QUERY);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return RS;
    }
    
    /*
     * studNumeric_allSubj_ordrd Function Definition
     * 
     * @parm input:
     *      enroll, initial date, end date
     *      
     * @parm output:
     *      ResultSet instance: Providing numeric attendance of a whole batch unordered
     *      
     *  @process:
     *      The function on execution provides the numeric ORDERED attendance of a whole batch
     */
    public ResultSet studNumeric_allSubj_ordrd(String batch, String dateInitial, String dateEnd){
        try {
            STMT = CONN.createStatement();
            
            QUERY = "SELECT T2.ENROLL_NUM, T1.F_NAME, T1.L_NAME, T1.BATCH, "
                  + "SUM(CASE WHEN T2.ATTENDANCE = 'P' THEN 1 ELSE 0 END) AS PRESENT, "
                  + "SUM(CASE WHEN T2.ATTENDANCE = 'A' THEN 1 ELSE 0 END) AS ABSENT, "
                  + "SUM(CASE WHEN T2.ATTENDANCE = 'M' THEN 1 ELSE 0 END) AS MEDICAL, "
                  + "SUM(CASE WHEN T2.ATTENDANCE = 'O' THEN 1 ELSE 0 END) AS OTHERS, "
                  + "SUM(1) AS TOTAL "
                  + "FROM "
                  + "ATTENDANCE T2 INNER JOIN STUDENT T1 "
                  + "ON T1.ENROLL_NO = T2.ENROLL_NUM "
                  + "WHERE "
                  + "T1.BATCH LIKE '"+batch+"%' "
                  + "AND T2.ATDNC_DATE BETWEEN "
                  + "'"+dateInitial+"' AND '"+dateEnd+"' "
                  + "GROUP BY T2.ENROLL_NUM, T1.F_NAME, T1.L_NAME, T1.BATCH "
                  + "ORDER BY PRESENT DESC;";
            
            RS = STMT.executeQuery(QUERY);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return RS;
    }
    
    /*
     * studentProfile Function Definition
     * 
     * @parm input:
     *      enroll, initial date, end date
     *      
     * @parm output:
     *      Integer Counter specifying whether the query executed or not.
     *      
     *  @process:
     *      The function on execution inserts the profile of a new student in a batch
     */
    public int studentProfile(String enroll_no, String batch, String f_name, String l_name, String DOB, String mobile_no, String address, int dept_no){
        try {
            STMT = CONN.createStatement();
            
            QUERY = "INSERT INTO STUDENT (ENROLL_NO, BATCH, F_NAME, L_NAME, DOB, MOBILE_NO, ADDRESS, DEPT_NO) VALUES("
                  + " '"+enroll_no+"', "
                  + " '"+batch+"', "
                  + " '"+f_name+"', "
                  + " '"+l_name+"', "
                  + " '"+DOB+"', "
                  + " '"+mobile_no+"', "
                  + " '"+address+"', "
                  + " "+dept_no+");";
            
            COUNTER = STMT.executeUpdate(QUERY);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return COUNTER;
    }
    /*
     * login_Check Function Definition
     * 
     * @parm input:
     *      LOGIN_ID, LOGIN_PWD
     *      
     * @parm output:
     *      Integer: defines whether there was some output or not.
     *      
     *  @process:
     *      Checks the login table for valid input of id ans password
     */
    public ResultSet login_Check(String login_id, String login_pwd){
        try {
            STMT = CONN.createStatement();
            
            QUERY = "SELECT S_NO FROM LOGIN WHERE LOGIN_ID = '"+login_id+"' AND LOGIN_PWD = '"+login_pwd+"';";
            
            RS = STMT.executeQuery(QUERY);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return RS;
    }
    
   /* public static void main(String [] args){
        
        DB_Connection obj = new DB_Connection();
        
        ResultSet RS1;
        
        RS1 = obj.login_Check("GGCT", "GGCTCSE");
        
        try {
            RS1.next();
            System.out.println(RS1.getInt(1));
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }*/
    
}//End of class 
