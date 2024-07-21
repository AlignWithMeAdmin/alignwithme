package org.alignwithme.masterdata;

public class PollingDivision extends ElectorateArea{


    public PollingDivision(String id, String name) {
        super(name, id);
    }

    @Override
    public String toString() {
      return String.format(
          "PollingDivision[id=%s, name='%s']", id, name);
    }    
}
