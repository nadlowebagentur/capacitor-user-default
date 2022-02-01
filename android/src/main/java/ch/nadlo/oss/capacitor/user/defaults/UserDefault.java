package ch.nadlo.oss.capacitor.user.defaults;

import android.os.Bundle;
import android.util.Log;

public class UserDefault {
    final private String TAG = "UserDefaultImplement";

    Bundle appRestrictions = null;

    public void setAppRestrictions(Bundle bundle) {
        Log.v(TAG, "set appRestrictions");

        appRestrictions = bundle;
    }

    public String readValue(String key) {
        Log.v(TAG, appRestrictions.toString());

        if (appRestrictions != null && appRestrictions.containsKey(key)) {
            return appRestrictions.getString(key);
        }

        return "";
    }
}
