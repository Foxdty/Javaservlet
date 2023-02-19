package com.laptrinhjavaweb.utils;

import com.laptrinhjavaweb.Constant.SystemConstant;

import javax.servlet.http.HttpServletRequest;

public class MessageUtil {
    public static void showMessage(HttpServletRequest request){
        if (request.getParameter("message") != null) {
            String messageResponse = "";
            String alert = "";
            String message = request.getParameter("message");
            if (message.equals(SystemConstant.INSERT_SUCCESS)) {
                messageResponse = "Insert success";
                alert = "success";
            } else if (message.equals(SystemConstant.UPDATE_SUCCESS)) {
                messageResponse = "Update success";
                alert = "success";
            } else if (message.equals(SystemConstant.DELETE_SUCCESS)) {
                messageResponse = "Delete success";
                alert = "success";
            } else if (message.equals(SystemConstant.ERORR_SYSTEM)) {
                messageResponse = "Error system";
                alert = "danger";
            }
            request.setAttribute("messageResponse", messageResponse);
            request.setAttribute("alert", alert);
        }
    }

}
