/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.DepartDAO;
import DAO.RecordDAO;
import DAO.ReportDAO;
import DAO.StaffDAO;
import DAO.UsersDAO;
import java.util.ArrayList;
import java.util.List;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Departs;
import model.Records;
import model.ReportDepart;
import model.ReportPersonal;
import model.Staffs;
import model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import DAO.RandomString;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping("/login/")
public class LoginController {

    @Autowired
    JavaMailSender mailer1;

    @RequestMapping("showLogin.htm")
    public String show() {
        return "login";
    }

    @RequestMapping("showChangePass.htm")
    public String showChangePass() {
        return "changepass";
    }

    @RequestMapping("showFogetPass.htm")
    public String showFogetPass() {
        return "fogetpass";
    }

    @RequestMapping("loginIndex")
    public String index(ModelMap model, HttpServletRequest request, HttpSession session) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UsersDAO user = new UsersDAO();
        if (user.Login(username, password).equalsIgnoreCase("admin")
                || user.Login(username, password).equalsIgnoreCase("nhanvien")
                || user.Login(username, password).equalsIgnoreCase("ketoan")) {
            session.setAttribute("USER", username);
            session.setAttribute("PASS", password);
            session.setAttribute("ROLE", user.Login(username, password));

            ReportDAO rp = new ReportDAO();
            List<ReportPersonal> dsStaffs = new ArrayList<ReportPersonal>();
            dsStaffs = rp.showReportPersonal("");
            List<ReportDepart> dsDeparts = new ArrayList<ReportDepart>();
            dsDeparts = rp.showReportDepart("");
            List<ReportPersonal> dsTop3Staffs = new ArrayList<ReportPersonal>();
            dsTop3Staffs = rp.showTop3Staff("");
            List<ReportDepart> dsTop3Departs = new ArrayList<ReportDepart>();
            dsTop3Departs = rp.showTop3Depart("");
            model.addAttribute("listReportPersonal", dsStaffs);
            model.addAttribute("listReportDepart", dsDeparts);
            model.addAttribute("listTop3Staffs", dsTop3Staffs);
            model.addAttribute("listTop3Departs", dsTop3Departs);
            model.addAttribute("value", 1);

            DepartDAO depart = new DepartDAO();
            List<Departs> dsDepart = new ArrayList<Departs>();
            dsDepart = depart.ShowDeparts("");
            int countDeparts = dsDepart.size();
            model.addAttribute("countDeparts", countDeparts);
            StaffDAO staff = new StaffDAO();
            List<Staffs> dsStaff = new ArrayList<Staffs>();
            dsStaff = staff.ShowStaff("");
            int countStaff = dsStaff.size();
            model.addAttribute("countStaff", countStaff);
            RecordDAO record = new RecordDAO();
            List<Records> dsRecord = new ArrayList<Records>();
            dsRecord = record.showRecord("");
            int countRecord = dsRecord.size();
            model.addAttribute("countRecord", countRecord);
            List<Users> dsUser = new ArrayList<Users>();
            dsUser = user.showUsers("");
            int countUsers = dsUser.size();
            model.addAttribute("countUsers", countUsers);
            return "index";
        }
        model.addAttribute("mess", "Invalid username or password");
        return "login";
    }

    @RequestMapping("change")
    public String change(ModelMap model, HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("newPassword");
        UsersDAO user = new UsersDAO();
        if (user.UpdatePass(username, password)) {
            return "login";
        }
        return "changepass";
    }

    @RequestMapping("fogetPass")
    public String fogetPass(ModelMap model, HttpServletRequest request) {
        try {
            String username = request.getParameter("txtUser");
            String email = request.getParameter("txtEmail");
            String new_password = RandomString.getRandomString(4, 7);
            UsersDAO a = new UsersDAO();
            if (a.isExitEmail(username)) {
                a.getPassword(new_password, username);
                // Tạo mail
                MimeMessage mail = mailer1.createMimeMessage();
                // Sử dụng lớp trợ giúp
                MimeMessageHelper helper = new MimeMessageHelper(mail);
                String from = "khoivtps05357@fpt.edu.vn";
                String subject = "Quên mật khẩu";
                String body = "Mật khẩu mới của bạn là: " + new_password;
                helper.setFrom(from, from);
                helper.setTo(email);
                helper.setReplyTo(from, from);
                helper.setSubject(subject);
                helper.setText(body, true);
                // Gửi mail
                mailer1.send(mail);
                model.addAttribute("message", "Gửi email thành công !");
            } else {
                model.addAttribute("message", "Email không tồn tại !");
            }

        } catch (Exception ex) {
            model.addAttribute("message", "Gửi email thất bại !");
        }
        return "fogetpass";
    }

}
