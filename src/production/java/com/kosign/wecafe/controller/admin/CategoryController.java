package com.kosign.wecafe.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.Category;
import com.kosign.wecafe.entities.User;
import com.kosign.wecafe.forms.CategoryForm;
import com.kosign.wecafe.services.CategoryService;
import com.kosign.wecafe.services.UserService;

@Controller
public class CategoryController {
	
	@Inject
	CategoryService categoryService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/admin/categorylist")
	public String getAllCategories(Map<String, Object> model){
		model.put("categories", categoryService.getAllCategories());
		return "admin/categorylist";
	}
	
	@RequestMapping(value="/admin/categoryadd")
	public String categoryadd(){
		return "admin/categoryadd";
	}
	
	@RequestMapping(value="/admin/category/add", method=RequestMethod.POST)
	public  @ResponseBody Boolean addNewCategory(CategoryForm form, Principal principal){
		
		String name = form.getImage().getOriginalFilename();
		if (!form.getImage().isEmpty()) {
            try {
                byte[] bytes = form.getImage().getBytes();
                UUID uuid = UUID.randomUUID();
                String randomUUIDFileName = uuid.toString();
                
                String extension = name.substring(name.lastIndexOf(".")+1);
                String webappRoot = new File("C:\\Users\\PENHCHET\\git\\wecafe\\webapp").getAbsolutePath() ; //servletContext.getRealPath("/");
                String fileName = File.separator +"resources"
                        		+ File.separator + "images" + File.separator + "categories" + File.separator
                        		+ randomUUIDFileName+"."+extension;
                
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(webappRoot+fileName));
                stream.write(bytes);
                stream.close();
                System.out.println( "You successfully uploaded " + name + "!");
                
                User user = userService.findUserByUsername(principal.getName());
                Category category = new Category();
                category.setCatName(form.getCategoryName());
                category.setCreatedBy(user);
                category.setImg(randomUUIDFileName+"."+extension);
                category.setCreatedDate(new Date());
                category.setStatus(true);
                
        		System.out.println(user.getUsername());
        		return categoryService.addNewCategory(category);
            } catch (Exception e) {
            	System.out.println(e.getMessage());
                System.out.println("You failed to upload " + name + " => " + e.getMessage());
                return false;
            }
        } else {
            System.out.println("You failed to upload " + name + " because the file was empty.");
            return false;
        }
		
	}
	
	@RequestMapping(value = "/admin/category/update/{id}", method = RequestMethod.GET)
	public String updateProduct(@PathVariable("id") Long id, Map<String, Object> model) {
		model.put("category", categoryService.findCategoryById(id));
		return "admin/categoryupdate";
	}
	
	@RequestMapping(value="/admin/category/update", method=RequestMethod.POST)
	public  @ResponseBody Boolean updateCategory(CategoryForm form, Principal principal){
		
		String name = form.getImage().getOriginalFilename();
		if (!form.getImage().isEmpty()) {
            try {
                byte[] bytes = form.getImage().getBytes();
                UUID uuid = UUID.randomUUID();
                String randomUUIDFileName = uuid.toString();
                
                String extension = name.substring(name.lastIndexOf(".")+1);
                String webappRoot = new File("C:\\Users\\PENHCHET\\git\\wecafe\\webapp").getAbsolutePath() ; //servletContext.getRealPath("/");
                String fileName = File.separator +"resources"
                        		+ File.separator + "images" + File.separator + "categories" + File.separator
                        		+ randomUUIDFileName+"."+extension;
                
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(webappRoot+fileName));
                stream.write(bytes);
                stream.close();
                System.out.println( "You successfully uploaded " + name + "!");
                
                //User user = userService.findUserByUsername(principal.getName());
                Category category = categoryService.findCategoryById(form.getCategoryId());
                category.setCatName(form.getCategoryName());
                //category.setLastUpdatedBy(user);
                category.setLastUpdatedDate(new Date());
                category.setImg(randomUUIDFileName+"."+extension);
        		//System.out.println(user.getUsername());
        		return categoryService.updateCategory(category);
            } catch (Exception e) {
            	System.out.println(e.getMessage());
                System.out.println("You failed to upload " + name + " => " + e.getMessage());
                return false;
            }
        } else {
            System.out.println("You failed to upload " + name + " because the file was empty.");
            return false;
        }
		
	}
	
	@RequestMapping(value="/admin/category/delete/{id}" , method=RequestMethod.POST)
	public @ResponseBody Boolean deleteCategory(@PathVariable Long id, Principal principal){
		try{
			Category category = new Category();
			category.setCatId(id);
			//category.setLastUpdatedBy(userService.findUserByUsername(principal.getName()));
			return categoryService.deleteCategory(category);
			
		}catch(Exception e){
			System.out.println("You failed to delete the category.");
			e.printStackTrace();
		}
		return false;
		
	}
}
