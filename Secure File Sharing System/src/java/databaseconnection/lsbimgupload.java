package databaseconnection;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import lsb.LSB_encode;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
@WebServlet("/lsbimgupload")
public class lsbimgupload extends HttpServlet {
    
    public int q=0;
    /*
     create images folder at, C:\Users\Dharmesh Mourya\Documents\NetBeansProjects\ImageProject\build\web\images
     */

    public static final String UPLOAD_DIR = "UPLOADED LSB Images";
    public static final String STORE_DIR = "Applied LSB Images";
    public String imgpath = "";
        int id=0;
        String imgname="";
        String status="Applied LSB";
        String text=null;
        String identifier=null;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //text=request.getParameter("text");
        identifier=request.getParameter("identifier");
        System.out.println(identifier);
        
        try{Connection con = databasecon.getconnection();
        Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from upload where identifier ='" + identifier + "'");
    if (rs.next()) {text = rs.getString(4);}
        System.out.println(text);}
        catch(SQLException e){
         System.out.println("cant retrieve"+e);   
        }
        PrintWriter out = response.getWriter();
        Part part = request.getPart("file");//
//        Part textpart = request.getPart("text");//
//        String text=textpart.getHeader("text");
        String fileName = extractFileName(part);//file name

        /**
         * *** Get The Absolute Path Of The Web Application ****
         */
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String savePath = uploadPath + File.separator + fileName;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
        imgpath = STORE_DIR + File.separator + fileName;
       String storepath = applicationPath+File.separator +imgpath;
        imgname=fileName;
        part.write(savePath + File.separator);
//        ----------------------------------------------------------

File files = new File(applicationPath+File.separator+STORE_DIR);
files.mkdir();
//Apply LSB
               LSB_encode obj = new LSB_encode();
                obj.encode(text, savePath,storepath);
        try {Connection con = databasecon.getconnection();
            
            PreparedStatement pst = con.prepareStatement("insert into lsbimgs values(?,?,?,?,?)");
            
            pst.setInt(1, id);
            pst.setString(2, imgname);
            pst.setString(3, imgpath);
            pst.setString(4, status);
            pst.setString(5, identifier);
            pst.executeUpdate();
            response.sendRedirect("applylsb.jsp?msg=Success");
        } catch (Exception e) {
            out.println(e);
        }
        
    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}