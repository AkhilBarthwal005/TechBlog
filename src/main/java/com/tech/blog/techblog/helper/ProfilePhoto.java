package com.tech.blog.techblog.helper;

import com.mysql.cj.callback.FidoAuthenticationCallback;
import jakarta.servlet.http.HttpSession;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;

public class ProfilePhoto {

    public static void removeExistingProfilePhoto(String path){
        File file = new File(path);
        boolean isDeleted = file.delete();
    }

    public  static  boolean updateProfilePhoto(InputStream inputStream , String path){
        boolean result = false;
        try{
            // storing all input stream data to byte array.
            byte b[] = new byte[inputStream.available()];

            // reading all data from byte array and storing them in above byte array
            inputStream.read(b);

            // creating output stream object
            FileOutputStream fileOutputStream = new FileOutputStream(path);

            // writing all the data
            fileOutputStream.write(b);
            fileOutputStream.flush();
            fileOutputStream.close();
            result = true;

        }
        catch (IOException e){
            e.printStackTrace();
        }
        return result;
    }
}
