package com.kitri.meto.schedule;

import java.util.Calendar;
import java.util.Date;

public class isDate {
    public boolean isDate(int y, int m, int d) {
        m -= 1;
        Calendar c = Calendar.getInstance();
        c.setLenient(false);   
        try {  
             c.set(y, m, d);
             Date dt = c.getTime();
        } catch(IllegalArgumentException e) {
             return false;
        }
        return true;
   }
}
