package org.alignwithme.masterdata;

import java.util.ArrayList;
import java.util.List;


public class Province extends ElectorateArea{

    

    private List<District> districts;

    public Province(String id, String name, ArrayList<District> districts){
        super(name, id);
        this.districts = districts;
    }

    public List<District> getDistricts(){
        return districts;
    }

    private String toStringDistricts(){
        String text = "";
        for (int i = 0; i < districts.size()-1; i++) {
            text += districts.get(i).getName() + ", ";
        }
        text += districts.get(districts.size()-1).getName();
        return text;
    }

    @Override
    public String toString() {
      return String.format(
          "Province[id=%s, name='%s', disctricts='%s']",
          id, name, this.toStringDistricts());
    }

    interface DistrictsOnly{
        List<District> getDistricts();
    }

}
