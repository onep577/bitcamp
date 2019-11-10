package com.rhymes.app.customer.util;
 
import java.io.File;
 
public class FileDelete {
     
      
    public static void main(String args){
         
        File file = new File(args);
        System.out.println("file : " + file);
        if( file.exists() ){ 
             
            if(file.delete()){
                System.out.println("o");
            }else{
                System.out.println("x");
            }
             
        }else{
            System.out.println("x");
        }
             
    }
 
 
}
