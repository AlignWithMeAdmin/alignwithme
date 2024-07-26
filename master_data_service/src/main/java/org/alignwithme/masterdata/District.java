package org.alignwithme.masterdata;

import java.util.List;


public class District extends ElectorateArea{

    private List<PollingDivision> pollingDivisions;

    public District(String id, String name, List<PollingDivision> pollingDivisions){
        super(name, id);
        this.pollingDivisions = pollingDivisions;
    }

    public List<PollingDivision> getPollingDivisions(){
        return pollingDivisions;
    }

    private String toStringPollingDivisions(){
        String text = "";
        try {
            for (int i = 0; i < pollingDivisions.size()-1; i++) {
                text += pollingDivisions.get(i).getName() + ", ";
            }
            text += pollingDivisions.get((pollingDivisions.size()-1)).getName();
        } catch (NullPointerException e) {
            // TODO: handle exception
            System.out.println("Warning this.pollingDivisions is null");
        }
        return text;
    }

    @Override
    public String toString() {
      return String.format(
          "District[id=%s, name='%s', pollingDivisions='%s']",
          id, name, this.toStringPollingDivisions());
    }
    
}
