/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UsersDAO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Users;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("/users/")
public class UserController {

    @RequestMapping("indexUsers")
    public String index(ModelMap model) {
        UsersDAO user = new UsersDAO();
        List<Users> ds = new ArrayList<Users>();
        ds = user.showUsers("");
        model.addAttribute("listUsers", ds);
        Users a = new Users();
        a = ds.get(0);
        model.addAttribute("user", a);
        int b = ds.size();
        model.addAttribute("countUsers", b);
        return "users";
    }

    @RequestMapping("insert")
    public String insert(HttpServletRequest request, ModelMap model) {
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String fullname = request.getParameter("txtFullname");
        Users a = new Users(username, password, fullname);
        UsersDAO user = new UsersDAO();
        user.Insert(a);
        List<Users> ds = new ArrayList<Users>();
        ds = user.showUsers("");
        model.addAttribute("listUsers", ds);
        model.addAttribute("mess", "Thêm thành công");
        return index(model);
    }

    @RequestMapping("btnEdit")
    public String edit(HttpServletRequest request, ModelMap model) {
        String name = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String fullname = request.getParameter("txtFullname");
        Users a = new Users(name, password, fullname);
        model.addAttribute("user", a);
        UsersDAO user = new UsersDAO();
        List<Users> ds = new ArrayList<Users>();
        ds = user.showUsers("");
        model.addAttribute("listUsers", ds);
        return "users";
    }

    @RequestMapping("update")
    public String update(ModelMap model, @ModelAttribute("user") Users a) {
        UsersDAO user = new UsersDAO();
        user.Update(a);
        List<Users> ds = new ArrayList<Users>();
        ds = user.showUsers("");
        model.addAttribute("listUsers", ds);
        model.addAttribute("mess", "Sửa thành công");
        return index(model);
    }

    @RequestMapping("btnDelete")
    public String delete(HttpServletRequest request, ModelMap model,
            @ModelAttribute("user") Users a) {
        String username = request.getParameter("txtUsername");
        UsersDAO user = new UsersDAO();
        user.Delete(username);
        List<Users> ds = new ArrayList<Users>();
        ds = user.showUsers("");
        model.addAttribute("listUsers", ds);
        Users b = new Users();
        b = ds.get(0);
        model.addAttribute("user", b);
        model.addAttribute("mess", "Xóa thành công");
        return index(model);
    }
}
