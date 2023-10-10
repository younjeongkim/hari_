package com.smhrd.hari.service;

import com.smhrd.hari.dto.RegisterShopDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopServiceImpl implements ShopService {
    @Autowired
    SqlSessionTemplate sql;

    @Override
    public int shopInsert(RegisterShopDTO registerShopDTO) {
        return sql.insert("Shop.shopInsert", registerShopDTO);
    }

    @Override
    public RegisterShopDTO shopSelect(RegisterShopDTO registerShopDTO) {
        return sql.selectOne("Shop.shopSelect", registerShopDTO);
    }

    @Override
    public RegisterShopDTO shopSelectOne(String bId) {
        return sql.selectOne("Shop.shopSelectOne", bId);
    }

    @Override
    public int shopUpdate(RegisterShopDTO registerShopDTO) {
        return sql.update("Shop.shopUpdate", registerShopDTO);
    }
}
