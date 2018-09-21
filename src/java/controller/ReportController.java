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
import javax.servlet.http.HttpServletRequest;
import model.Departs;
import model.Records;
import model.ReportDepart;
import model.ReportPersonal;
import model.Staffs;
import model.Users;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping("/report/")
public class ReportController {

    @RequestMapping("index")
    public String index(ModelMap model) {
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
        UsersDAO user = new UsersDAO();
        List<Users> dsUser = new ArrayList<Users>();
        dsUser = user.showUsers("");
        int countUsers = dsUser.size();
        model.addAttribute("countUsers", countUsers);
        return "index";
    }

    @RequestMapping("show")
    public String show(ModelMap model, HttpServletRequest request) {
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
        String value = request.getParameter("btnShowStaff");
        model.addAttribute("value", value);

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
        UsersDAO user = new UsersDAO();
        List<Users> dsUser = new ArrayList<Users>();
        dsUser = user.showUsers("");
        int countUsers = dsUser.size();
        model.addAttribute("countUsers", countUsers);
        return "index";
    }

}
