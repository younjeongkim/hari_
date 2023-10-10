package com.smhrd.hari.service;

import com.smhrd.hari.dto.RegisterShopDTO;

public interface ShopService {
    int shopInsert(RegisterShopDTO registerShopDTO);

    RegisterShopDTO shopSelect(RegisterShopDTO registerShopDTO);

    RegisterShopDTO shopSelectOne(String bId);

    int shopUpdate(RegisterShopDTO registerShopDTO);
}
