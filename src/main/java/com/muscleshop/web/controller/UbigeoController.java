package com.muscleshop.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.muscleshop.web.models.Ubigeo;
import com.muscleshop.web.services.IUbigeoService;

@Controller
@RequestMapping("/ubigeo/")
public class UbigeoController {
	
	@Autowired
	IUbigeoService IUbigeoService;

	@GetMapping("listaRegion")
	@ResponseBody
	public List<String> verRegion(){
		return IUbigeoService.listaRegion();
	}
	
	@GetMapping("listaProvincia")
	@ResponseBody
	public List<String> verProvincia(String region){
		return IUbigeoService.listaProvincia(region);
	}

	@GetMapping("listaDistrito")
	@ResponseBody
	public List<Ubigeo> verDistrito(String region, String provincia){
	    List<Ubigeo> distritos = IUbigeoService.listaDistrito(region, provincia);
	    return distritos;
	}

}
