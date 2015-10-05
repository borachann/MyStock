package com.kosign.wecafe.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.forms.ProductForm;
import com.kosign.wecafe.services.CategoryService;
import com.kosign.wecafe.services.ProductService;
import com.kosign.wecafe.services.UserService;

@Controller
public class ProductController {

	@Inject
	private ProductService productService;

	@Inject
	private CategoryService categoryService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/admin/products", method = RequestMethod.GET)
	public String listAllProducts(Map<String, Object> model) {
		model.put("products", productService.getAllProducts());
		return "admin/productlist";
	}

	@RequestMapping(value = "/admin/products/rest", method = RequestMethod.GET, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Product> getAllProducts() {
		return productService.getAllProducts();
	}

	@RequestMapping(value = "/admin/productadd", method = RequestMethod.GET)
	public String productadd(Map<String, Object> model) {
		model.put("categories", categoryService.getAllCategories());
		return "admin/productadd";
	}

	@RequestMapping(value = "/admin/productlists", method = RequestMethod.GET)
	public @ResponseBody List<Product> getAllProductsJSON() {
		return productService.getAllProducts();
	}

	public Map<String, Object> getAllProduct() {
		Map<String, Object> m = new HashMap<>();
		try {
			m.put("item", productService.getAllProducts());
		} catch (Exception ex) {
			m.put("error", ex.getMessage());
		}
		return m;
	}

	@RequestMapping(value="/admin/product/add", method=RequestMethod.POST)
	public  @ResponseBody String addNewProduct(ProductForm form){
		
		String name = form.getImages().getOriginalFilename();
		System.out.println("name="+form.getProductname());
		if (!form.getImages().isEmpty()) {
            try {
                byte[] bytes = form.getImages().getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(form.getImages().getOriginalFilename())));
                stream.write(bytes);
                stream.close();
                return "You successfully uploaded " + name + "!";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name + " because the file was empty.";
        }
		
		
		
		
		/*List<Product> products = new ArrayList<>();
		if(session.getAttribute("products")!=null){
			products = (ArrayList<Product>)session.getAttribute("products");
		}
		products.add(product);*/		
		
		
		//System.out.println(product.getProductName());
		//User user = userService.findUserByUsername(getPrincipal());
		//System.out.println(user.getUsername());
		/*product.setCreatedBy(user);
		product.setLastUpdatedBy(user);
		return productService.addNewProduct(product);*/
		//return ((Product)session.getAttribute("product")).getProductName();
		//return false;
		
	}

	@RequestMapping(value = "/admin/product/{id}", method = RequestMethod.GET)
	public String updateProduct(@PathVariable("id") Long id, Map<String, Object> model) {
		Product product = productService.findProductById(id);
		model.put("product", product);
		model.put("categories", categoryService.getAllCategories());
		return "admin/productupdate";
	}

	@RequestMapping(value = "/admin/product/update", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody boolean updateProduct(@RequestBody Product product) {
		return productService.updateProduct(product);
	}

	@RequestMapping(value = "/admin/product/delete/{id}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody boolean deleteProduct(@RequestBody @PathVariable("id") Long id) {
		System.out.println("DELETE ID=" + id);
		return productService.deleteProduct(id);
	}

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

}

