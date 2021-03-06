package com.mid.pro.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mid.pro.dao.MenuDAO;
import com.mid.pro.model.MenuFilesVO;
import com.mid.pro.model.MenuVO;
import com.mid.pro.util.FileSaver;

@Service
public class MenuService {

	@Inject
	private MenuDAO menuDAO;
	@Inject
	private FileSaver fileSaver;

	//list
	public List<MenuVO> menuList() throws Exception{

		return menuDAO.menuList();
	}
	//select One
	public MenuVO menuSelect(MenuVO menuVO) throws Exception{
		return menuDAO.menuSelect(menuVO);
	}
	//write
	public int menuWrite(MenuVO menuVO, MultipartFile file, HttpSession session) throws Exception{
		String realPath = session.getServletContext().getRealPath("resources/upload/menu");
		MenuFilesVO menufilesVO = new MenuFilesVO();
//		MenuVO menuVO2 = new MenuVO();
//		for (int i = 0; i < menuVO.size(); i++) {
			menuVO.setMenu_name(menuVO.getMenu_name());
			menuVO.setMenu_contents(menuVO.getMenu_contents());
			menuVO.setPrice(menuVO.getPrice());
			menuVO.setOrigin(menuVO.getOrigin());
			menuVO.setRest_num(menuVO.getRest_num());
			if (file.getSize() != 0) {
				String fileName = fileSaver.save(realPath, file);
				menufilesVO.setFname(fileName);
				menufilesVO.setMenu_num(menuVO.getMenu_num());
				menufilesVO.setOname(file.getOriginalFilename());
				int result = menuDAO.fileWrite(menufilesVO);
				if (result < 1) {
					throw new SQLException();
				}
//			}
//			menuVO.add(menuVO2);
		}
		int result = menuDAO.menuWrite(menuVO);

		return result;
	}
	//update
	public int menuUpdate(MenuVO menuVO, MultipartFile[] file, HttpSession session) throws Exception{
		String realPath = session.getServletContext().getRealPath("resources/upload/menu");
		MenuFilesVO menufilesVO = new MenuFilesVO();
		int result = menuDAO.menuUpdate(menuVO);

		for (MultipartFile multipartFile:file) {
			if (multipartFile.getSize() != 0) {
				String fileName = fileSaver.save(realPath, multipartFile);
				menufilesVO.setFname(fileName);
				menufilesVO.setMenu_num(menuVO.getMenu_num());
				menufilesVO.setOname(multipartFile.getOriginalFilename());
				result = menuDAO.fileWrite(menufilesVO);
				if (result < 1) {
					throw new SQLException();
				}
			}
		}
		return result;
	}
	//delete
	public int menuDelete(MenuVO menuVO) throws Exception{
		return menuDAO.menuDelete(menuVO);
	}
	//fileSelect
	public MenuFilesVO fileSelect(MenuFilesVO menufilesVO) throws Exception{
		return menuDAO.fileSelect(menufilesVO);
	}
	//fileDelete
	public int fileDelete(MenuFilesVO menufilesVO) throws Exception{
		return menuDAO.fileDelete(menufilesVO);
	}
	//summerFile
	public String summerFile(MultipartFile file, HttpSession session) throws Exception{
		String realPath = session.getServletContext().getRealPath("resources/upload/summerFile");
		return fileSaver.save(realPath, file);
	}
	//summerFileDelete
	public Boolean summerFileDelete(String file, HttpSession session) throws Exception{
		String realPath = session.getServletContext().getRealPath("resources/upload/summerFile");
		return fileSaver.fileDelete(realPath, file);
	}

}
