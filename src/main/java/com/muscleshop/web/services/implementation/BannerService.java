package com.muscleshop.web.services.implementation;

import java.util.List;

import com.muscleshop.web.services.IBannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muscleshop.web.dao.IBannerDao;
import com.muscleshop.web.models.Banner;

@Service
public class BannerService implements IBannerService {

	@Autowired
	private IBannerDao bannerDao;

	private Integer estadoId = 1;
	public List<Banner> obtenerBanners() {
		return bannerDao.findAllByEstado_Id(estadoId);
	}
}
