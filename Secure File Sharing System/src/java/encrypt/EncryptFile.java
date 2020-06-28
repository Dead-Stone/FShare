/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package encrypt;

/**
 *
 * @author
 */
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.awt.image.BufferedImage;
import java.io.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.imageio.ImageIO;
/**
 *
 * @author dhanoopbhaskar
 */
public class EncryptFile {

    KeyGenerator keyGenerator = null;
    SecretKey secretKey = null;
    Cipher cipher = null;

    public EncryptFile() {
        try {
            /**
             * Create a Blowfish key
             */
            keyGenerator = KeyGenerator.getInstance("Blowfish");
            secretKey = keyGenerator.generateKey();
            //String file = request.getParameter("file");
            /**
             * Create an instance of cipher mentioning the name of algorithm -
             * Blowfish
             */

            cipher = Cipher.getInstance("Blowfish");
        } catch (NoSuchPaddingException ex) {
            System.out.println(ex);
        } catch (NoSuchAlgorithmException ex) {
            System.out.println(ex);
        }
    }
    

    public String encrypt(String srcPath, String destPath) {
        File rawFile = new File(srcPath);
        File encryptedFile = new File(destPath);
        InputStream inStream = null;
        OutputStream outStream = null;
        String skey=null;
        try {       encryptedFile.createNewFile();
            /**
             * Initialize the cipher for encryption
             */
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            /**
             * Initialize input and output streams
             */

            byte[] be = secretKey.getEncoded();//encoding secretkey
            skey = Base64.encode(be);
            System.out.println("sKey" + skey);
            System.out.println("secretKey" + secretKey);

//        String usermail = "mail.1000projects@gmail.com";  
//         Mail m = new Mail();
//          String msg ="Secret Key:"+skey;
//          m.secretMail(msg,usermail,usermail);    
            inStream = new FileInputStream(rawFile);
            outStream = new FileOutputStream(encryptedFile);
            byte[] buffer = new byte[1024];
            int len;
            while ((len = inStream.read(buffer)) > 0) {
                outStream.write(cipher.update(buffer, 0, len));
                outStream.flush();
            }
            
            outStream.write(cipher.doFinal());
            inStream.close();
            outStream.close();
        } catch (IllegalBlockSizeException ex) {
            System.out.println(ex);
        } catch (BadPaddingException ex) {
            System.out.println(ex);
        } catch (InvalidKeyException ex) {
            System.out.println(ex);
        } catch (FileNotFoundException ex) {
            System.out.println(ex);
        } catch (IOException ex) {
            System.out.println(ex);
        } catch (Exception ex) {
            System.out.println(ex);
        }
                    return skey;
    }

}
