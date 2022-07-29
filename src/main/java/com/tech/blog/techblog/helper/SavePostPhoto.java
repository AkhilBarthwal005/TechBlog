package com.tech.blog.techblog.helper;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class SavePostPhoto {

    public  static  boolean SavePhoto(InputStream inputStream , String path){
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
