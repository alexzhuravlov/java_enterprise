package com.hillel.bankserviceboot.service;

import com.hillel.bankserviceboot.dao.CardRepository;
import com.hillel.bankserviceboot.model.BankCard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarServiceImpl implements CardService {

    @Autowired
    private CardRepository cardRepository;

    @Override
    public List<BankCard> getCardsList() {
        return cardRepository.getCardsList();
    }

    @Override
    public BankCard getCard(int id) {
        return cardRepository.getCardById(id);
    }

    @Override
    public void save(BankCard bankCard) {
        cardRepository.save(bankCard);
    }

    @Override
    public void delete(int id) {
        cardRepository.delete(id);
    }
}
