package com.example.cosmetic.model.order;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderItemDTO {
    private int orderItemId;
    private int productId; 
    private int amount; 
}
