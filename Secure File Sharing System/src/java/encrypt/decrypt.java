/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package encrypt;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author
 */
public class decrypt {

    KeyGenerator keyGenerator = null;
    // SecretKey secretKey = null;

    public void decrypt(String srcPath, String destPath, String skey) throws NoSuchAlgorithmException, NoSuchPaddingException {
        File encryptedFile = new File(srcPath);
        File decryptedFile = new File(destPath);

        InputStream inStream = null;
        OutputStream outStream = null;
        Cipher cipher = null;

        try {
        decryptedFile.createNewFile();
            byte[] bs = Base64.decode(skey);
            
            System.out.println(new String(bs));
            SecretKey secretKey = new SecretKeySpec(bs, "Blowfish");
            
            System.out.println("converted string to seretkey:" + secretKey);

            /**
             * Initialize the cipher for decryption
             */
            cipher = Cipher.getInstance("BLOWFISH");
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            /**
             * Initialize input and output streams
             */
            inStream = new FileInputStream(encryptedFile);
            outStream = new FileOutputStream(decryptedFile);
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
        }
    }

}
