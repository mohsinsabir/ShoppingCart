package org.example.assignment02.utility;

import org.example.assignment02.entity.product;

import java.util.ArrayList;

public class productList {
    private ArrayList<product> productArrayList;

    public productList(){
        productArrayList = new ArrayList<product>();
    }
    public void insert(product product){
        productArrayList.add(product);
    }
    public boolean removeProduct(product product){
        return productArrayList.remove(product);
    }
    public ArrayList<product> getAllProducts(){
        return productArrayList;
    }


}
