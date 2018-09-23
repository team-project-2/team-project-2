/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.RecordDAO;
import DAO.StaffDAO;

import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import model.Records;
import model.Staffs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping("/record/")
public class RecordController {

    @Autowired
    JavaMailSender mailer;

    @RequestMapping("indexRecord")
    public String index(ModelMap model) {
        RecordDAO record = new RecordDAO();
        List<Records> ds = new ArrayList<Records>();
        ds = record.showRecord("");
        model.addAttribute("listRecord", ds);
        Records a = new Records();
        a = ds.get(0);
        model.addAttribute("record", new Records());
        int b = ds.size();
        model.addAttribute("countRecord", b);
        return "record";
    }

    @RequestMapping("insert")
    public String insert(ModelMap model, @ModelAttribute("record") Records a,
            @RequestParam("type") int type, @RequestParam("reason") String reason, @RequestParam("date") String date,
            @RequestParam("staffid") int staffid) {

        // Sử dụng lớp trợ giúp
        try {
            RecordDAO record = new RecordDAO();
            record.Insert(a);
            List<Records> ds = new ArrayList<Records>();
            ds = record.showRecord("");
            model.addAttribute("listRecord", ds);
            MimeMessage mail = mailer.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mail);
            String from = "khoivtps05357@fpt.edu.vn";
            String subject = "Đánh giá";
            String type1 = "";
            if (type == 1) {
                type1 = "Xin chúc mừng bạn nhận được 1 khen thường";
            } else {
                type1 = "Xin chia buồn bạn nhận được 1 kỷ luật";
            }
            StaffDAO staff = new StaffDAO();
            List<Staffs> dsStaff = new ArrayList<Staffs>();
            dsStaff = staff.ShowStaff("");
            String email = null;
            for (int i = 0; i < dsStaff.size(); i++) {
                if (dsStaff.get(i).getId() == staffid) {
                    email = dsStaff.get(i).getEmail();
                    break;
                }
            }
            String body = type1 + "<br> Lý do: " + reason + "<br> vào ngày: " + date + "<br>   Chúc bạn có một ngày làm việc vui vẻ";
            helper.setFrom(from, from);
            helper.setTo(email);
            helper.setReplyTo(from, from);
            helper.setSubject(subject);
            helper.setText(body, true);
            // Gửi mail
            mailer.send(mail);
            model.addAttribute("mess", "Đánh giá thành công");
        } catch (Exception e) {
            model.addAttribute("mess", "Đánh giá thất bại");
        }
        return index(model);
    }

    @RequestMapping("btnEdit")
    public String edit(HttpServletRequest request, ModelMap model) {
        int id = Integer.parseInt(request.getParameter("txtId"));
        int type = Integer.parseInt(request.getParameter("txtType"));
        String reason = request.getParameter("txtReason");
        Date date = Date.valueOf(request.getParameter("txtDate"));
        int staffid = Integer.parseInt(request.getParameter("txtStaffId"));
        Records a = new Records(id, type, reason, date, staffid);
        model.addAttribute("record", a);
        RecordDAO record = new RecordDAO();
        List<Records> ds = new ArrayList<Records>();
        ds = record.showRecord("");
        model.addAttribute("listRecord", ds);
        return "record";
    }

    @RequestMapping("update")
    public String update(ModelMap model, @ModelAttribute("record") Records a) {
        RecordDAO record = new RecordDAO();
        record.Update(a);
        List<Records> ds = new ArrayList<Records>();
        ds = record.showRecord("");
        model.addAttribute("listRecord", ds);
        return index(model);
    }

    @RequestMapping("btnDelete")
    public String delete(HttpServletRequest request, ModelMap model,
            @ModelAttribute("record") Records a) {
        String id = request.getParameter("txtId");
        RecordDAO record = new RecordDAO();
        record.Delete(id);
        List<Records> ds = new ArrayList<Records>();
        ds = record.showRecord("");
        model.addAttribute("listRecord", ds);
        Records b = new Records();
        b = ds.get(0);
        model.addAttribute("record", b);
        return index(model);
    }

    @RequestMapping("search")
    public String search(HttpServletRequest request, ModelMap model) {
        String name = request.getParameter("txtSearch");
        RecordDAO record = new RecordDAO();
        List<Records> ds = new ArrayList<Records>();
        ds = record.showRecord(name);
        model.addAttribute("listRecord", ds);
        Records a = new Records();
        a = ds.get(0);
        model.addAttribute("record", a);
        return "record";
    }

}
