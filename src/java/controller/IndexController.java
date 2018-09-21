/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;



import DAO.DepartDAO;
import java.util.ArrayList;
import java.util.List;
import model.Departs;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Admin
 */


@Controller
public class IndexController {

    @RequestMapping("index")
    public String index() {
        return "index";
    }

}
