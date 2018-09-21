/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import model.Departs;
import DAO.DepartDAO;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("/departs/")
public class DepartController {

    @RequestMapping("indexDeparts")
    public String index(ModelMap model) {
        DepartDAO depart = new DepartDAO();
        List<Departs> ds = new ArrayList<Departs>();
        ds = depart.ShowDeparts("");
        model.addAttribute("listDeparts", ds);
        Departs a = new Departs();
        a = ds.get(0);
        model.addAttribute("depart", a);
        int b = ds.size();
        model.addAttribute("countDeparts", b);
        return "departs";
    }

    @RequestMapping("insert")
    public String insert(HttpServletRequest request, ModelMap model ) {

        String id = request.getParameter("txtId");
        String name = request.getParameter("txtName");
       
        Departs a = new Departs(id, name);
        DepartDAO depart = new DepartDAO();
        depart.Insert(a);
        List<Departs> ds = new ArrayList<Departs>();
        ds = depart.ShowDeparts("");
        model.addAttribute("listDeparts", ds);
        model.addAttribute("mess", "Thêm thành công");
        return index(model);
    }

    @RequestMapping("btnEdit")
    public String edit(HttpServletRequest request, ModelMap model) {
        String id = request.getParameter("txtId");
        String name = request.getParameter("txtName");
        Departs a = new Departs(id, name);
        model.addAttribute("depart", a);
        DepartDAO depart = new DepartDAO();
        List<Departs> ds = new ArrayList<Departs>();
        ds = depart.ShowDeparts("");
        model.addAttribute("listDeparts", ds);
        return "departs";
    }

    @RequestMapping("update")
    public String update(ModelMap model, @ModelAttribute("depart") Departs a) {
        DepartDAO depart = new DepartDAO();
        depart.Update(a);
        List<Departs> ds = new ArrayList<Departs>();
        ds = depart.ShowDeparts("");
        model.addAttribute("listDeparts", ds);
        model.addAttribute("mess", "Sửa thành công");
        return index(model);
    }

    @RequestMapping("btnDelete")
    public String delete(HttpServletRequest request, ModelMap model,
            @ModelAttribute("depart") Departs a) {
        String id = request.getParameter("txtId");
        DepartDAO depart = new DepartDAO();
        depart.Delete(id);
        List<Departs> ds = new ArrayList<Departs>();
        ds = depart.ShowDeparts("");
        model.addAttribute("listDeparts", ds);
        Departs b = new Departs();
        b = ds.get(0);
        model.addAttribute("depart", b);
        model.addAttribute("mess", "Xóa thành công");
        return index(model);
    }
}
