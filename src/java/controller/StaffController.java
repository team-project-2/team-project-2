/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.StaffDAO;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import model.Departs;
import model.Staffs;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping("/staffs/")
public class StaffController {

    @RequestMapping("indexStaffs")
    public String index(ModelMap model) {
        StaffDAO staff = new StaffDAO();
        List<Staffs> ds = new ArrayList<Staffs>();
        ds = staff.ShowStaff("");
        model.addAttribute("listStaffs", ds);
        Staffs a = new Staffs();
        a = ds.get(0);
        model.addAttribute("staff", new Staffs());
        int b = ds.size();
        model.addAttribute("countStaff", b);
        return "staffs";
    }

    @RequestMapping("insert")
    public String insert(ModelMap model, @ModelAttribute("staff") Staffs a) {
        StaffDAO staff = new StaffDAO();
        staff.Insert(a);
        List<Staffs> ds = new ArrayList<Staffs>();
        ds = staff.ShowStaff("");
        model.addAttribute("listStaffs", ds);
        model.addAttribute("mess", "Thêm thành công");
        return index(model);

    }

    @RequestMapping("btnEdit")
    public String edit(HttpServletRequest request, ModelMap model) {
        int id = Integer.parseInt(request.getParameter("txtId"));
        String name = request.getParameter("txtName");
        int gender = Integer.parseInt(request.getParameter("txtGender"));
        Date birthday = Date.valueOf(request.getParameter("txtBirthday"));
        String photo = request.getParameter("txtPhoto");
        String email = request.getParameter("txtEmail");
        String phone = request.getParameter("txtPhone");
        float salary = Float.parseFloat(request.getParameter("txtSalary"));
        String notes = request.getParameter("txtNotes");
        String departid = request.getParameter("txtDepartId");
        Staffs a = new Staffs(id, name, gender, birthday, photo, email, phone, salary, notes, departid);
        model.addAttribute("staff", a);
        StaffDAO staff = new StaffDAO();
        List<Staffs> ds = new ArrayList<Staffs>();
        ds = staff.ShowStaff("");
        model.addAttribute("listStaffs", ds);
        return "staffs";
    }

    @RequestMapping("update")
    public String update(ModelMap model, @ModelAttribute("staff") Staffs a, BindingResult errors) {


        StaffDAO staff = new StaffDAO();
        if (a.getPhoto().equals("")) {
            staff.Update1(a);
        } else {
            staff.Update(a);
        }
        List<Staffs> ds = new ArrayList<Staffs>();
        ds = staff.ShowStaff("");
        model.addAttribute("listStaffs", ds);

        return index(model);
    }

    @RequestMapping("btnDelete")
    public String delete(HttpServletRequest request, ModelMap model, @ModelAttribute("staff") Staffs a) {
        String id = request.getParameter("txtId");

        StaffDAO staff = new StaffDAO();
        staff.Delete(id);
        List<Staffs> ds = new ArrayList<Staffs>();
        ds = staff.ShowStaff("");
        model.addAttribute("listStaffs", ds);
        Staffs b = new Staffs();
        b = ds.get(0);
        model.addAttribute("staff", b);
        return index(model);
    }

    @ModelAttribute("departs")
    public List<Departs> getDeparts() {
        try {
            Connection conn = ConnectionDB.getConn();
            String sql = "Select * from Departs";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Departs> ds = new ArrayList<Departs>();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                Departs a = new Departs(id, name);
                ds.add(a);
            }
            return ds;
        } catch (Exception e) {
        }
        return null;
    }
}
