package com.laptrinhjavaweb.utils;

import javax.servlet.http.HttpServletRequest;

public class SessionUtil {
    private static SessionUtil sessionUtil = null;

    // kiểm tra xem session đã có chưa nếu chưa thì new mới còn rồi thì trả về kq
    // static để đưa session sang 1 thùng chứa riêng biệt
    public static SessionUtil getInstance(){
        if (sessionUtil == null){
            sessionUtil = new SessionUtil();
        }
        return sessionUtil;
    }
    public void putValue(HttpServletRequest request,String key,Object value){
        request.getSession().setAttribute(key,value);

    }
    public Object getValue(HttpServletRequest request,String key){

        return request.getSession().getAttribute(key);
    }
    public void removeValue(HttpServletRequest request ,String key){
        request.getSession().removeAttribute(key);

    }
}
