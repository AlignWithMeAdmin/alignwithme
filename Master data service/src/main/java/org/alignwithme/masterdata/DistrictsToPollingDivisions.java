package org.alignwithme.masterdata;
import java.util.ArrayList;
import java.util.List;

public abstract class DistrictsToPollingDivisions {
    public static List<PollingDivision> Convert(List<District> list2){
        List<PollingDivision> newList = new ArrayList<PollingDivision>();
        for (District list : list2) {
            newList.addAll(list.getPollingDivisions());
        }
        return newList;
    }
}

